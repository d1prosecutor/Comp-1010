/* Chukwunaza Chukwuocha
 COMP 1010 Lab 5 Bronze
 
 Draw a circle that moves back and forth along a horizontal
 line, freezing in place whenever the mouse button is pressed.
 */

final int X_LEFT = 100;  //The left end of the horizontal line.
final int X_RIGHT = 400; //The right end of the horizontal line.
final int Y = 100;       //The y position of the line and circle.
final int BALL_DIAM = 50;     //The diameter of the circle
final float BALL_SPEED = 2.5; //Its speed (pixels/second)

//****1) The state variables needed go here:

float ballX; //x coordinate of the ball
float ballY = Y;// y coordinate of the ball

boolean moveRight;


void setup() {
  size(500, 200);

  ballX = X_LEFT;
}

void draw() {
  drawAll();
  moveBall();
}

//****2) Add your functions here:

void drawAll()
{
  background(190);

  stroke(0);
  strokeWeight(2);
  line(X_LEFT, Y, X_RIGHT, Y);

  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse(ballX, ballY, BALL_DIAM, BALL_DIAM);
}

void moveBall()
{
  if (!mousePressed)
  {
    if (ballX <= X_LEFT)
    {
      moveRight = true;
    } else if (ballX >= X_RIGHT) {
      moveRight = false;
    }

    if (moveRight)
    {
      ellipse(ballX, ballY, BALL_DIAM, BALL_DIAM);
      ballX += BALL_SPEED;
    } else {
      ellipse(ballX, ballY, BALL_DIAM, BALL_DIAM);
      ballX -= BALL_SPEED;
    }
  }
}
