/* Chukwunaza Chukwuocha 
 Comp 1010 Assignment 2 
 
 Draws a spaceship on a dark background 
 so that its nose is at the center of the canvas
 and so that it is pointing in a randomly chosen direction. 
 The spacechip attemps to move past a spinning obstacle to hit the target
 and this movement is controlled nt user inputs
 The game gets progressively difficult
 */

//Global constants for the size of the canvas
//Must be changed when 'width' and 'height' are changed
final int WIDTH = 600;
final int HEIGHT = 300;

//Global constants for the size and shape of the ship
final float shipLength = 50;// length of the ship
final float shipShape =(PI/15);// 

//Global constant for the speed of the ship
final float shipSpeed = 1;

//Global constant for the rate at which the ship turns
final float TURNING_RATE = 0.02;

//Variables for the starting angle of the obstacle's arms
float obstacleArmAngle = random(0, TWO_PI);

//Global variables for the position and direction of the ship
float shipDirection = 0;// the direction the ship is pointing
float shipNoseX = shipLength;// x coordinate of the nose of the ship
float shipNoseY = HEIGHT / 2;// y coordinate of the nose of the ship

//Variable for the new direction the ship will point to 
//whenever it is reset
float newShipDirection;

//Global Variables for the coordinates and length of the obstacle
float obstacle1ArmX;
float obstacle2ArmX;
float obstacle1ArmY;
float obstacle2ArmY;
float obstacleLength = HEIGHT;

//Varaibales for the center of the obstacle
float obstacleCenterX = WIDTH/2;
float obstacleCenterY = HEIGHT/2;

//Gloabal variable for the turning rate of the obstacle
float obstacleSpeed = 0.003;

//Gloabal variable for the distance and angle from the ship's center to the obstacle's center
float shipObstacleDist;
float shipObstacleAngle;

//Global variables for the position of Other vertices
float rightVerticeY;
float rightVerticeX;
float leftVerticeY;
float leftVerticeX;

//Global Variables for the center of the ship
float xCenterShip;// for the x coordinates
float yCenterShip;// for the y coordinates

//Global Variables for the x and y components of the ship's Velocity
float shipVelocityX;
float shipVelocityY;

//Global Variable for the Margin for collision betwwen the ship and the obstacle
float collisionAngleMargin = 0.3;

//Global variables to hold the current state of the ship
boolean shipMoving = false;
boolean shipReset;

//Global Variables to check when a collision occurs
boolean collisionState;

//Global variable storing the current level of the game
int level = 1;

//Variable for the location and length of the target line
float targetLineLength = HEIGHT/3; 
float targetArm1X = WIDTH;
float targetArm1Y = random(0, HEIGHT-targetLineLength);
float targetArm2X = WIDTH;
float targetArm2Y = targetArm1Y + targetLineLength;


void setup()
{
  size(600, 300);
  background(20, 0, 150);
}

void drawShip()
{
  //variables for the position of Other vertices
  rightVerticeY = shipNoseY - (shipLength * sin(shipDirection - shipShape));
  rightVerticeX = shipNoseX - (shipLength * cos(shipDirection - shipShape));
  leftVerticeY = shipNoseY - (shipLength * sin(shipDirection + shipShape));
  leftVerticeX = shipNoseX -(shipLength * cos(shipDirection + shipShape));

  //Drawing the ship
  stroke(0);
  strokeWeight(1);
  fill(255, 255, 0);
  triangle(shipNoseX, shipNoseY, leftVerticeX, leftVerticeY, rightVerticeX, rightVerticeY );

  //Calculating the ceneter of the ship
  xCenterShip = (shipNoseX + rightVerticeX + leftVerticeX) / 3; 
  yCenterShip = (shipNoseY + rightVerticeY + leftVerticeY) / 3;

  //Drawing a dot at the center of the ship
  stroke(0);
  strokeWeight(5);
  point(xCenterShip, yCenterShip);
}

void keyPressed()
{
  newShipDirection = TWO_PI;
  if (!shipMoving && key == ' ')
  {
    shipMoving = true;
    shipReset = false;
  } else if (shipMoving && key ==' ')
  {
    shipReset = true;
    shipMoving = false;
  }
}

