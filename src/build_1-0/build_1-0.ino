//TODO:  Setup instructions


// ---- Libraries ----
// -- LEDs --
#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
 #include <avr/power.h> // Required for 16 MHz Adafruit Trinket
#endif

#include <EEPROM.h>

// -- Top Level IO --
const byte PIN_LED=PIN_PA7;//D1 is physical pin 6
const byte LED_ROWS=4;
const byte LED_COLS=24;
const byte LED_COUNT=LED_ROWS*LED_COLS;//note: max 255 LEDs in byte
neoPixelType STRIP_TYPE=NEO_GRBW + NEO_KHZ800;
Adafruit_NeoPixel strip = Adafruit_NeoPixel(LED_COUNT, PIN_LED, STRIP_TYPE);
const byte DEFAULT_BRIGHTNESS=16;
const byte MIN_BRIGHTNESS=4;
const byte MAX_BRIGHTNESS=255;
const byte BOOT_CHAPTER_EEPROM_ADDRESS=0;
const byte ANALOG_AVERAGE=32;//number of user input brightness readings to average to form final displayed brightness
//PRECON: BRIGHTNESS_AVERAGE readings will be taken before exiting from boot.  Otherwise brightness will
//default to less and display may appear dim or black
byte brightness_index=0;//index of the next brightness reading.
word brightness_measurements[ANALOG_AVERAGE];
const byte MAGNET_THRESHOLD=16;//counts (LSB = 5V/1024) that the
//magnetic measurement needs to change from the boot-up value before a user command is registered
int magnetic_average=0;//average magnetic reading, calibrated at boot up
const word MAGNET_STATE_CHANGE_MS=512;//collect user input for this long before changing state
unsigned long magnet_timestamp_ms=0;//time the user started changing the device state
byte magnet_previous_state=0;//state that the user is trying to update the device to

// -- User IO --
const byte PIN_TOUCH=PIN_PB0;//periphreal touch controller button
const byte PIN_MAGNET=PIN_PA3;
const byte PIN_BRIGHTNESS=PIN_PA2;
const byte PIN_CONFIG_UPDATE_DAILY=PIN_PA6;//SW2 on DIP switch
const byte PIN_CONFIG_DIAGNOSTIC=PIN_PA5;//SW3 on DIP switch
const byte PIN_CONFIG_TESSELLATE=PIN_PA4;//SW4 on DIP switch

// ---- State Machines ----
// -- Book --
//The program is structured like a book where there is an introduction "setup()"
//followed by reading page after page (frame render) in each chapter "loop()"
#define CHAPTER_ERROR 254
#define CHAPTER_STRIP_TEST 255
#define CHAPTER_MONOCHROME 0
#define CHAPTER_RAINBOW 1
#define CHAPTER_SCATTER_BLINK 2
#define CHAPTER_FIREWORKS 3
#define CHAPTER_MATRIX_RAIN 4
#define CHAPTER_SNAKE 5 // consider refactor with multiple snake - white background washes out snake.  also see issue with snake going over its own tail
#define CHAPTER_RAINBOW_RIPPLE 6
#define CHAPTER_PORTAL 7
#define CHAPTER_METEOR 8
#define CHAPTER_CHRISTMAS 9
#define CHAPTER_FLAG_AMERICAN 10
const byte LAST_CHAPTER=CHAPTER_CHRISTMAS;//highest indexed chapter in the book
byte chapter_id=CHAPTER_STRIP_TEST; //set to 255 to run LED check at boot, set to 0 to skip
bool is_go_to_new_chapter=false;//private flag used for tracking state change to new chapter
unsigned long chapter_timestamp_ms=0;//used for various chapter state machines.  Note wrap over after ~50 days
byte led_state[LED_ROWS][LED_COLS];//general-purpose state machine allocation for all chapters to share
unsigned long book_frame_number=0;//number of iterations through the current loop

// -- Chapter --
// - Snake - 
byte snake_row=0;//position of head
byte snake_col=0;
const byte STATE_SNAKE_STEP_FORWARD=32;//when the stake body part state goes from this 0 up to this point, step the snake forward one pixel
byte snake_dir=B00000100;//8 bit array: lowest 4 bits are previous direction MSB < North/East/South/West > LSB

void setup() {
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_MAGNET,INPUT);
  pinMode(PIN_BRIGHTNESS,INPUT);
  pinMode(PIN_CONFIG_UPDATE_DAILY,INPUT_PULLUP);
  pinMode(PIN_CONFIG_DIAGNOSTIC,INPUT_PULLUP);
  pinMode(PIN_CONFIG_TESSELLATE,INPUT_PULLUP);
  strip.begin();
  strip.setBrightness(DEFAULT_BRIGHTNESS);
  strip.clear();
  strip.show();
  chapter_timestamp_ms=millis();
  setupMagnet();
  setupMagnet();//second run to allow analog to settle after LED write (not sure if value-added, but is quick to execute)
}

