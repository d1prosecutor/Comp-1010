/*
Chukwunaza Chukwuocha
 Comp 1010 - A02 lAB 4
 Drawing the head and ears of a panda
 */

//declaring the constants 
final int HEAD_SIZE = 50;
final float EAR_SIZE = 0.60*HEAD_SIZE;
final float EAR_DISTANCE = 0.45*HEAD_SIZE;
final float RIGHT_EAR_ANGLE = -QUARTER_PI;
final float LEFT_EAR_ANGLE = 5 * QUARTER_PI;

void setup()
{
  size(500, 500);
  background(200);
}

void drawPandaHead()
{
  fill(255);
  ellipse(mouseX, mouseY, HEAD_SIZE, HEAD_SIZE);
}

void drawPandaEars()
{
  //drawing the right ear
  fill(0);
  float rightEarX = cos(RIGHT_EAR_ANGLE)*EAR_DISTANCE;
  float rightEarY = sin(RIGHT_EAR_ANGLE)*EAR_DISTANCE;

  ellipse(mouseX + rightEarX, mouseY + rightEarY, EAR_SIZE, EAR_SIZE);

  //drawing the left ear
  float leftEarX = cos(LEFT_EAR_ANGLE)*EAR_DISTANCE;
  float leftEarY = sin(LEFT_EAR_ANGLE)*EAR_DISTANCE;

  ellipse(mouseX + leftEarX, mouseY + leftEarY, EAR_SIZE, EAR_SIZE);
}

void draw()
{
  background(200);
  drawPandaEars();
  drawPandaHead();
}
