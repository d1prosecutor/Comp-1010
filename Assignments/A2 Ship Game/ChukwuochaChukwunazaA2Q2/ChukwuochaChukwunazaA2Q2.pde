/* Chukwunaza Chukwuocha 
 Comp 1010 Assignment 2 Question 1
 
 draws a spaceship on a dark background 
 so that its nose is at the center of the canvas
 and so that it is pointing in a randomly chosen direction. 
 */

//Global constants for the size of the canvas
//must be changed when 'width' and 'height' are changed
final int WIDTH = 600;
final int HEIGHT = 300;

//Global constants for the size and shape of the ship
final float shipLength = 50;// length of the ship
final float shipShape =(PI/15);// 

//Global constant for the speed of the ship
final float shipSpeed = 1;

//Global variables for the position and direction of the ship
float shipDirection = random(0, TWO_PI);// the direction the ship is pointing
float shipNoseX = WIDTH / 2;// x coordinate of the nose of the ship
float shipNoseY = HEIGHT / 2;// y coordinate of the nose of the ship

//Variable for the new direction the ship will point to 
//whenever it is reset
float newShipDirection;

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

//Global variables to hold the current state of the ship
boolean shipMoving = false;
boolean shipReset;

void setup()
{
  size(600, 300);
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
  if (!shipMoving && key == ' ')
  {
    shipMoving = true;
    shipReset = false;
  } else if (shipMoving && key ==' ')
  {
    shipReset = true;
    shipMoving = false;

    shipDirection = newShipDirection;
  }
}

void moveShip()
{
  newShipDirection = random(0, TWO_PI);

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
    shipDirection = newShipDirection;
  }
}

void resetShip()
{
  if (shipReset)
  {


    shipNoseX = WIDTH / 2;
    shipNoseY = HEIGHT / 2;
  }
}

void draw()
{
  background(0, 0, 120);
  resetShip();
  moveShip();
  drawShip();
}