//state machine that executes every frame of the animation:
//1. render the frame of the current chapter
//2. flush frame buffer to LEDs
//3. update the chapter if the current chapter has finsihed or if the user provides input
void loop() {
  bool is_booted=false;
  switch(chapter_id)
  {//note the order the chapters are executed is determined by the value of the globally defined constants, not the order in this switch case
    case CHAPTER_STRIP_TEST: is_booted=strip_test(is_go_to_new_chapter); break;
    case CHAPTER_MONOCHROME: monochrome(is_go_to_new_chapter); break;
    case CHAPTER_RAINBOW: rainbow(is_go_to_new_chapter); break;
    case CHAPTER_SCATTER_BLINK: scatter_blink(is_go_to_new_chapter); break;
    case CHAPTER_SNAKE: snake(is_go_to_new_chapter); break;
    case CHAPTER_RAINBOW_RIPPLE: rainbow_ripple(is_go_to_new_chapter); break;
    case CHAPTER_MATRIX_RAIN: matrix_rain(is_go_to_new_chapter,book_frame_number); break;
    case CHAPTER_FLAG_AMERICAN: flag_american(is_go_to_new_chapter); break;
    case CHAPTER_FIREWORKS: fireworks(is_go_to_new_chapter); break;
    case CHAPTER_PORTAL: portal(is_go_to_new_chapter); break;
    case CHAPTER_METEOR: meteor(is_go_to_new_chapter); break;
    case CHAPTER_CHRISTMAS: generic_blink(is_go_to_new_chapter,3); break;
    default: error(is_go_to_new_chapter); break;//any unpopulated (no case statement) chapters are replaced with error display.  Add a chapter_id++; here to hto fix the issue
  }
  updateChapter(is_booted);
}

// ---- Helper Methods ----
//given pixel ID, get the corresponding row within the display matrix
byte getRow(byte iter)
{
  return iter/LED_COLS;
}

byte getCol(byte iter)
{
  return (getRow(iter)%2) ? (LED_COLS-(iter%LED_COLS)-1) : (iter%LED_COLS);//counting reverses row-to-row
}

// ---- Chapter Navigation, User IO ----
//while user input, display red/green depending on strength of user input
//if more than X seconds of contiguous input, then change +- chapter
void updateChapter(bool is_booted)
{
  book_frame_number++;//update frame counter every frame
  byte chapter_delta=updateMagnet();
  displayMagnet();
  updateBrightness();
  strip.show();
  //is_done |= check user input
  if(is_booted)
  {
    chapter_id=getBootChapter();//++;
    is_go_to_new_chapter=true;
  }
  else if(chapter_delta!=0)//if user input, then inc/dec chapter index
  {
    if(chapter_id==0 && chapter_delta==255) chapter_id=LAST_CHAPTER;
    else{
      chapter_id+=chapter_delta;
      chapter_id%=LAST_CHAPTER+1;//break into two lines - note compiler may alter order of operations?
    }
    is_go_to_new_chapter=true;
    setBootChapter(chapter_id);
  }else is_go_to_new_chapter=false;
  if(millis()<chapter_timestamp_ms) chapter_timestamp_ms=0;//brute force fix to remedy 50 day wrap around...
}

bool isBooting()
{
  return chapter_id==CHAPTER_ERROR || chapter_id==CHAPTER_STRIP_TEST;
}

//allow for user input on brightness
void updateBrightness()
{//getBrightness already declared in neoPixel library
  byte brightness_setting=getInputBrightness();
  //displayDebug(brightness_setting/4);
  //displayDebug(chapter_id);
  //displayDebug(getBootChapter());
  strip.setBrightness(brightness_setting);
}

byte getInputBrightness()
{
  //pre-empteively fill analog readings so an average can be taken later when out of boot mode
  brightness_measurements[brightness_index]=1024-analogRead(PIN_BRIGHTNESS);//10 bit reading - prefer CW to increase brightness
  brightness_index++;
  brightness_index%=ANALOG_AVERAGE;
  if(isBooting())
    return DEFAULT_BRIGHTNESS;//static setting during boot
  //allow for more complicated user IO once out of boot
  long brightness_setting=0;
  for(byte iter=0;iter<ANALOG_AVERAGE;iter++)
  {
    brightness_setting+=brightness_measurements[brightness_index];
  }
  brightness_setting>>=2;//convert square of 10-bit values to 8-bit value
  brightness_setting/=ANALOG_AVERAGE;//convert sum to average by dividing by number of samples
  brightness_setting=brightness_setting*brightness_setting;//square brightness is approximation of user logarithmic perception
  brightness_setting>>=8;//re-scale to 8-bit range "square root"
  
  brightness_setting=max(MIN_BRIGHTNESS,brightness_setting);
  brightness_setting=min(MAX_BRIGHTNESS,brightness_setting);
  return brightness_setting;
}

//call once on boot
void setupMagnet()
{
  magnetic_average=0;
  for(byte iter=0;iter<ANALOG_AVERAGE;iter++) magnetic_average+=analogRead(PIN_MAGNET);
  magnetic_average/=ANALOG_AVERAGE;
}

