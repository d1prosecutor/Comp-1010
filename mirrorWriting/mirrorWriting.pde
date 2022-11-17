final int MAX_POINTS = 100000; //Allow a lot of points
int[] xCoords = new int[MAX_POINTS];
int[] yCoords = new int[MAX_POINTS];
int numPoints = 0;
void setup() {
  size(500, 500);
}
void draw() {
  if (mousePressed) {
    //just collect the current mouseX,mouseY coordinates
    xCoords[numPoints] = mouseX;
    yCoords[numPoints] = mouseY;
    numPoints++;
  } else {
    //Draw the line stored in the arrays, and clear it out.
    for (int i=1; i<numPoints; i++)
      line(width-xCoords[i-1], yCoords[i-1], 
        width-xCoords[i], yCoords[i]);
    numPoints = 0; //Start all over again next time.
  }
}
