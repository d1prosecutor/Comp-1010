/* Example - COMP 1010

   Animate a ball that bounces inside a box.
*/

final int BG_COLOR = 192; //The usual light grey background

//The box, inside of which the ball is bouncing
final int BOX_WIDTH = 400;
final int BOX_HEIGHT = 300;

//Create variables for the locations of all four edges.
//These can't be set until after the "size" command.
//Processing requires these to be variables, not constants.
int boxLeft;
int boxTop;
int boxRight;
int boxBottom;

//Constants that control the "message area" at the bottom of the window
final int MESSAGE_BOX_HEIGHT = 50;  //Total height of the message area
final int MESSAGE_BACKGROUND = 0;   //Black
final int MESSAGE_TEXT_SHADE = 192; //Light grey
final int MESSAGE_TEXT_SIZE = 40;   //Size, in pixels, of the text
final int MESSAGE_BOTTOM_MARGIN = 10; //From "base line" of text to canvas bottom
final int MESSAGE_LEFT_MARGIN = 100;  //From left edge to start of text

//Counter for the number of bounces
int bounces = 0;

//The position and size and colour of the ball
int ballX=134, ballY=319; //Its initial position - somewhere "random"
final int BALL_SIZE = 30; //Its diameter - it will be a circle
final int BALL_COLOUR = #795422; //Its colour - this is "leather brown" maybe

//The speed of motion of the ball, in pixels per frame.
int ballSpeedX = 3; //Move 3 pixels every 60th of a second
int ballSpeedY = 2; //Move only 2 pixels every 60th of a second

void setup(){
  size(500,500);
}//setup

void draw(){
   background(BG_COLOR); //Erase the old ball
   drawBox();
   moveBall();
   drawBall();
   drawScore();
}//draw

//============================================================================

void drawBox(){
  //Draw the box (within which the ball bounces)
  //in the centre of the window.
  
  fill(255); //Make the rectangle white inside

  //Set the constants for the locations of all four sides.
  boxLeft = (width-BOX_WIDTH)/2;
  boxTop = (height-BOX_HEIGHT)/2;
  boxRight = boxLeft+BOX_WIDTH;
  boxBottom = boxTop+BOX_HEIGHT;
  
  //Draw the box, centred in the canvas
  rect(boxLeft,boxTop,BOX_WIDTH,BOX_HEIGHT);
}

//============================================================================

void moveBall(){
   /* Move the ball to a new position in the canvas. Its speed is
      controlled by ballSpeedX and ballSpeedY. When it reaches any
      edge of the box (boxBottom, boxTop, boxLeft,boxRight), the
      appropriate speed is negated to make it bounce.
   */
   //Move the ball. Add its speed to the X and Y positions
   ballX += ballSpeedX;
   ballY += ballSpeedY;
   
   //Make the ball bounce. Detect the fact that the ball reaches an edge.
   if(ballY>boxBottom-BALL_SIZE/2 || ballY<boxTop+BALL_SIZE/2) {
      bounces++;
      ballSpeedY = -ballSpeedY;
   }
   if(ballX>boxRight-BALL_SIZE/2 || ballX<boxLeft+BALL_SIZE/2) {
      bounces++;
      ballSpeedX = -ballSpeedX;
   }
}//moveBall()

//============================================================================

void drawBall(){
  /* Draw the ball at the proper location.
  */
   fill(BALL_COLOUR); //Set the ball's colour
   ellipse(ballX,ballY,BALL_SIZE,BALL_SIZE); //Draw a new one
}//drawBall()

//============================================================================

void drawScore(){
   //Draw the message area, showing the number of bounces
   
   fill(MESSAGE_BACKGROUND);
   rect(0,height-MESSAGE_BOX_HEIGHT,width,MESSAGE_BOX_HEIGHT);
   fill(MESSAGE_TEXT_SHADE);
   textSize(MESSAGE_TEXT_SIZE);
   text("Bounces: "+bounces,MESSAGE_LEFT_MARGIN,height-MESSAGE_BOTTOM_MARGIN);
}//drawScore()

//============================================================================