void displayMagnet()
{
  if(magnet_previous_state==0) return;//no visualization if no change in state
  float threshold=(millis()-magnet_timestamp_ms)/(1.0*MAGNET_STATE_CHANGE_MS);
  threshold=(0+(LED_COLS/4))*threshold;
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=getRow(iter);
    byte col=getCol(iter);
    bool is_red=magnet_previous_state>128;
    if(col<(LED_COLS/4))
    {
      if(col>threshold) strip.setPixelColor(iter,strip.Color(is_red?255:0,is_red?0:255,0,0));
      else strip.setPixelColor(iter,strip.Color(0,0,0,0));
      /*if(row<(LED_ROWS/2))
      {
        //if(col<(LED_COLS/4)*
        float threshold=(millis()-magnet_timestamp_ms)/(1.0*MAGNET_STATE_CHANGE_MS);
        threshold=(0+(LED_COLS/4))*threshold;
        if(col<threshold && !is_red) strip.setPixelColor(iter,strip.Color(0,255,0,0));
        else if(((LED_COLS/4)-col)>threshold && is_red) strip.setPixelColor(iter,strip.Color(255,0,0,0));
        else strip.setPixelColor(iter,strip.Color(0,0,0,0));
      }else
        strip.setPixelColor(iter,strip.Color(is_red?255:0,is_red?0:255,0,0));
      */
    }
  }
}

//1 for ++ chapter, 255 for -- chapter
byte updateMagnet()
{
  if(isBooting()) return 0;//note: WAS return;, SHOULD HAVE BEEN return 0;
  //was returning garbage value, messing with boot sequence and EEPROM booted chapter value
  byte next_state=0;
  if((analogRead(PIN_MAGNET)-magnetic_average)>MAGNET_THRESHOLD) next_state=1;
  if((magnetic_average-analogRead(PIN_MAGNET))>MAGNET_THRESHOLD) next_state=255;
  if(next_state!=magnet_previous_state)
  {
    magnet_previous_state=next_state;
    magnet_timestamp_ms=millis();//start timer ticking
  }
  unsigned long delta_ms=millis()-magnet_timestamp_ms;
  if(delta_ms>(1<<12)) delta_ms=0;//assume user input<1 hour, ignore errors when millis() wraps over
  if(delta_ms>MAGNET_STATE_CHANGE_MS)
  {
    magnet_timestamp_ms=millis();
    magnet_previous_state=0;//set state back to default
    return next_state;
  }
  return 0;//no state change
}

//after power cycle, return the device to the last commanded chapter
byte getBootChapter()
{
  byte boot_chapter=EEPROM.read(BOOT_CHAPTER_EEPROM_ADDRESS);
  if(boot_chapter==CHAPTER_STRIP_TEST) //return 0;
return CHAPTER_METEOR;//zzstophere
  boot_chapter%=(LAST_CHAPTER+1);//ensure selected boot chapter is within range of permissable chapters
  return boot_chapter;
}

//each time the user changes the chapter, save state to be fetched at next boot
void setBootChapter(byte boot_chapter)
{
  delay(100);//debug safety check to avoid high speed IO to EEPROM (limited write cycles)
  if(boot_chapter<=LAST_CHAPTER)//only save valid chapters - skip boot and error cases
    EEPROM.put(BOOT_CHAPTER_EEPROM_ADDRESS,boot_chapter);
}

void displayDebug(byte val)
{
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    bool is_green=iter<val;
    bool is_red=!is_green;
    strip.setPixelColor(iter, strip.Color(is_red?255:0,is_green?255:0,0,0));
  }
  strip.show();
}

// ---- Animations ----
//boot-up animation to allow the user to verify the proper operation of all LEDs
//red, green, blue, white flash on all LEDs
bool strip_test(bool is_new_chapter)
{
  byte led_color=(millis()-chapter_timestamp_ms)/512;//change color every x milliseoncds
  if(led_color>=4) return true;
  strip.fill(strip.Color(led_color==0?255:0,
                         led_color==1?255:0,
                         led_color==2?255:0,
                         led_color==3?255:0),0,LED_COUNT);
  return false;
}

//hold a static white color
void monochrome(bool is_new_chapter)
{
  //strip.fill(strip.Color(millis()%8,0,millis()%8),0,LED_COUNT);
  strip.fill(strip.gamma32(strip.Color(0,105,176,0)),0,LED_COUNT);
  //strip.fill(strip.Color(0,105,176),0,LED_COUNT);
}

//display a static pattern where the display is broken into vertical quarters by color
void error(bool is_new_chapter)
{
  for(byte iter=0;iter<LED_COUNT;iter++)
  {//left to right quarters of display: white, red, green, blue
    byte col=getCol(iter);
    /*bool is_red=col<(LED_COLS/4);
    bool is_green=!is_red && (col<(LED_COLS/2));
    bool is_blue= !is_red && !is_green && (col<(3*(LED_COLS/4)));
    bool is_white=!is_red && !is_green && !is_blue;*/
    bool is_white=col<(LED_COLS/4);
    bool is_red=  !is_white && (col<(LED_COLS/2));
    bool is_green=!is_white && !is_red && (col<(3*(LED_COLS/4)));
    bool is_blue= !is_white && !is_red && !is_green;
    strip.setPixelColor(iter, strip.Color(is_red?255:0,
                                          is_green?255:0,
                                          is_blue?255:0,
                                          is_white?255:0));
  }
}

