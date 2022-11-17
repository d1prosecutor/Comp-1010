final color DARK_RED = color(220, 20, 50);
final int NUM_ROWS = 5;
final int NUM_RINGS = 8;
final int MAX_DIAM = 80;
final int RING_DIFF = 5;
final int FIRST_TARGET_X = 80;
final int FIRST_TARGET_Y = 80;
final int TARGET_SPACING = 100;

size(600, 600);
background(255);

int centerX = FIRST_TARGET_X;
int centerY = FIRST_TARGET_Y;

for (int i=0; i<NUM_ROWS; i++)
{
  for (int j=i; j<NUM_ROWS; j++)
  {
    for (int circle=NUM_RINGS; circle>0; circle--)
    {
      if (circle%2 == 0)
        fill(DARK_RED);
      else
        fill(255);

      circle(centerX+i*TARGET_SPACING, centerY+j*TARGET_SPACING, circle*RING_DIFF*2);
    }
  }
}
