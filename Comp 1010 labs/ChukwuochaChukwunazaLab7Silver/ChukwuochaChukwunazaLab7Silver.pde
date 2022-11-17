/* Chukwunaza Chukwuocha
 COMP 1010 - Lab 7 Silver
 
 Draw a line of "chain links" (circles) connecting the mouse
 cursor position to the centre of the window. The links should
 have diameter CIRCLE_DIAMETER, and there should be just enough of
 them so that they overlap by about 25% (they should be approximately
 75% of CIRCLE_DIAMETER apart).
 */

final float CIRCLE_DIAMETER = 20;
final float TARGET_SPACING = CIRCLE_DIAMETER * 0.75;

//One end of the chain (the "anchor point") will be the window's centre. 
float anchorX, anchorY; //Can't set until after size() is done.

void setup() 
{
  size(500, 500);

  //initializes the value of anchorX and anchorY
  anchorX = width/2;
  anchorY = height/2;

  strokeWeight(2); //It looks better with fat lines
  stroke(255);     //white lines
  noFill();        //and hollow circles
}

void draw()
{
  background(0);// sets the canvas to black

  //resets anchorX and anchorY in each frame
  anchorX = width/2;
  anchorY = height/2;

  float mouseCenterDistance = dist(mouseX, mouseY, width/2, height/2);// Distance
  //from the mouse location to the center of the canvas

  //total number of circles that will fit from the anchor to the mouse
  float numCircles = round(mouseCenterDistance/TARGET_SPACING);

  //spacing that will be added to the x and y direction in each frame
  float xDist = (mouseX - anchorX) / (numCircles); 
  float yDist = (mouseY - anchorY) / (numCircles);

  if (numCircles == 0)
  {
    //Draws the anchor Circle when the number of extra circles needed is zero
    ellipse(anchorX, anchorY, CIRCLE_DIAMETER, CIRCLE_DIAMETER);
  } else {
    for (int i=0; i<=numCircles; i++)
    {
      // draws the extra circles needed to fill the space from
      // the anchor Circle to the mouse Location
      ellipse(anchorX, anchorY, CIRCLE_DIAMETER, CIRCLE_DIAMETER);

      //adds the distance in each direction every frame
      anchorX += xDist;
      anchorY += yDist;
    }
  }
}