//all LEDs cycle smoothly though the rainbow  red --> green --> blue
void rainbow(bool is_new_chapter)
{
  uint16_t hue=millis();//*8;//set higher multiplication to cycle LEDs faster.  *16 is cycling full rainbow every ~8 seconds
  uint8_t  sat = 255;
  uint8_t  val = 255;
  strip.fill(strip.gamma32(strip.ColorHSV(hue, sat, val)),0,LED_COUNT);
}

//inspired by:
//  https://www.adafruit.com/product/3444 demo pattern
//sinusoid magnitude is mapped to LED hue
void rainbow_ripple(bool is_new_chapter)
{
  int phase_tms_period=8191*2;//(1<<13);
  float phase_tms=(PI*2*(millis()%phase_tms_period))/phase_tms_period;
  //int time_reversal_period=(1<<14)+(1<<10)+(1<<7);
  //float time_reversal_phase=(PI*2*(millis()%time_reversal_period))/time_reversal_period;
  int time_reversal_period_1=11633;//(1<<14);//+(1<<10);
  int time_reversal_period_2=33529;//(1<<15);//+(1<<9);
  float time_reversal_phase_1=(PI*2*(millis()%time_reversal_period_1))/time_reversal_period_1;
  float time_reversal_phase_2=0.5*(PI*2*(millis()%time_reversal_period_2))/time_reversal_period_2;
  float time_reversal_phase=(sin(time_reversal_phase_1)+sin(time_reversal_phase_2))*PI;
  //phase_tms=sin(phase_tms)*PI;
  int spread_period=25679;//time_reversal_period_1*2;//(1<<14)+(1<<13);
  float spread=2*sin(PI+PI*2*(millis()%spread_period)/spread_period);
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=getRow(iter);
    byte col=getCol(iter);
    float phase_x=(PI*2*col)/(LED_COLS*(3+spread));
    float temp=sin(phase_x+phase_tms+time_reversal_phase);
    //float hue_sin=(temp<0?-1:1)*temp*temp*0.5+0.5;//clip to 0-1
    float hue_sin=sin(phase_x+phase_tms+time_reversal_phase)*0.5+0.5;//clip to 0-1
    uint16_t hue=0xFFFF*hue_sin;
    uint8_t  sat = 255;
    uint8_t  val = 255;
    strip.setPixelColor(iter,strip.gamma32(strip.ColorHSV(hue, sat, val)));
  }
}

//illuminate LEDs for a random period of time
//https://www.youtube.com/watch?v=H1k7mxhWQ5Q
void scatter_blink(bool is_new_chapter)
{
  generic_blink(is_new_chapter,0);
}

//allow for multiple configurations of colors
//mode = 0, slowly changing blinking rainbow on black background
//mode = 1, slowly changing blinking rainbow on white background
//mode = 2, orange/purple halloween colors
//mode = 3, red/green/white christmas colors
void generic_blink(bool is_new_chapter,byte mode)
{
  byte color_count=2;
  uint32_t color_1=strip.gamma32(strip.ColorHSV(millis(), 255, 255));//slowly changing rainbwo color
  uint32_t color_2=strip.Color(0,0,0,0);
  uint32_t color_3=strip.Color(0,0,0,0);
  switch(mode)
  {
    default: break;
    case 1:
      color_2=strip.Color(0,0,0,255);
    break;
    case 2:
      color_1=strip.gamma32(strip.Color(255,165,0,0));
      color_2=strip.gamma32(strip.Color(255,0,255,0));
    break;
    case 3:
      color_count=3;
      color_1=strip.Color(255,0,0,0);
      color_2=strip.Color(0,255,0,0);
      color_3=strip.Color(255,255,255,255);
     break;
  }
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=getRow(iter);//iter/LED_COLS;
    byte col=getCol(iter);//iter%LED_COLS;
    byte my_cycle;
    if(is_new_chapter)
    {
      byte max_cycle=255;
      byte min_cycle=128;
      byte my_cycle=random(min_cycle,max_cycle);
      led_state[row][col]=my_cycle;
    }
    my_cycle=led_state[row][col];
    byte my_state=(millis()/(color_count==2?4:16))%my_cycle;
    bool is_color_1=my_state<(my_cycle/color_count);
    bool is_color_2=(my_state/2)<(my_cycle/color_count);
    if(is_color_1) strip.setPixelColor(iter, color_1);
    else if((color_count==2 && !is_color_1) || is_color_2) strip.setPixelColor(iter, color_2);
    else strip.setPixelColor(iter, color_3);
  }
}

//allow for groups of LEDs to move horizontally as one
//https://www.youtube.com/watch?v=H1k7mxhWQ5Q
void strip_blink(bool is_new_chapter)
{
  
}

