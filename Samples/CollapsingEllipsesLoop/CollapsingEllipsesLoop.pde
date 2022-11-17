/* Collapsing ellipses
   Example for COMP 1010
   
   This draws an ellipse that fills the whole window,
   then a series of ellipses, each A PORTION OF the size of
   the previous one.
   
   This version uses a loop rather than multiple copies
   of the same code (which was a bad thing to do).
*/
  size(600,400);
   
  //Each ellipse is this proportion of the size of the previous one.
  final float PROPORTION = 0.9;

  //Stop drawing ellipses when they have a width smaller than this
  final float SIZE_LIMIT = 10.0;
  
  //The variables controlling the ellipses.
  //These must be floats now, and are NOT constants.
  float ellipseWidth=width;   //The whole window at first
  float ellipseHeight=height; //Same here
 
  while(ellipseWidth>=SIZE_LIMIT){
    ellipse(width/2,height/2,ellipseWidth,ellipseHeight);
    ellipseWidth=ellipseWidth*PROPORTION;   //Half the size
    ellipseHeight=ellipseHeight*PROPORTION; //in both directions
  }