void moveShip()
{
  shipVelocityX = shipSpeed * cos(shipDirection);
  shipVelocityY = shipSpeed * sin(shipDirection);

  //moves the ship by a constant speed in the direction it is pointing
  if (shipMoving)
  {
    shipNoseX += shipVelocityX;
    shipNoseY += shipVelocityY;
  }

  //prevent the ship from leaving the canvas by resetting it
  if ((shipNoseX >= WIDTH || shipNoseX <= 0) || (shipNoseY >= HEIGHT || shipNoseY <= 0))
  {
    shipReset = true;
    shipMoving = false;
  }

  if (keyPressed)
  {
    if (key == 'd'|| key =='D')
    {
      shipDirection += TURNING_RATE;
    } else if (key == 'a'|| key =='A')
    {
      shipDirection -= TURNING_RATE;
    }
  }
}

void resetShip()
{
  if (shipReset)
  {
    //resets the ship's position
    shipNoseX = shipLength;
    shipNoseY = HEIGHT / 2;
    shipDirection = newShipDirection;
    shipReset = false;
    shipMoving = false;

    //resets the postion of the target line
    targetArm1Y = HEIGHT/2;
    targetArm1X = WIDTH;
    targetArm1Y = random(0, HEIGHT-targetLineLength);
    targetArm2X = WIDTH;
    targetArm2Y = targetArm1Y + targetLineLength;
  }
}

void drawObstacle()
{
  obstacle1ArmX = obstacleCenterX - (obstacleLength/2*cos(obstacleArmAngle));
  obstacle1ArmY = obstacleCenterY - (obstacleLength/2*sin(obstacleArmAngle));
  obstacle2ArmX = obstacleCenterX + (obstacleLength/2*cos(obstacleArmAngle));
  obstacle2ArmY = obstacleCenterY + (obstacleLength/2*sin(obstacleArmAngle));


  stroke(255, 0, 0);
  strokeWeight(10);
  line(obstacle1ArmX, obstacle1ArmY, obstacle2ArmX, obstacle2ArmY);
}

void moveObstacle()
{  
  obstacleArmAngle += obstacleSpeed;
}

void collisionOccured()
{
  //distance from the center of the obstacle to the center of the ship
  shipObstacleDist = dist(xCenterShip, yCenterShip, WIDTH/2, HEIGHT/2);

  //angle between the center of the ship and the center of the obstacle
  shipObstacleAngle = atan2(yCenterShip - HEIGHT/2, xCenterShip - WIDTH/2);

  //making sure the value returned by atan2 is stored as positive
  if (shipObstacleAngle < 0)
  {
    shipObstacleAngle += PI;
  }

  if (shipObstacleDist <= 35)
  {
    collisionState = true;
  } else if (shipObstacleDist < obstacleLength/2)
  {
    if (abs(shipObstacleAngle - (obstacleArmAngle%PI)) < collisionAngleMargin)
    {
      collisionState = true;
    }
  } else
  {
    collisionState = false;
  }

  if (collisionState)
  {
    shipReset = true;
    shipMoving= false;
  }
}

void drawTarget()
{
  stroke(0, 255, 0);
  strokeWeight(15);
  line(targetArm1X, targetArm1Y, targetArm2X, targetArm2Y);
}

void targetHit()
  //Checks if the target was hit
{
  boolean hitTarget = ((targetArm1Y <= shipNoseY) && (shipNoseY <= targetArm2Y) && (shipNoseX >+ WIDTH-10));
  if (hitTarget)
  {
    level ++;
    targetLineLength -= 10;
    targetLineLength = max(targetLineLength, 30);
    obstacleSpeed += 0.002;
    shipReset = true;
    println(targetLineLength);
  }
}

void resetTarget()//not called in Draw function. Just used to make the code shorter
{
  //resets the postion of the target line
  targetArm1Y = HEIGHT/2;
  targetArm1X = WIDTH;
  targetArm1Y = random(0, HEIGHT-targetLineLength);
  targetArm2X = WIDTH;
  targetArm2Y = targetArm1Y + targetLineLength;
}

void drawLevel()
{
  textSize(20);
  fill(255);
  String printLevel = "Current level:" + level;
  text(printLevel, 30, textAscent()+10);
}

void draw()
{
  background(20, 0, 150);
  resetShip();
  moveShip();
  drawShip();
  drawObstacle();
  moveObstacle();
  collisionOccured();
  drawTarget();
  targetHit();
  drawLevel();
}
