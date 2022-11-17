final int DIAM = 50;
final int MAX_CIRCLES = 200;
int[] circX;
int[] circY;
color[] colors;
int numCircles;

void setup()
{
  size(500, 500);
  circX =  new int[MAX_CIRCLES];
  circY =  new int[MAX_CIRCLES];
  colors = new int[MAX_CIRCLES];
  numCircles = 0;
}

void draw()
{
  for (int i=0; i<numCircles; i++)
  {
    fill(colors[i]);
    circle(circX[i], circY[i], DIAM);
  }
}

void mouseReleased()
{
  if (numCircles < MAX_CIRCLES);
  {
    circX[numCircles] = mouseX;
    circY[numCircles] = mouseY;
    colors[numCircles] = color(random(255), random(255), random(255));
    numCircles++;
  }
}

void keyPressed()
{
  if (key =='r' || key =='R')
  {
    for (int i=0; i< MAX_CIRCLES; i++)
    {
      colors[i] = color(random(255), random(255), random(255));
    }
  }
}
