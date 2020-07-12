
//Step 1. Acquire Attiny core through steps here: https://create.arduino.cc/projecthub/arjun/programming-attiny85-with-arduino-uno-afb829
//Step 2. Acquire Adafruit NeoPixel Library here: https://learn.adafruit.com/adafruit-neopixel-uberguide/arduino-library-installation


//dark IDE theme (through Windows 10 Store):
//  https://forum.arduino.cc/index.php?topic=635315.0
//  https://create.arduino.cc/projecthub/konradhtc/one-dark-arduino-modern-dark-theme-for-arduino-ide-2fca81

//todo:
//read from eeprom
//ID number
//max led brightness
//thermal monitoring


//Step 2. Tools >> Manage Libraries... >> "capacitivesensor" by Paul Bagder v0.5.1
//  ref: https://playground.arduino.cc/Main/CapacitiveSensor/


//Step 1. Program an Arduino with the ArduinoISP program: File >> Examples >> 11.ArduinoISP >> ArduinoISP
//Step 2. Connect the ISP Arduino to the J3 header (the J3 pinout matches the Attiny pinout, note the white circle adjacent to pin 1):
//  https://hackster.imgix.net/uploads/cover_image/file/50546/Programming%20ATtiny85%20with%20Arduino%20Uno_bb.png?auto=compress%2Cformat&w=900&h=675&fit=min
//Step 4. Enable Arduino IDE to retain EEPROM values between reflashing
//  File >> Preferences >> (Note "preferences" location at bottom of window)
//  Navigate to "preferences" folder
//  From there, navigate to /packages/attiny/hardware/avr/1.0.2/
//  AT C:\Program Files (x86)\Arduino\hardware\arduino\avr\boards.txt
//  WAS: ATtinyX5.menu.clock.internal8.bootloader.high_fuses=0xdf
//  IS:  ATtinyX5.menu.clock.internal8.bootloader.high_fuses=0xd7
//  ( Core settings ref https://forum.arduino.cc/index.php?topic=393434.0 )
//  ( EEPROM fuse ref https://forum.arduino.cc/index.php?topic=278083.0 )
//Step 5. Restart Arduino IDE
//Step 6. Burn bootloader, Attiny85, 8 MHz, Internal
//  FYI, this may require either an FTDI or another Arduino to act as an intermediate programmer, ref. IDE >> File >> Examples >> 11.ArduinoISP
//  https://create.arduino.cc/projecthub/arjun/programming-attiny85-with-arduino-uno-afb829
//Step 7. Set BURN_EEPROM to 1 and upload program
//Step 8. Set BURN_EEPROM to 0 and upload program

// ---- Libraries ----
// -- LEDs --
#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
 #include <avr/power.h> // Required for 16 MHz Adafruit Trinket
#endif

// -- Top Level IO --
const byte PIN_LED=6;//D1 is physical pin 6
const byte LED_ROWS=4;
const byte LED_COLS=24;
const byte LED_COUNT=LED_ROWS*LED_COLS;//note: max 255 LEDs in byte
neoPixelType STRIP_TYPE=NEO_GRB/*NEO_GRBW*/ + NEO_KHZ800;
Adafruit_NeoPixel strip = Adafruit_NeoPixel(LED_COUNT, PIN_LED, STRIP_TYPE);

// ---- State Machines ----
// -- Book --
//The program is structured like a book where there is an introduction "setup()"
//followed by reading page after page (frame render) in each chapter "loop()"
#define CHAPTER_ERROR 254
#define CHAPTER_STRIP_TEST 255
#define CHAPTER_MONOCHROME 10
#define CHAPTER_RAINBOW 6
#define CHAPTER_SCATTER_BLINK 9
#define CHAPTER_MATRIX_RAIN 5
#define CHAPTER_SNAKE 0
#define CHAPTER_INTERFERENCE 3
#define CHAPTER_FLAG_AMERICAN 8
#define CHAPTER_FIREWORKS 13
#define CHAPTER_PORTAL 11
#define CHAPTER_WATER 14//slowly cycling and shimmering water effect 
const byte LAST_CHAPTER=CHAPTER_INTERFERENCE;//highest indexed chapter in the book
byte chapter_id=CHAPTER_STRIP_TEST; //set to 255 to run LED check at boot, set to 0 to skip
bool is_go_to_new_chapter=false;//private flag used for tracking state change to new chapter
unsigned long timestamp_ms=0;//used for various chapter state machines.  Note wrap over after ~50 days
byte led_state[LED_ROWS][LED_COLS];//general-purpose state machine allocation for all chapters to share

