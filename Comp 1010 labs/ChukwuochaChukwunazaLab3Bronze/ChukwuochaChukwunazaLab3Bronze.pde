/*Chukwuocha Chukwunaza
 COMP 1010 A02
 LAB 3 BRONZE***
 This exercise draws circles on the canvas whose sizes are controlled
 by the mouse location on the X-axis and whose colours are controlled
 by the mouse location on the Y-axis*/
 
/* Decalaring and initializing the global constant for the size 
of the largest cirlce*/
final int MAX_SIZE = 200;

// Declaring the variables for the diameter size and the colour of the circles
int size;
int shade;

void setup()
{
  background(0);
  size(1000, 1000);// the usual canvas size
}

void sizeControl()
{
  int minXWidth = 0;
  int minSize = 0;
  size = minSize + (mouseX - minXWidth) * (MAX_SIZE - minSize) / (width - minXWidth);
}

void colourControl()
{
  int minYHeight = 0;
  int darkestColour = 0;
  int lightestColour = 255;
  shade = darkestColour + (mouseY - minYHeight) * (lightestColour - darkestColour) / (height - minYHeight);
}

void drawCircle()
//This block draws the circles
{
  fill (shade);
  ellipse(mouseX, mouseY, size, size);
}




void draw()
{
  sizeControl();
  colourControl();
  drawCircle();
}
