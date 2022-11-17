/*Chukwunaza Chukwuocha
comp1010-A02
Assignment 1 Q3

THE NUMBERS VISIBLE IN THE VARIABLE ASSIGNMENTS ARE NOT LITERALS BUT ALEGRAIC EXPRESSIONS FOR SCALING THE SHAPES!!!
*/
 
// constants for canvas width and height, change if size() changes
final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;

//Constants for the root shape position
final float ELLIPSE_X = (CANVAS_WIDTH/2); // x coordinate of the ellipse center
final float ELLIPSE_Y = (CANVAS_HEIGHT-(CANVAS_HEIGHT/10)); // y coordinate of the ellipse center

//constants for root shape minimum and maximumm size
int ellipseMinWidth = (CANVAS_WIDTH/10);
int ellipseMaxWidth = (CANVAS_WIDTH/2);
int ellipseMinHeight =(CANVAS_HEIGHT/40);
int ellipseMaxHeight =(CANVAS_HEIGHT/15);

// constants used for sliders DO NOT CHANGE!
final int MARGIN = 50;
final int HANDLE_WIDTH = 20;
final int X_SLIDER_LEFT = MARGIN;
final int X_SLIDER_RIGHT = CANVAS_WIDTH - MARGIN;
final int X_SLIDER_Y = CANVAS_HEIGHT - MARGIN/2;
final int Y_SLIDER_TOP = MARGIN;
final int Y_SLIDER_BOTTOM = CANVAS_HEIGHT - MARGIN;
final int Y_SLIDER_X = MARGIN/2;

// variables used for slider handle positions
int xSliderLoc; 
int ySliderLoc;

//variables for the root shape size
float ellipseWidth;
float ellipseHeight;

//variables for scaling
float scaleX;
float scaleY;

void setup() 
{
  size(500, 500);
  // initial slider handle locations
  xSliderLoc = width/2;
  ySliderLoc = height/2;
  //variables for the ellipse size
  ellipseWidth = (width/5);
  ellipseHeight = (height/15);
}

