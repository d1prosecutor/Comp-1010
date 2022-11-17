int circleCenterX =250;
int circleCenterY =250;
int circleColour = 255;
int circleSize = 30;
void setup()
{
  size(500, 500);
}
  
void draw()
{
  background(0);
  fill(circleColour);
  ellipse(circleCenterX, circleCenterY, circleSize, circleSize); 
  int diffX = (mouseX-circleCenterX);
  circleCenterX=(circleCenterX+diffX/10);
  int diffY = (mouseY-circleCenterY);
  circleCenterY=(circleCenterY+diffY/10);
  stroke(255);
  strokeWeight(2);
  line(mouseX,mouseY,circleCenterX,circleCenterY);
  circleCenterY= circleCenterY+15;
}