//orange animation along bottom in front of blue sky, occasional lightening
//orange "circles" (groups of 2 pixels) animate from one zie to the other
void halloween(bool is_new_chapter)
{
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=getRow(iter);//iter/LED_COLS;
    byte col=getCol(iter);//iter%LED_COLS;
    if(is_new_chapter)
    {
      if(row==0) led_state[row][col]=0;
      //else if(row==4) led_state[row][col]=;
    }
  }
}

//american flag, but the white elements twinkle occassionally
void flag_american(bool is_new_chapter)
{
  randomSeed(millis()/64);//rather than adding a 64 millisecond delay between frames
  //make frames generated within the same 64 ms appear the same
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=getRow(iter);//iter/LED_COLS;
    byte col=getCol(iter);//iter%LED_COLS;
    /*const int period_ms_1=(1<<14)+(1<<7);
    const float period_col_1=LED_COLS;
    float wave_1=sin(-(millis()*2*PI/(period_ms_1*1.0)) + (col*2*PI/period_col_1));
    const int period_ms_2=1<<12;
    const float period_col_2=LED_COLS/2;
    float wave_2=sin(-(millis()*2*PI/(period_ms_2*1.0)) + (col*2*PI/period_col_2));
    float wave_sum=wave_1*.4+wave_2*.15+.6;
    wave_sum=min(wave_sum,1.0);
    wave_sum=max(wave_sum,0.0);*/
    if(row<(LED_COLS/2) && col<(LED_COLS/2))
    {//top left blue
      strip.setPixelColor(iter, strip.Color(0,40,104,0));//random twinkle
    }else if(row%2==0){//red stripe
      strip.setPixelColor(iter, strip.Color(191,0,48,0));//random twinkle
    }else{//white stripe
      strip.setPixelColor(iter, strip.Color(0,0,0,255));//random twinkle
    }
    /*if(row<(LED_COLS/2) && col<(LED_COLS/2))
    {//top left blue
      strip.setPixelColor(iter, strip.Color(0,wave_sum*40,wave_sum*104,0));//random twinkle
    }else if(row%2==0){//red stripe
      strip.setPixelColor(iter, strip.Color(wave_sum*191,0,wave_sum*48,0));//random twinkle
    }else{//white stripe
      strip.setPixelColor(iter, strip.Color(0,0,0,wave_sum*255));//random twinkle
    }*/
    /*if(row<(LED_COLS/2) && col<(LED_COLS/2))
    {//top left blue
      strip.setPixelColor(iter, strip.Color(0,30,78,0));
      if(!random(100)) strip.setPixelColor(iter, strip.Color(0,40,104,0));//random twinkle
    }else if(row%2==0){//red stripe
      strip.setPixelColor(iter, strip.Color(136,0,29,0));
      if(!random(100)) strip.setPixelColor(iter, strip.Color(191,0,48,0));//random twinkle
    }else{//white stripe
      strip.setPixelColor(iter, strip.Color(0,0,0,191));
      if(!random(100)) strip.setPixelColor(iter, strip.Color(0,0,0,255));//random twinkle
    }*/
  }
}

//
void fire(bool is_new_chapter)
{
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=getRow(iter);//iter/LED_COLS;
    byte col=getCol(iter);//iter%LED_COLS;
  }
}

//fireworks state machine:
//  

//Dim white background by default
//randomly illuminate a pixel full white briefly, then turn a color, and then slowly fade that color
//each new pixel to illuminate fades to a color next in the rainbow
//presumably the most complex chapter (measured by compiled code size)
void fireworks(bool is_new_chapter)
{
  //every 2^16 iterations of 
  byte FRAME_RATE_DIVISOR=16;//ms between frames
  unsigned long new_state=millis()/FRAME_RATE_DIVISOR;
  unsigned long old_state=chapter_timestamp_ms/FRAME_RATE_DIVISOR;
  boolean is_update_state=(new_state!=old_state) || is_new_chapter;//if rendering an existing frame, skip the render
  //randomSeed(millis()/FRAME_RATE_DIVISOR);//rather than using a delay statement, allow frames to be generated identially if they occur within multiples of FRAME_RATE_DIVISOR
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=getRow(iter);//iter/LED_COLS;
    byte col=getCol(iter);//iter%LED_COLS;
    if(is_new_chapter) led_state[row][col]=255;
    if(is_update_state)
    {
      if(led_state[row][col]!=255)
        led_state[row][col]++;//increment state for LEDs that are in the midst of flashing
      else if(!random(128))//randomly select pixel to begin blink
        led_state[row][col]=0;
    }
    strip.setPixelColor(iter, get_firework_color(led_state[row][col],FRAME_RATE_DIVISOR));
  }
  if(is_update_state) chapter_timestamp_ms=millis();
  //strip.fill(strip.Color(0,255,255,0),0,LED_COUNT);
}