// -- Chapter --
// - Snake - 
byte snake_row=0;//position of head
byte snake_col=0;
const byte STATE_SNAKE_STEP_FORWARD=32;//when the stake body part state goes from this 0 up to this point, step the snake forward one pixel
byte snake_dir=B00000100;//8 bit array: lowest 4 bits are previous direction MSB < North/East/South/West > LSB

void setup() {
  // put your setup code here, to run once:
  strip.begin();
  //strip.setBrightness(home_brightness);
  strip.show();//clear LEDs
  timestamp_ms=millis();
}

//state machine that executes every frame of the animation:
//1. render the frame of the current chapter
//2. flush frame buffer to hardware
//3. update the chapter if the current chapter has finsihed or if the user provides input
void loop() {
  // put your main code here, to run repeatedly:
  bool is_done=false;
  switch(chapter_id)
  {//note the otder the chapters are executed is determined by the value of the global define constants
    case CHAPTER_STRIP_TEST: is_done=strip_test(is_go_to_new_chapter); break;
    case CHAPTER_MONOCHROME: monochrome(is_go_to_new_chapter); break;
    case CHAPTER_RAINBOW: rainbow(is_go_to_new_chapter); break;
    case CHAPTER_SCATTER_BLINK: scatter_blink(is_go_to_new_chapter); break;
    case CHAPTER_SNAKE: snake(is_go_to_new_chapter); break;
    //case CHAPTER_INTERFERENCE: interference(is_go_to_new_chapter); break;
    case CHAPTER_MATRIX_RAIN: matrix_rain(is_go_to_new_chapter); break;
    case CHAPTER_FLAG_AMERICAN: flag_american(is_go_to_new_chapter); break;
    case CHAPTER_FIREWORKS: fireworks(is_go_to_new_chapter); break;
    case CHAPTER_PORTAL: portal(is_go_to_new_chapter); break;
    default: error(is_go_to_new_chapter); break;//any unpopulated (no case statement) chapters are replaced with error display.  Add a chapter_id++; here to hto fix the issue
  }
  strip.show();
  //is_done |= check user input
  if(is_done)
  {
    chapter_id=(chapter_id+1)%(LAST_CHAPTER+1);
    is_go_to_new_chapter=true;
  }else is_go_to_new_chapter=false;
  if(millis()<timestamp_ms) timestamp_ms=0;//brute force fix to remedy 50 day wrap around...
}

// ---- Animations ----
//boot-up animation to allow the user to verify the proper operation of all LEDs
//red, green, blue, white flash on all LEDs
bool strip_test(bool is_new_chapter)
{
  byte led_color=(millis()-timestamp_ms)/1024;//change color every x milliseoncds
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
  strip.fill(strip.Color(millis()%8,0,millis()%8),0,LED_COUNT);
}

//display a static pattern where the display is broken into vertical quarters by color
void error(bool is_new_chapter)
{
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte col=iter%LED_COLS;
    bool is_red=col<(LED_COLS/4);//left third of display is red
    bool is_green=!is_red && (col<(LED_COLS/2));//central third is green
    bool is_blue= !is_red && !is_green && (col<(3*(LED_COLS/4)));//rest blue
    bool is_white=!is_red && !is_green && !is_blue;//rest blue
    strip.setPixelColor(iter, strip.Color(is_red?255:0,
                                          is_green?255:0,
                                          is_blue?255:0,
                                          is_white?255:0));
  }
}

//all LEDs cycle smoothly though the rainbow  red --> green --> blue
void rainbow(bool is_new_chapter)
{
  uint16_t hue=millis()*8;//set higher multiplication to cycle LEDs faster.  *16 is cycling full rainbow every ~8 seconds
  uint8_t  sat = 255;
  uint8_t  val = 255 ;
  strip.fill(strip.gamma32(strip.ColorHSV(hue, sat, val)),0,LED_COUNT);
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
    byte row=iter/LED_COLS;
    byte col=iter%LED_COLS;
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
    byte row=iter/LED_COLS;
    byte col=iter%LED_COLS;
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
    byte row=iter/LED_COLS;
    byte col=iter%LED_COLS;
    if(row<(LED_COLS/2) && col<(LED_COLS/2))
    {//top left blue
      strip.setPixelColor(iter, strip.Color(0,0,255,0));
    }else if(row%2==1){//red stripe
      strip.setPixelColor(iter, strip.Color(255,0,0,0));
    }else{//white stripe
      strip.setPixelColor(iter, strip.Color(0,0,0,255));
      if(!random(100)) strip.setPixelColor(iter, strip.Color(255,255,255,255));//random twinkle
    }
  }
}

