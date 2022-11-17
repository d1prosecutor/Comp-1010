/*Chukwunaza Chukwuocha
 Comp 1010 A02 - Lab 6 Bronze
 
 Draws small circles at random points on the canvas
 and displays a graphical text of the coordinates of the circle
 */

//Global constant for the circle Diameter and radius
final int ELLIPSE_DIAMETER = 5;
final float ELLIPSE_RADIUS = ELLIPSE_DIAMETER/2.0;


//Global constant for the starting point of the graphical text
final int STARTING_POINT = 5;

void setup()
{
  size(500, 500);
  background(190);
  frameRate(1);
}

void draw()
{
  int ellipseX = (int)random(0, width-80);
  int ellipseY = (int)random(25, height);

  stroke(0);
  fill(255);  
  ellipse((float)ellipseX, (float)ellipseY, ELLIPSE_DIAMETER, ELLIPSE_DIAMETER);

  String ellipseLocation = "(" + ellipseX + "," + ellipseY + ")";
  fill(0);
  textSize(16);
  text(ellipseLocation, ellipseX + ELLIPSE_RADIUS + STARTING_POINT, ellipseY - ELLIPSE_RADIUS - STARTING_POINT);
}