//base on a byte, cycle through states (states increase 0 to 255):
// brief flash
// show full brightness color (each flash, assign a new color slightly later in the rainbow to this pixel)
// dim this initial color over time to the background color
//given current state and state step size (in ms), back-compute the original color when flash first occurred, then fade it based on time elapsed since inital flash
//recomputing at each frame vs storing a dedicated list of uint32_t colors saves RAM
//note that strip has internal memory of the color state, but retrieval has off-by-one errors at full brightness
//and has other issues when brightness is lower (strip is not reliable for color retrieval)
uint32_t get_firework_color(byte pixel_state,byte FRAME_RATE_DIVISOR)
{
  uint32_t background_color=strip.Color(0,0,0,0);//64);
  if(pixel_state>=230) return background_color;//background color all fireworks fade into
  if(pixel_state<2) return strip.Color(255,255,255,255);//initial burst of white
  uint16_t hue=(millis()-FRAME_RATE_DIVISOR*pixel_state)*4;//set higher multiplication factor to cycle color faster.  *16 is cycling full rainbow every ~8 seconds
  uint8_t  sat = 255;
  uint8_t  val = 255-pixel_state;
  uint32_t foreground_color=strip.gamma32(strip.ColorHSV(hue, sat, val));
  //if(pixel_state<127)
  //  return strip.Color(255,0,0,0);//todo
  return background_color | foreground_color;//bit-wise OR of white background and RGB foreground
}

/*
//a combination of red, green and blue never looks at nice as a pure white led
//given an rgb triple (and any existing background white), subtract out the shared rgb brightness and replace it with white
//return the resultant rgbw color
uint32_t rgb_to_white(uint32_t color_in)
{
  byte white=color_in>>24;
  byte red=color_in>>16;
  byte green=color_in>>8;
  byte blue=color_in;
  byte min_color=min(min(red,green),blue);
  min_color=min(min_color,255-white);//only allow a shift from RGB to white that does NOT cause roll-over on the white byte
  return strip.Color(red-min_color,green-min_color,blue-min_color,min_color+white);
}
*/

//initial white flame from left of screen proceeds to the right
//  white fades to yellow, fades to red, fades to black.
//  Allow for flicking of tail by each pixel have unique decay rate
//inner workings: contains two meteors (two timestamps of start times)
//  one col ahead of each meteor is set to random numbers (decay rate)
//todo: move this up to the top of the file
const unsigned long METEOR_PERIOD_TMS=2048;//milliseconds between new meteor appearing at left of screen
const float METEOR_MAX_DECAY_RATE=0.85;
const float METEOR_MIN_DECAY_RATE=0.25;
void meteor(bool is_new_chapter)
{
  float meteor_col_1=getMeteorCol(millis());
  float meteor_col_2=getMeteorCol(millis()+METEOR_PERIOD_TMS);
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=getRow(iter);//iter/LED_COLS;
    byte col=getCol(iter);//iter%LED_COLS;
    if(is_new_chapter || col==((byte)meteor_col_1+1) || col==((byte)meteor_col_2+1)) led_state[row][col]=random(255);
    else strip.setPixelColor(iter, getMeteorColor(led_state[row][col],col,meteor_col_1) |
                                   getMeteorColor(led_state[row][col],col,meteor_col_2));
  }
}

//allow for fractional column returned values so state of downstream LEDs can be determined more precisely
float getMeteorCol(unsigned long meteor_time_tms)
{
  meteor_time_tms%=(2*METEOR_PERIOD_TMS);
  return (LED_COLS*1.0*meteor_time_tms)/(1.0*METEOR_PERIOD_TMS);
}

//return 0 if too far away from meteor, or if meteor is to the left of the curretn position
//  that way, this helper method can be called twice (for each meteor) and the results OR'd together
uint32_t getMeteorColor(byte led_decay_rate,byte col,float meteor_col)
{
  //step 1: get this LED's state give the position of the meteors, this led's position, and led decay rate
  //step 2: get this LED's color given its state
  if(col>meteor_col) return 0;
  //now: col<=meteor_col
  float this_led_decay_rate=((led_decay_rate*1.0)/255.0)*
    (METEOR_MAX_DECAY_RATE-METEOR_MIN_DECAY_RATE)+METEOR_MIN_DECAY_RATE;
  //ratio of the distance between meteors (defined to be 1.0) during which the pixel becomes fully extinguished
  float this_led_position=(meteor_col-col)/LED_COLS;
  if(this_led_position>this_led_decay_rate) return 0;//too far away and is therefore OFF
  //now: this_led_position is between 0 and <this_led_decay_rate>
  if(this_led_position<(1.0/LED_COLS)) return strip.Color(255,255,255,255);
  //if(this_led_position<(2.0/LED_COLS)) return strip.Color(0,0,0,255);
  this_led_position/=this_led_decay_rate;//normalize between 0.0 (starting state) and 1.0 (ending state)
  uint16_t hue=(uint16_t)((this_led_position-0.15)*0xFFFF/5);//hue range from 0 (red) to yellow ~(1/6)
  uint8_t  sat = 255;
  float TAIL_DECAY_RATIO=0.3;//ratio of the tail that is transitioning from 100% value to 0% value
  uint8_t  val = (this_led_position<(1-TAIL_DECAY_RATIO))?//if first portion of tail?
                  255://full brightness
                  //0.81 --> ~0.95
                  //0.99 --> ~0.05
                  //1 - (0.81-(1-0.2))/0.2
                 //(255.0*((1-this_led_position-TAIL_DECAY_RATIO)/(1-TAIL_DECAY_RATIO));//else decay to zero brightness
                 (255.0*(1 - ( (this_led_position - (1-TAIL_DECAY_RATIO) ) / TAIL_DECAY_RATIO )));//else decay to zero brightness
  uint32_t tail_color=strip.gamma32(strip.ColorHSV(hue, sat, val));
  //uint32_t tail_color=strip.ColorHSV(hue, sat, val);
  
  
  return tail_color;//strip.Color(0,255,0,0);
}

