final int DROP_START = 250;
final int DROP_SPACING = 125;
final int DROP_DIAM = 30;
final int DROP_SPEED = 3;

int dropFallen = 0;

void setup()
{
  size(600,800);
}

void draw()
{
  background(192);
  drawDrops();
}

void drawDrops()
{
  fill(255);
  int nextDrop = DROP_START + dropFallen;
  
  while(nextDrop<height+DROP_DIAM/2)
  {
    ellipse(width/2, nextDrop, DROP_DIAM, DROP_DIAM);
    nextDrop += DROP_SPACING;
  }
  dropFallen = (dropFallen+DROP_SPEED)%DROP_SPACING;
  println(dropFallen);
}
