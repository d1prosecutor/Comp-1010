/*
 Chukwunaza Chukwuocha 
 Comp 1010 A02 - Lab 8 Silver
 
 
 Modifies the bronze exercise so that the circles have a 3d effect 
 with a color gradient effect too.
 !!! i, j and k represent the x-coordinate, y coordinate, and diameter of the circles respectively
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

    for (int k=CIRCLE_DIAMETER; k>=1; k--)
    {//Draws series of circles in one x,y location to create the 3d effect
      /*
      To scale the green value of the colour of the ball to create the gradient effect
       use the scaling formula where the Source is the diameter at that instance('k')
       and the maximum and minimum values for the source are CIRCLE_DIAMETER and 1
       respectively.
       The destination is the green value since all other colours are constant
       and the green value scales from 0 to 255(but in this case the max green value
       is set to 0 and the min is set to 255 so that the value of green at the max diameter
       will be 0, hence the -255 that appears in the code below for (destMax-destMin{0-255}))
       */
      float greenValue = 255 + ((k-1)/float(CIRCLE_DIAMETER-1)) * -255;

      fill(255, greenValue, 0);//sets the colour of the circle based on the value of the 
      //diameter of the ball

      noStroke();//removes the outlines around the circles
      circle(i, j, k); //draws the circle based on the location of i, j and the diameter at k
    }
  }
}
