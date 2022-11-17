int ballX = 250; // start at the center of the screen

int ballY = 250;

int ballSpeedX = 2;

int ballSpeedY = 1;

int ballSize = 10;

int boxLeft = 150;

int boxTop = 150;

int boxSize = 200;

int boxRight = boxLeft + boxSize;

int boxBottom = boxTop + boxSize;

void setup()
{
  size(500, 500);
  background(0);
}
// draw the ball

void drawBall()
{
  ellipse(ballX, ballY, ballSize, ballSize);
}

void moveBall()
{
  // move the ball

  ballX += ballSpeedX;

  ballY += ballSpeedY;
}


// draw the box
void drawBox()
{
  stroke(255);

  line(boxLeft, boxTop, boxRight, boxTop);

  line(boxRight, boxTop, boxRight, boxBottom);

  line(boxRight, boxBottom, boxLeft, boxBottom);

  line(boxLeft, boxBottom, boxLeft, boxTop);
}

void ballBounce()
{
  // check the bounds

  // right and left

  if (ballX < (boxLeft+ballSize/2) || ballX > (boxRight-ballSize/2))

  {

    ballSpeedX *= -1;
  }

  // top and bottomm

  if (ballY < (boxTop+ballSize/2) || ballY > (boxBottom-ballSize/2))

  {

    ballSpeedY *= -1;
  }
}

void draw()
{
  background(0);
  drawBox();
  drawBall();
  moveBall();
  ballBounce();
}
