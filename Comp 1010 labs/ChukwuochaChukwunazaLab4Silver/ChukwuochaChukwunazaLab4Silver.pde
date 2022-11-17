/*Chukwunaza Chukwuocha
Comp 1010 - A02 Lab4 Silver
Draws a planet revolving around the sun*/

//declaring the costants
final int SUN_SIZE = 50;

final int ORBIT_X_RADIUS = 150;
final int ORBIT_Y_RADIUS = 35;

//declaring the variables
float planetX;//x co-ordinate of planet
float planetY;//y co-ordinate of planet
float planetSize = SUN_SIZE/2;

//variables for changing the size of the planet as it moves
float changeDiamX;
float changeDiamY;

float angle = 0;

void setup()
{
  size(500, 500);
}

void drawSun()
{
  fill(255, 255, 0);
  ellipse(width/2, height/2, SUN_SIZE, SUN_SIZE);
}

void movePlanet()
{
  //This moves the planet around the sun
  planetX = ORBIT_X_RADIUS * cos(angle);
  planetY = ORBIT_Y_RADIUS * sin(angle);

  angle += 0.03;
}

void changePlanetDiam()
//This changes the size of the planet
{
  changeDiamX = 10 * sin(angle);
  changeDiamY = 10 * sin(angle);
}

void drawPlanet()
{
  fill(100);
  ellipse(width/2 + planetX, height/2 + planetY, planetSize+changeDiamX, planetSize+changeDiamY);
}

void draw()
{
  background(0);
  drawSun();
  movePlanet();
  changePlanetDiam();
  drawPlanet();
}
