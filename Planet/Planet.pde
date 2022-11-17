final int PLANET_SIZE = 30;
int planetX = 0;
int planetY = 0;
int planetMoveX = 0;
int planetMoveY = 0;
int orbitSize = 480;
final int FRICTION = 10;

void drawCircle()
{
  fill(0, 0);
  strokeWeight(5);
  stroke(255);
  ellipse(250,250,500,500);
}
void drawPlanet()
{
  ellipse(planetX, planetY, PLANET_SIZE, PLANET_SIZE);
  line(planetX-(PLANET_SIZE/2), planetY, planetX+(PLANET_SIZE/2), planetY);
}

void attractToMouse()
{
  int diffX = mouseX-planetX;
  int diffY = mouseY-planetY;
  planetMoveX = planetMoveX+diffX;
  planetMoveY = planetMoveY+diffY;
}

void addFriction()
{
  planetMoveX = planetMoveX/FRICTION;
  planetMoveY = planetMoveY/FRICTION;
}

void movePlanet()
{
  planetX = (planetX + planetMoveX)%orbitSize;
  planetY = (planetY + planetMoveY);
}

void setup()
{
  size(500,500);
}

void draw()
{
  background(0);
  drawCircle();
  drawPlanet();
  attractToMouse();
  addFriction();
  movePlanet();
}
