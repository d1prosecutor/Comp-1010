/* Example
   Draw a 3-digit positive integer, one digit at a time, inside
   boxes in the centre of the canvas.
   Make the positive integer start at 0 and count up by 1 each frame.
*/

//The number to draw in the boxes
int num = 0;
//The number of digits of the number to draw.
int NUM_DIGITS = 3;

//Constants that control the sizes and positions and colours
final int TEXT_SIZE = 40;   //Height of the text (it will actually be drawn shorter)
final int BOX_HEIGHT = 40;  //Height of each box
final int BOX_WIDTH = 35;   //Width of each box
final int BOX_SPACING = 15; //Size of the gap between boxes
//The position for the number within the box
final int LEFT_MARGIN = 5;
final int BOTTOM_MARGIN = 5;
//The colours to use
final int DIGIT_SHADE = 0; //Black
final int BOX_SHADE = 192; //Light grey

//These variables control the top left corner of the next box to draw
int boxTops;     //All boxes have the same top (Y) coordinate
int nextBoxLeft; //The X coordinate of the next box's left side

//These variables are used temporarily to split the number into digits
int copy;  //A copy of "num" which we can destroy while drawing it.
int digit; //One digit to draw inside one box.         

void setup(){
  size(500,500);
  textSize(TEXT_SIZE);
  frameRate(10);
}

void draw(){
  //Put it against a dark grey background - erased each time
  background(64);
  //Draw the digits in boxes
  drawAllDigits();
  //Make the number go up by 1 each time.
  num++;
}

void drawAllDigits(){
  calcFirstBoxPosition(); //Set up the coordinates of the rightmost box
  copy = num; //Make a copy of the number which can be safely destroyed.
  //Draw the three digits, one at a time (we'll do this better later).
  drawLowestDigit(); //This draws, and also REMOVES the lowest digit
  drawLowestDigit(); //This draws the next lowest one, and removes it
  drawLowestDigit(); //This draws the next one, and removes it
}

void calcFirstBoxPosition(){
  //Calculate the top left corner coordinates of the first box
  //First find the entire width of all of the boxes.
  //There will be NUM_DIGITS boxes, but only NUM_DIGITS-1 gaps between them.
  int totalWidth = NUM_DIGITS*BOX_WIDTH + (NUM_DIGITS-1)*BOX_SPACING;
  //Using that, calculate how to centre the boxes in the canvas.
  nextBoxLeft = width/2 + totalWidth/2 - BOX_WIDTH;
  boxTops = height/2 - BOX_HEIGHT/2;
}

void drawLowestDigit(){
  //Draw the lowest digit of the number in "copy". Remove that digit so
  //it won't be drawn again, and change nextBoxLeft for the next digit
  digit = copy%10;  //Pick off the last digit of the copy of the number
  copy = copy/10;    //Permanently remove it (we're just destroying a copy)
  drawDigitInBox(); //Draw that digit
  nextBoxLeft = nextBoxLeft-BOX_WIDTH-BOX_SPACING; //Move left by one box and one space
}

void drawDigitInBox(){
  //Draw the digit in the variable "digit" inside a box whose size and
  //position are controlled by thisBoxLeft, boxTops, BOX_WIDTH, and BOX_HEIGHT
  //The position of the digit inside the box is affected by LEFT_MARGIIN and
  //BOTTOM_MARGIN.
  fill(BOX_SHADE);
  rect(nextBoxLeft,boxTops,BOX_WIDTH,BOX_HEIGHT);
  fill(DIGIT_SHADE);
  text(str(digit),nextBoxLeft+LEFT_MARGIN,boxTops+BOX_HEIGHT-BOTTOM_MARGIN);
}
