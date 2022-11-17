/* 
 COMP 1010 - A02
 Instructor - Ali Neshati
 Name - Chukwunaza Chukwuocha
 Lab 9- Bronze exercise
 
 Draw a line of circles starting at the mouse position,
 and extending outward at a particular angle, each circle
 just touching the previous one. The size of the circles,
 the number of circles, and the angle are controlled by
 constants in the draw() function.
 */

// NO global variables or constants are allowed!!

void setup() {
  size(800, 800);
  noStroke();     //No black outline around the circles
}

void draw() {
  final int CIRCLE_SIZE = 20;
  final int NUM_CIRCLES = 7;
  final float ANGLE = -PI/4;
  background(0);
  lineOfCircles(mouseX, mouseY, ANGLE, CIRCLE_SIZE, NUM_CIRCLES);
}

/*
Draws a line of numCirc circles using the drawCircle function
*/
void lineOfCircles(float xStart, float yStart, float angle, float size, int numCirc)
{
  int circleSpacing = 0;//Spaces the circles such that each circle touches the next
  
  for (int i=1; i<=numCirc; i++)
  {
    drawCircle(xStart, yStart, circleSpacing, angle, size);
    circleSpacing += size;// increases the spacing of the circles by the diameter 
    //of the circle each time
  }
}

/*
Draws the circle at the point x, y defined by the function xAtAngle, yAtAngle
*/
void drawCircle(float x, float y, float d, float theta, float diam)
{
  x = xAtAngle(x, d, theta);//uses xAtAngle to determine the x position of the circle
  y = yAtAngle(y, d, theta);//uses xAtAngle to determine the y position of the circle
  circle(x, y, diam);
}

/*
calculates the x coordinate of the circle
*/
float xAtAngle(float xFrom, float dist, float angle)
{
  float xcoordinate = xFrom+dist*cos(angle);
  return xcoordinate;
}

/*
calculates the y coordinate of the circle
*/
float yAtAngle(float yFrom, float dist, float angle)
{
  float ycoordinate = yFrom+dist*sin(angle);
  return ycoordinate;
}
