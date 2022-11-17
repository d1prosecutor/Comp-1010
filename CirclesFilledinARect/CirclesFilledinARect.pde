void setup()
{
  size(500, 500);
}
void draw()
{
  texturedRect(50, 100, 400, 200, 5, 8);
}
void texturedRect(int left, int top, 
  int wide, int high, 
  int rows, int cols) {
  stroke(0);
  strokeWeight(1);
  fill(255);
  rect(left, top, wide, high);
  float ellipseWide = (float)wide/cols;
  float ellipseHigh = (float)high/rows;

  for (int r=0; r<rows; r++) {
    float y = top+(r+0.5)*ellipseHigh;

    for (int c=0; c<cols; c++) {
      float x = left+(c+0.5)*ellipseWide;

      ellipse(x, y, ellipseWide, ellipseHigh);
    }
  }
}
