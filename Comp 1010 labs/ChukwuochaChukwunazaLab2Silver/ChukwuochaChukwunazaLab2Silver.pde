/* Chukwuocha Chukwunaza 
 Lab 02 Fall - COMP 1010 A02- Silver exercise
 Draws four concentric circles of different colours inside a block of ice
 draws a vertica and horizontal line through the center of the circles*/
 
 size (500, 500);// This sets the size of the canvas

//decalaring the variables
int iceWidth = 16*width/21;
int diam4Foot = 12*width/21;//diameter of the red cirlcle
int diam3Foot = 8*width/21;//diameter of the white circle
int diam2Foot = 4*width/21;//diameter of the blue circle
int diam1Foot = 1*width/21;//diameter of the yellow circle
int centreIce = width/2;//the x coordinate of the centre of all the circles
int iceLeft = (width - iceWidth)/2;//
int tLine =  (height*2)/7;//scales and sets the y coordinaate of the vertical line 

//The light blue rectangle(ice) is drawn below
fill(200, 225, 255);// sets the colour
rect(iceLeft, 0, iceWidth, height);// drwas the rectangle

//The various circles are drawn below
fill(255, 0, 0);//sets the colour for the red circle
ellipse(centreIce, tLine, diam4Foot, diam4Foot);//draws the red circle

fill(255);//sets the colour for the white circle
ellipse(centreIce, tLine, diam3Foot, diam3Foot);//draws the white circle

fill (0, 0, 255);//sets the colour for the blue circle
ellipse(centreIce, tLine, diam2Foot, diam2Foot);//draws the blue circle

fill(255, 255, 0);//sets the colour for the yellow circle
ellipse(centreIce, tLine, diam1Foot, diam1Foot);//draws the yellow circle

//The two lines are drawn below
line(centreIce, 0, centreIce, height);//draws the vertical line

line(iceLeft, tLine, iceLeft+iceWidth, tLine);//draws the horizontal line
