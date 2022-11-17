/* Template
 Gold exercise
 Fall Lab 9 - COMP 1010
 
 Draw a family of "octopus" shapes, each consisting of several
 line of circles starting at a fixed position, and extending outwards
 at at evenly spaced angles, each circle
 just touching the previous one. The size of the circles,
 the number of circles, and the angle are controlled by
 constants in the draw() function. In addition, each octopus
 "arm" can be bent by drawing each circle at a slightly
 different angle than the previous one. There will be one octopus
 at the position of the mouse, and the rest will be spaced evenly
 in a circle around the middle one, at a distance that will make the
 arms just touch each other when the arms are straight.
 */

// NO additional global variables or constants are allowed!!
float theta = 0.0; //Used to provide a sinusoidal change in the
//bend of the octopus's arms.

void setup() {
  size(800, 800);
  noStroke();     //No black outline around the circles
}

void draw() {
  final int CIRCLE_SIZE = 15;
  final int NUM_CIRCLES = 5;
  final int NUM_ARMS = 8;
  final float THETA_CHANGE = 0.05;
  final float MAX_BEND = 0.15;
  final int FAMILY_SIZE = 7;
  background(0);
  octopusFamily(mouseX, mouseY, FAMILY_SIZE, NUM_ARMS, CIRCLE_SIZE, NUM_CIRCLES, MAX_BEND*sin(theta));
  theta += THETA_CHANGE;
}

void octopusFamily(float x, float y, int numOct, int numArms, int size, int numCirc, float bend)
{
  float angleIncrement = TWO_PI/6;
  octopus(x, y, numArms, size, numCirc, bend);

  for (int i=0; i<numOct; i++)
  {
    octopus(xAtAngle(x, size*11, angleIncrement*i), yAtAngle(y, size*11, angleIncrement*i), numArms, size, numCirc, bend);
  }
}

void octopus(float x, float y, int numArms, int size, int numCirc, float bend)
{
  float angleIncrement = TWO_PI/7;
  float armStartLocationX;
  float armStartLocationY;

  for (int i=0; i<numArms; i++)
  {
    armStartLocationX = xAtAngle(x, size, angleIncrement*i);
    armStartLocationY = yAtAngle(y, size, angleIncrement*i);
    lineOfCircles(armStartLocationX, armStartLocationY, angleIncrement*i, size, numCirc, bend);
  }
}

void lineOfCircles(float xStart, float yStart, float angle, float size, int numCirc, float bend)
{
  int circleSpacing = 0; 

  for (int i=0; i<numCirc; i++)
  {
    drawCircle(xStart, yStart, circleSpacing, angle+=bend, size);
    circleSpacing += size;
  }
}

void drawCircle(float x, float y, float d, float theta, float diam)
{
  float circleCenterX = xAtAngle(x, d, theta);
  float circleCenterY = yAtAngle(y, d, theta);
  circle(circleCenterX, circleCenterY, diam);
}

float xAtAngle(float xFrom, float dist, float angle)
{
  float xcoordinate = xFrom+dist*cos(angle);
  return xcoordinate;
}

float yAtAngle(float yFrom, float dist, float angle)
{
  float ycoordinate = yFrom+dist*sin(angle);
  return ycoordinate;
}
