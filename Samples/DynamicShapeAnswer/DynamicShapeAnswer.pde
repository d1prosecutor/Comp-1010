//Why we need to use variables? 
size(800, 400);

int quarterWidthX = width/4;
int threeQuarterWidthX = width/4*3;
int halfHeightY = height/2;
int halfWidthX = width/2;
//use these variables + height and width to draw the image 

//red rectangle 
fill(255,0,0,255);
rect(0,0, halfWidthX,height);

//blue rectangle
fill(0,0,255,255);
rect(halfWidthX,0,halfWidthX,height);

//white ellipse 
fill(255,255,255,250);
ellipse(quarterWidthX,halfHeightY,halfWidthX,height);

//black ellipse
fill(0,0,0,250);
ellipse(threeQuarterWidthX,halfHeightY,halfWidthX,height);

//left black line
stroke(0,0,0,255);
strokeWeight(4);
line(0,0,halfWidthX,height);

//right white line
stroke(255,255,255,255);
line(halfWidthX,height,width,0);


final int QUARTER_WIDTH_X = width/4;
final int THREE_QUARTER_WIDTH_X = width/4*3;
final int HALF_HRIGHT_Y = height/2;
final int HALF_WIDTH_X = width/2;
