/*Chukwunaza Chukwuocha
Comp 1010 - lab 7 Bronze

Draws a polygon with sides based on the number of points
controlled by the mouseX position
*/
int points = 9;//number of points to connect, which defines 
//the number of sides of the polygon

int circleRadius = 100;// Radius of the circle
//float angle = 0;// The starting angle of the first point 

//variables for the points in the previous frame of the polygon
float prevPointX;
float prevPointY;

void setup()
{
  size(500, 500);// usual canvas size initialization
  background(0);// sets the background to black
  stroke(255);// sets the colour of the line to white

  ////initialising the variables for the previous frame
  prevPointX = (width/2 + circleRadius);
  prevPointY = (height/2);
}

void draw()
{
  background(0);
  //initialising the variables for the previous frame
  points = mouseX/20;
  float angle = 0;// The starting angle of the first point 

  //Draws a 'points-sided' polygon(polygon depending on the value of the variable 'points')
  for (int i = 0; i < points; i++)
  {
    // increases the angle in each frame by a value depending 
    //on the variable "points"
    float newAngle = (angle + TWO_PI/points);

    // variables for the points in the new frame of the polygon
    float newPointX = (width/2 + circleRadius * cos(newAngle));
    float newPointY = (height/2 + circleRadius * sin(newAngle));

    line(prevPointX, prevPointY, newPointX, newPointY);// draws the polygon

    // Stores the values in the previous frame
    angle = newAngle;
    prevPointX = newPointX;
    prevPointY = newPointY;
  }
}
