/*
COMP 1010 - A02
 Instructor - Ali Neshati
 Name - Chukwunaza Chukwuocha
 Lab 9- Silver exercise
 
 Draw an "octopus" consisting of several line of circles
 starting at the mouse position, and extending outwards
 at at evenly spaced angles, each circle
 just touching the previous one. The size of the circles,
 the number of circles, and the angle are controlled by
 constants in the draw() function.
 */

// NO additional global variables or constants are allowed!!
float theta = 0.0;

void setup() 
{
  size(800, 800);
  noStroke();     //No black outline around the circles
}

void draw() 
{
  final int CIRCLE_SIZE = 20;
  final int NUM_CIRCLES = 7;
  final int NUM_ARMS = 8;
  final float THETA_CHANGE = 0.05;
  final float MAX_BEND = 0.15;
  background(0);
  octopus(mouseX, mouseY, NUM_ARMS, CIRCLE_SIZE, NUM_CIRCLES, MAX_BEND*sin(theta));
  theta += THETA_CHANGE;
}

/*
Draws an octopus of 'numArms' Arms using the lineOfCircles function at the
start locations defined by xAtAngle, yAtAngle functions
*/
void octopus(float x, float y, int numArms, int size, int numCirc, float bend)
{
  //Variable that determines the angle at which each arm whill start
  float angleIncrement = TWO_PI/numArms;
  
  //x and y coordinates for the start location of each arm of the octopus
  float armStartLocationX;
  float armStartLocationY;

  for (int i=0; i<numArms; i++)
  {
    armStartLocationX = xAtAngle(x, size, angleIncrement*i);
    armStartLocationY = yAtAngle(y, size, angleIncrement*i);
    println(armStartLocationX, armStartLocationY);
    lineOfCircles(armStartLocationX, armStartLocationY, angleIncrement*i, size, numCirc, bend);
  }
}

/*
Draws a line of numCirc circles using the drawCircle function
*/
void lineOfCircles(float xStart, float yStart, float angle, float size, int numCirc, float bend)
{
  int circleSpacing = 0;//Spaces the circles such that each circle touches the next
  
  for (int i=1; i<=numCirc; i++)
  {
    drawCircle(xStart, yStart, circleSpacing, angle+=bend, size);
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