//
void fire(bool is_new_chapter)
{
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=iter/LED_COLS;
    byte col=iter%LED_COLS;
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
  unsigned long old_state=timestamp_ms/FRAME_RATE_DIVISOR;
  boolean is_update_state=(new_state!=old_state) || is_new_chapter;//if rendering an existing frame, skip the render
  //randomSeed(millis()/FRAME_RATE_DIVISOR);//rather than using a delay statement, allow frames to be generated identially if they occur within multiples of FRAME_RATE_DIVISOR
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=iter/LED_COLS;
    byte col=iter%LED_COLS;
    if(is_new_chapter) led_state[row][col]=255;
    if(is_update_state)
    {
      if(led_state[row][col]!=255)
        led_state[row][col]++;//increment state for LEDs that are in the midst of flashing
      else if(!random(255))//randomly select pixel to begin blink
        led_state[row][col]=0;
    }
    strip.setPixelColor(iter, get_firework_color(led_state[row][col],FRAME_RATE_DIVISOR));
  }
  if(is_update_state) timestamp_ms=millis();
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
  uint32_t background_color=strip.Color(0,0,0,64);
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

//a fire effect with opposing ends of the playfield (left/right) are opposing colors (ex. blue/orange from the game Portal) and animate like fire against one another in the middle
void portal(bool is_new_chapter)
{
  uint32_t color_left=strip.Color(255,0,0,0);
  uint32_t color_right=strip.Color(0,255,0,0);
  uint32_t color_background=strip.Color(255,255,255,0);
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=iter/LED_COLS;
    byte col=iter%LED_COLS;
    if(col<(LED_COLS/3))
      strip.setPixelColor(iter, color_left);
    else if((col/2)<(LED_COLS/3))
      strip.setPixelColor(iter, color_background);
    else
      strip.setPixelColor(iter, color_right);
  }
}
 
//a linear sequence of illuminated pixels moves around a dim white play area
//https://www.youtube.com/watch?v=yzFrApQ-cB4
//note: system dynamic with a short and wide playfield where snake cannot cross own tail is to predominantly head east/west
void snake(bool is_new_chapter)
{
  byte FRAME_RATE_DIVISOR=8;//ms between frames
  unsigned long new_state=millis()/FRAME_RATE_DIVISOR;
  unsigned long old_state=timestamp_ms/FRAME_RATE_DIVISOR;
  boolean is_update_state=(new_state!=old_state) || is_new_chapter;
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=iter/LED_COLS;
    byte col=iter%LED_COLS;
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
  if(is_update_state) timestamp_ms=millis();
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
  uint32_t background=strip.Color(0,0,0,32);
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
void matrix_rain(bool is_new_chapter)
{
  for(byte iter=0;iter<LED_COUNT;iter++)
  {
    byte row=iter/LED_COLS;
    byte col=iter%LED_COLS;
    if(is_new_chapter)
    {
      if(row==0)
        led_state[row][col]=random(0,255);//random start state on top row
      else
        led_state[row][col]=led_state[row-1][col]-1;//rows below are just one step before previous row
    }
    strip.setPixelColor(iter,matrix_rain_state(led_state[row][col]++));
  }
}

//given an LED state, return a color
uint32_t matrix_rain_state(byte state)
{
  const byte FLASH_START=1;
  const byte TAIL_START=80;
  const byte TAIL_END=120;
  if(state<FLASH_START) return strip.Color(255,255,255,255);//white is leading edge of rain state
  if(state<TAIL_START) return strip.Color(0,255-random(0,150),0,0);//standard green tail
  if(state<TAIL_END) return strip.Color(0,255-(byte)(255.0*(float)(state-TAIL_START)/(float)(TAIL_END-TAIL_START)),0,0);
  return strip.Color(0,0,0,0);
}

//flicker of failing neon
// comments https://www.youtube.com/watch?v=tKKQcWefcko