void drawCopy()
{
// Drwaing the root shape whcih is an ellipse
noStroke();
fill(150, 150);
ellipse(ELLIPSE_X, ELLIPSE_Y, ellipseWidth, ellipseHeight);

//variables the pencil collar
float pencilCollarX = (ELLIPSE_X);
float pencilCollarY = (ELLIPSE_Y-(ellipseHeight*3/10));
float pencilCollarLeft = (ELLIPSE_X-(ellipseWidth/2));
float pencilCollarRight = (ELLIPSE_X+(ellipseWidth/2));
float pencilCollarHeight = (ELLIPSE_Y-(ellipseHeight*4));

//variables the pencil collar
fill(#CB9F7D);
triangle(pencilCollarX, pencilCollarY, pencilCollarLeft, pencilCollarHeight, pencilCollarRight, pencilCollarHeight);

//variables for the Pencil tip
float pencilTipX = pencilCollarX;
float pencilTipY = pencilCollarY;
float pencilTipLeft = pencilCollarLeft + ((pencilCollarRight - pencilCollarLeft)/3);
float pencilTipRight = pencilCollarRight - ((pencilCollarRight - pencilCollarLeft)/3);
float pencilTipHeight = (pencilCollarHeight + ((pencilCollarY-pencilCollarHeight)*2/3));

//Drawing the Pencil tip
fill(0);
triangle(pencilTipX, pencilTipY, pencilTipLeft, pencilTipHeight, pencilTipRight, pencilTipHeight);

//variables for the pencil body
float rect1Width = (pencilCollarRight - pencilCollarLeft);
float rect1Height = ellipseHeight*6;
float rect1X = pencilCollarLeft;
float rect1Y = pencilCollarHeight;

//Drawaing the pencil body
fill(#EAB836);
rect(rect1X,rect1Y, rect1Width, -rect1Height);

//variables for the eraser holder
float rect2Width = rect1Width;
float rect2Height = ellipseHeight;
float rect2X = pencilCollarLeft;
float rect2Y = (pencilCollarHeight - rect1Height);

//Drawing the eraser holder
fill(#BCBBBA);
rect(rect2X, rect2Y, rect2Width, -rect2Height);

//variables for the Eraser
float rect3Width = rect1Width;
float rect3Height = ellipseHeight*2;
float rect3X = pencilCollarLeft;
float rect3Y = rect2Y-rect2Height;

//Drawing the Eraser
fill(#CE2534);
rect(rect3X, rect3Y, rect3Width, -rect3Height);
}

void draw()
{
  background(255);
  drawXSlider();
  drawYSlider();
  drawCopy();
  updateXScaleFactor();
  updateYScaleFactor();
  scaleCopy();
}


void updateXScaleFactor()
////Calculating and converting the Location of SliderX to a scale factor of 0.0 to 1.0
{
  scaleX = 0.0 + (xSliderLoc - X_SLIDER_LEFT)/float(X_SLIDER_RIGHT - X_SLIDER_LEFT) * (1.0);
}

void updateYScaleFactor()
//Calculating and converting the Location of SliderY to a scale factor of 0.0 to 1.0
{
  scaleY = 0.0 + (ySliderLoc - Y_SLIDER_BOTTOM)/float(Y_SLIDER_TOP - Y_SLIDER_BOTTOM) * (1.0);
}

void scaleCopy()
/* Scaling the Width of the ellipse based on Slider position 
using the scale factors above the SourcePercent.*/
{
  ellipseWidth = ellipseMinWidth + scaleX * (ellipseMaxWidth-ellipseMinWidth);
  ellipseHeight = ellipseMinHeight + scaleY * (ellipseMaxHeight-ellipseMinHeight);
}

void drawXSlider()
{
  //DO NOT CHANGE THE CODE IN THIS FUNCTION!!
  // draw horizontal slider
  stroke(0);
  strokeWeight(2);
  line(X_SLIDER_LEFT, X_SLIDER_Y, X_SLIDER_RIGHT, X_SLIDER_Y);
  //draw slider handle
  stroke(255, 0, 0);
  strokeWeight(10);
  line(xSliderLoc, X_SLIDER_Y - HANDLE_WIDTH/2, 
    xSliderLoc, X_SLIDER_Y + HANDLE_WIDTH/2);
}

void drawYSlider()
{ 
  //DO NOT CHANGE THE CODE IN THIS FUNCTION!!
  // draw vertical slider
  stroke(0);
  strokeWeight(2);
  line(Y_SLIDER_X, Y_SLIDER_TOP, Y_SLIDER_X, Y_SLIDER_BOTTOM);
  // draw slider handle
  stroke(255, 0, 0);
  strokeWeight(10);
  line(Y_SLIDER_X - HANDLE_WIDTH/2, ySliderLoc, 
    Y_SLIDER_X + HANDLE_WIDTH/2, ySliderLoc);
}


/*
 * The code below handles the mouse interaction with the sliders
 * You do not need to understand how this code works for A1
 * All you need to know is that when the user drags a slider handle,
 * this code detects that and calls either the updateXScaleFactor() fucntion
 * or the updateYScaleFactor() function.  You never have to call those
 * functions directly, they will be called automatically from here.
 * 
 * DO NOT CHANGE THIS CODE AT ALL!!!
 *
 */
void mouseDragged()
{
  //DO NOT CHANGE THIS CODE
  final int HANDLE_ACTIVE_THRESH = HANDLE_WIDTH;
  if ((mouseX >= X_SLIDER_LEFT) && (mouseX <= X_SLIDER_RIGHT) && 
    (mouseY > X_SLIDER_Y - HANDLE_ACTIVE_THRESH) && (mouseY < X_SLIDER_Y + HANDLE_ACTIVE_THRESH)) {    
    xSliderLoc = mouseX;
    updateXScaleFactor();
  }

  if  ((mouseX >= Y_SLIDER_X - HANDLE_ACTIVE_THRESH) && (mouseX <= Y_SLIDER_X + HANDLE_ACTIVE_THRESH) && 
    (mouseY < Y_SLIDER_BOTTOM) && (mouseY > Y_SLIDER_TOP)){
    ySliderLoc = mouseY;
    updateYScaleFactor();
  }
}
