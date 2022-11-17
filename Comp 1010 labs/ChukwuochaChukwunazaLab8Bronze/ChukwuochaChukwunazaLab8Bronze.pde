/*
 Chukwunaza Chukwuocha 
 Comp 1010 A02 - Lab 8 Bronze
 
 
 Draws rows of circles such that each row has one more circle than the previous row
 !!! i, j and k represent the x-coordinate and y coordinate of the circles respectively
 */

size(700, 700);
background(175);//sets the canvas colour to grey

//Constant for the circle's diameter
final int CIRCLE_DIAMETER = 50;

for (int i=CIRCLE_DIAMETER/2; i<=width-(CIRCLE_DIAMETER/2); i+=CIRCLE_DIAMETER)
{
  //Makes sure the circle starts at the left and top edge 
  // all the circles touch each other and does not draw any partial circle

  for (int j=i; j<= height-(CIRCLE_DIAMETER/2); j+=CIRCLE_DIAMETER)
  {//loops through every row of circles to draw a column of circles beneath

    stroke(0);//sets the outline to black
    fill(255);//sets the colour of the circle to white

    //draws the circle based on the location of i, j and the CIRCLE_DIAMETER
    circle(i, j, CIRCLE_DIAMETER);
  }
}
