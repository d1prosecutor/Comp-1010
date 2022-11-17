/* Example - COMP 1010

   Animate a ball that bounces inside a box.
*/

final int BG_COLOR = 192; //The usual light grey background

final int BOX_WIDTH = 400;  //The size of the box in which
final int BOX_HEIGHT = 300; //the ball will bounce

//Create variables for the locations of all four edges.
//These can't be set until after the "size" command.
//Processing requires these to be variables, not constants.
int boxLeft;
int boxTop;
int boxRight;
int boxBottom;

boolean verticalBounce = false;

//The position and size and colour of the ball
int ballX=134, ballY=319; //Its initial position - somewhere "random"
final int BALL_SIZE = 30; //Its diameter - it will be a circle
final int BALL_COLOUR = #D3B76F; //Its colour - this is "leather brown" maybe

//The speed of motion of the ball, in pixels per frame.
int ballSpeedX = 3; //Move 3 pixels every 60th of a second
int ballSpeedY = 2; //Move only 2 pixels every 60th of a second

//===============================================================
void setup(){
  size(500,500);
  background(BG_COLOR);
  
  //Place the box in the centre of the window.
  //Set the constants for the locations of all four sides.
  //This must be done here, after the size command has been done.
  boxLeft = (width-BOX_WIDTH)/2;
  boxTop = (height-BOX_HEIGHT)/2;
  boxRight = boxLeft+BOX_WIDTH;
  boxBottom = boxTop+BOX_HEIGHT; 
}//setup

//===============================================================
void draw(){
  drawBox(); //Draw a fresh box each time
  calculatePosition(); //Calculate the proper position for the ball 
  drawBall();  
  drawLabel();
}//draw

//===============================================================
void drawBox(){
  /* Draw the box inside which the ball will bounce
  */
  background(BG_COLOR); //Erase the old frame completely
  fill(255); //Make the rectangle white inside
  rect(boxLeft,boxTop,BOX_WIDTH,BOX_HEIGHT); //re-draw the rectangle
}

//===============================================================
void drawLabel() {
  final int LABEL_HEIGHT = 60;
  textSize(30);
  
  String s;
  if (verticalBounce) {
    s = "Vertical bounce!";
  } else {
    s = "Horizontal bounce!";
  }
  
  fill(0);
  rect(0, height - LABEL_HEIGHT, width, LABEL_HEIGHT); 
  fill(255);
  text(s, width/2 - textWidth(s)/2.0, height - LABEL_HEIGHT/3);
}

//===============================================================
void calculatePosition(){
  /* Calculate the position of the ball, based on its old position,
     and the speed of its motion. Detect when it hits the edge of the window,
     and make it bounce if it does.
  */
   //Move the ball. Add its speed to the X and Y positions
   ballX += ballSpeedX;
   ballY += ballSpeedY;
   
   //Make the ball bounce. Detect the fact that the ball reaches an edge.
   if(ballY>boxBottom-BALL_SIZE/2 || ballY<boxTop+BALL_SIZE/2) {
      ballSpeedY = -ballSpeedY;
      verticalBounce = true;;
   }
   if(ballX>boxRight-BALL_SIZE/2 || ballX<boxLeft+BALL_SIZE/2) {
     
      ballSpeedX = -ballSpeedX;
      verticalBounce = false;
   }
}

//===============================================================
void drawBall(){
   fill(BALL_COLOUR); //Set the ball's colour
   ellipse(ballX,ballY,BALL_SIZE,BALL_SIZE); //Draw a new one
}
