/* Collapsing ellispses - active version
   Example for COMP 1010
  
   This draws an ellipse that fills the whole window,
   then a series of ellipses, each A PORTION OF the size of
   the previous one.
   
   This version is animated - with the size of the smallest
   ellipse controlled by the mouse
*/

//Each ellipse is this proportion of the size of the previous one.
final float PROPORTION = 0.9;

//State variables needed.
float sizeLimit;     //Quit drawing when ellipses get smaller than this.
float ellipseWidth, ellipseHeight;  //The width and height of the next ellipse
float greyScale = 255; //The colour of the next ellipse

void setup(){
  size(600,400);
}//setup

void draw(){
  initialize();
  while(ellipseWidth>=sizeLimit){
    drawEllipse();
    shrinkEllipse();
  }//while
}//draw

void initialize(){
  //Set up the four state variables.
  //Set the size limit to double the distance from the mouse to the canvas centre.
  sizeLimit = 2.0*sqrt(sq(mouseX-width/2)+sq(mouseY-height/2));
  ellipseWidth=width;   //The whole window at first
  ellipseHeight=height; //Same here
  greyScale = 255;      //Start with a white one
}

void drawEllipse(){
  //Draw the next ellipse, using the state variables to control it.
  fill(greyScale);
  ellipse(width/2,height/2,ellipseWidth,ellipseHeight);
}

void shrinkEllipse(){
  //Shrink the size and darken the colour of the next ellipse.
   ellipseWidth=ellipseWidth*PROPORTION;   //Shrink the size
   ellipseHeight=ellipseHeight*PROPORTION; //in both directions
   greyScale = greyScale*PROPORTION; //and darken the colour, too.
}


   


 