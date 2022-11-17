/*Chukwuocha Chukwunaza
 COMP 1010 A02
 LAB 3 GOLD***
 This exercise simulates a ball hanging from an elastic rope*/
 
 // Global constant for the ball's size
final float ballSize = 30;

// Global Constant for the pulling power of the elastic band
final float BAND_STRENGTH = 0.005;

// Global constant for the gravity
final float GRAVITY = 0.5;

// Variables for the location of the ball
float ballX;
float ballY;

// Variables for the ball's velocity
float velocityX;
float velocityY;

void setup()
{
  background(0);
  size(1000, 1000);
  
  // Initializing the Variables
  ballX = width / 2;
  ballY = width / 2;
}
  
void drawBall()
{
  // Drawing the rope connecting the ball and the mouse
  strokeWeight(2);
  stroke(255);
  line(mouseX,mouseY,ballX,ballY);
  
  // Drawing the ball
  //ballY= ballY + 15;// gives a vertical gap between the ball and the mouse postion 
  fill(255, 0, 255);
  ellipse(ballX, ballY, ballSize, ballSize);
}

void moveBall()
{
  /* Calculating the distance between the mouse and the ball
  and moving the mouse towards the ball with an "elastic" effect*/ 
  
  float diffX = (mouseX - ballX) * BAND_STRENGTH;
  float diffY = (mouseY - ballY) * BAND_STRENGTH;
  
  velocityX += diffX;
  velocityY += diffY;
  
  // Adding gravity which will pull the ball away from the rope
  velocityY += GRAVITY;
  
  // Adding "Friction to dampen the bouncing effect"
  velocityX = velocityX * 0.97;
  velocityY = velocityY * 0.97;
  
  // Adding the velocities to the ball's position to move it
  ballX += velocityX;
  ballY += velocityY;
}

void draw ()
{
  background(0);
  moveBall();
  drawBall();
}
