int diam=10; 

void setup() {
  size(500, 500);
}


void draw() {
  background(0);
  int canvasCenter=500/2;

  //start the drawing at the middle of the canvas
  int x=canvasCenter;
  int y=canvasCenter;

  //figure out the distance between the two points (canvas center and the mouse)
  float distance=sqrt(pow(mouseX-canvasCenter, 2) + pow(mouseY-canvasCenter, 2));

  //figure out total number of circles that means
  int number=round(distance/diam)+1;
  noFill();
  stroke(255);

  //figure out how much you need to add to x and y each time you draw a new circle based on where the mouse is
  float xDist=(mouseX-canvasCenter)/(number);
  float yDist=(mouseY-canvasCenter)/(number);


  for (int i=0; i<=number; i++)
  {
    //draw a circle (add 2.5 so they look like a chain)
    circle(x, y, diam+2.5);

    //move the center before the loop makes the drawing happen again
    x+=xDist;
    y+=yDist;
  }
}
