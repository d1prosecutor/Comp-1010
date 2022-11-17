/*
* COMP 1010 SECTION A02
 * INSTRUCTOR: Ali Neshati
 * NAME: Chukwuocha Chukwunaza
 * LAB: 12
 * QUESTION: Bronze
 *
 * draws circles with random flickering colours on the canvas at the mouse position
 * The coordinates for the circles are stored in parallel partially filled arrays
 */

int numMaxCoordinates = 1000;// Maximum number of circles which can be drawn

//Parallel Partially filled arrays that store the coordinate pairs
int[] xCoordinates = new int[numMaxCoordinates];
int[] yCoordinates = new int[numMaxCoordinates];

//how many points have been registered
int numCurrentPoints = 0;

//Diameter of the circle
int circleDiam = 20;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(175);

  for (int i=0; i<numCurrentPoints; i++)
  {
    fill(random(255), random(255), random(255));
    circle(xCoordinates[i], yCoordinates[i], circleDiam);
  }
}

void mouseClicked()
{
  if (numCurrentPoints < numMaxCoordinates)
  {
    xCoordinates[numCurrentPoints] = mouseX;
    yCoordinates[numCurrentPoints] = mouseY;
    numCurrentPoints++;
  }
}