//a fire effect with opposing ends of the playfield (left/right) are opposing colors (ex. blue/orange from the game Portal) and animate like fire against one another in the middle
void portal(bool is_new_chapter)
{
  uint32_t color_left=strip.Color(255,0,0,0);
  uint32_t color_right=strip.Color(0,255,0,0);
  uint32_t color_background=strip.Color(255,255,255,0);
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=getRow(iter);//iter/LED_COLS;
    byte col=getCol(iter);//iter%LED_COLS;
    if(col<(LED_COLS/3))
      strip.setPixelColor(iter, color_left);
    else if((col/2)<(LED_COLS/3))
      strip.setPixelColor(iter, color_background);
    else
      strip.setPixelColor(iter, color_right);
  }
}

//consider 16 snakes (color coded), each snake section has 16 states of brightness
//bug: tendz to double-back over itself when heading west
//a linear sequence of illuminated pixels moves around a dim white play area
//https://www.youtube.com/watch?v=yzFrApQ-cB4
//note: system dynamic with a short and wide playfield where snake cannot cross own tail is to predominantly head east/west
void snake(bool is_new_chapter)
{
  byte FRAME_RATE_DIVISOR=8;//ms between frames
  unsigned long new_state=millis()/FRAME_RATE_DIVISOR;
  unsigned long old_state=chapter_timestamp_ms/FRAME_RATE_DIVISOR;
  boolean is_update_state=(new_state!=old_state) || is_new_chapter;
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=getRow(iter);//iter/LED_COLS;
    byte col=getCol(iter);//iter%LED_COLS;
    if(is_update_state)
    {
      if(is_new_chapter) led_state[row][col]=255;//initialization of LED state to be background color
      if(led_state[row][col]!=255) led_state[row][col]++;
      if(snake_row==row && snake_col==col && (led_state[snake_row][snake_col]>STATE_SNAKE_STEP_FORWARD) )//update snake head once by moving one step forward
      {
        snake_dir=get_next_snake_head_state(snake_dir);
        byte north_row=!snake_row?(LED_ROWS-1):(snake_row-1);//if going from row 0 to -1, wrap around cleanly, 255%LED_ROWS is NOT (LED_ROWS-1)
        byte  west_col=!snake_col?(LED_COLS-1):(snake_col-1);
        byte south_row=(snake_row+1)%LED_ROWS;//if SOUTH sow is LED_ROWS, set south_row to 0
        byte  east_col=(snake_col+1)%LED_COLS;
        if(snake_dir&B00001000) snake_row=north_row;
        if(snake_dir&B00000100) snake_col=east_col;
        if(snake_dir&B00000010) snake_row=south_row;
        if(snake_dir&B00000001) snake_col=west_col;
        led_state[snake_row][snake_col]=0;//kick off state machine for new head position
        //note that if snake head moves south or east, the led_state>STATE check will fail
      }
    }
    strip.setPixelColor(iter,get_snake_color(led_state[row][col],FRAME_RATE_DIVISOR));
  }
  if(is_update_state) chapter_timestamp_ms=millis();
}

