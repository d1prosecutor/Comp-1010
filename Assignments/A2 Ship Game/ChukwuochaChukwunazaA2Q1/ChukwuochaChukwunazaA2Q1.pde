/* Chukwunaza Chukwuocha 
 Comp 1010 Assignment 2 Question 1
 
 draws a spaceship on a dark background 
 so that its nose is at the center of the canvas
 and so that it is pointing in a randomly chosen direction.
 */

//Global constants for the size and shape of the ship
final float shipLength = 50;// length of the ship
final float shipShape = radians(12);// 

//Global variables for the position and direction of the ship
float shipDirection = random(90);// the direction the ship is pointing
float shipNoseX;// x coordinate of the nose of the ship
float shipNoseY;// y coordinate of the nose of the ship

//variables for the position of Other vertices
float rightVerticeY;
float rightVerticeX;
float leftVerticeY;
float leftVerticeX;

void setup()
{
  size(600, 300);
  shipNoseX = (width / 2);
  shipNoseY = (height / 2);
}

void draw()
{
  background(0, 0, 120);
  drawShip();
}

void drawShip()
{
  //variables for the position of Other vertices
  rightVerticeY = shipNoseY - (shipLength * sin(shipDirection - shipShape));
  rightVerticeX = shipNoseX - (shipLength * cos(shipDirection - shipShape));
  leftVerticeY = shipNoseY - (shipLength * sin(shipDirection + shipShape));
  leftVerticeX = shipNoseX -(shipLength * cos(shipDirection + shipShape));


  stroke(0);
  strokeWeight(2);
  fill(255, 255, 0);
  triangle(shipNoseX, shipNoseY, leftVerticeX, leftVerticeY, rightVerticeX, rightVerticeY );
}