//rules:
// try to continue the snake moving in the current direction
//  randomly change direction left/right with a low probability
//  do not U-turn
//  wrap around edges of map
//  default when rules cannot be satisfied: go East
//LSB 4 bits of returned byte are the one-hot direction the snake will head in next: MSB < North/East/South/West > LSB
byte get_next_snake_head_state(byte snake_dir_in)
{
//return B00000100;//debug
  byte snake_dir_out=snake_dir_in&0x0F;
  if(!snake_dir_out) snake_dir_out=B00000100;//catch error case if no previous direction specified
  byte no_u_turn_mask=(snake_dir_out<=B00000010) ? ((snake_dir_out)<<6) : ((snake_dir_out)<<2);
  no_u_turn_mask=(~no_u_turn_mask) & 0xF0;//set upper buts to 1 if they are NOT the opposite of the current direction
  no_u_turn_mask|=snake_dir_out;//retain current direction in mask
  byte north_row=!snake_row?(LED_ROWS-1):(snake_row-1);//if going from row 0 to -1, wrap around cleanly, 255%LED_ROWS is NOT (LED_ROWS-1)
  byte  west_col=!snake_col?(LED_COLS-1):(snake_col-1);
  byte south_row=(snake_row+1)%LED_ROWS;//if SOUTH sow is LED_ROWS, set south_row to 0
  byte  east_col=(snake_col+1)%LED_COLS;
  if(led_state[north_row][snake_col]==255) snake_dir_out|=B10000000;//North is clear
  if(led_state[snake_row][ east_col]==255) snake_dir_out|=B01000000;//East is clear
  if(led_state[south_row][snake_col]==255) snake_dir_out|=B00100000;//South is clear
  if(led_state[snake_row][ west_col]==255) snake_dir_out|=B00010000;//West is clear
  snake_dir_out&=no_u_turn_mask;
  //top 4 MSB now contain whether the North/East/South/West is clear
  //bottom 4 LSB contain previous direction travelled
  if(!(snake_dir_out>>4)) return B00000100;//catch base case when there is no direction to go
  if(snake_dir_out & (snake_dir_out>>4))
  {//if can go straight, randomly attempt to do so ("momentum")
    if(random(4)) return snake_dir_out;//high probability of no change in direction
  }
  //chose not to continuie momentum forward, randomly select among the remaining options
  byte one_count=0;//count number of options ahead the snake can travel
  one_count+=(snake_dir_out&B10000000)?1:0;
  one_count+=(snake_dir_out&B01000000)?1:0;
  one_count+=(snake_dir_out&B00100000)?1:0;
  one_count+=(snake_dir_out&B00010000)?1:0;
  byte random_dir=random(one_count);//select randomly among the avaialable directions
  for(byte iter=0;iter<4;iter++)
  {
    byte test_dir = snake_dir_out & (B0001000 << iter);
    if(test_dir)//if this is one of the possible directions to go that way
    {
      if(!random_dir) return test_dir>>4;//see if this was the randomly selected driection to go (0), then go that way
      random_dir--;//previous case was not the selected direction, so decrement and try again
    }
  }
  return B00000100;//error case, should be unreachable //hmm, is reaching this base case...
}

//given the state of a snake pixel and the milliseconds between state updates, determine the color of that pixel
uint32_t get_snake_color(byte state,byte FRAME_RATE_DIVISOR)
{
  unsigned long elapsed_ms=FRAME_RATE_DIVISOR*state-(millis()%FRAME_RATE_DIVISOR);
  float ratio_brightness=(float)elapsed_ms/(float)(FRAME_RATE_DIVISOR*STATE_SNAKE_STEP_FORWARD);
  uint32_t background=strip.Color(0,0,0,0);//32);
  if(state==255) return background;//background
  uint16_t hue = millis()*8;//set higher multiplication to cycle LEDs faster.  *16 is cycling full rainbow every ~8 seconds
  uint8_t  sat = 255;
  uint8_t  val = (byte)(255.0*ratio_brightness);//brightening before STATE_SNAKE_STEP_FORWARD
  if(state>STATE_SNAKE_STEP_FORWARD) 
  {
    elapsed_ms-=FRAME_RATE_DIVISOR*STATE_SNAKE_STEP_FORWARD;
    ratio_brightness=(float)elapsed_ms/(float)(FRAME_RATE_DIVISOR*(255-STATE_SNAKE_STEP_FORWARD));
    val = (byte)(255.0*(1.0-ratio_brightness));//dimming after STATE_SNAKE_STEP_FORWARD
  }
  return strip.gamma32(strip.ColorHSV(hue, sat, val)) | background;//todo
}

//Based on the distance from the center of a circle, alternate between illuminated and dark.  Allow the center of the circle to move with time
//https://www.youtube.com/watch?v=yzFrApQ-cB4
void inteference(bool is_new_chapter)
{
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    strip.setPixelColor(iter, strip.Color(0,255,0));
  }
}

//"The Matrix" green text falling down
//https://www.youtube.com/watch?v=kqUR3KtWbTk
void matrix_rain(bool is_new_chapter,unsigned long frame_number)
{
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=getRow(iter);//;iter/LED_COLS;
    byte col=getCol(iter);//iter%LED_COLS;
    if(is_new_chapter)
    {
      if(row==0)
        led_state[row][col]=random(0,255);//random start state on top row
      else
        led_state[row][col]=led_state[row-1][col]-8;//rows below are just one step before previous row
    }
    strip.setPixelColor(iter,matrix_rain_state(led_state[row][col]+=(frame_number%4==0?1:0)));
  }
}

//given an LED state, return a color
uint32_t matrix_rain_state(byte state)
{
  const byte FLASH_START=3;
  const byte TAIL_START=60;
  const byte TAIL_END=90;
  if(state<FLASH_START) return strip.Color(255,255,255,255);//white is leading edge of rain state
  if(state<TAIL_START) return strip.Color(0,255,0,0);//standard green tail
  if(state<TAIL_END) return strip.Color(0,255-(byte)(255.0*(float)(state-TAIL_START)/(float)(TAIL_END-TAIL_START)),0,0);
  return strip.Color(0,0,0,0);
}

//flicker of failing neon
// comments https://www.youtube.com/watch?v=tKKQcWefcko
