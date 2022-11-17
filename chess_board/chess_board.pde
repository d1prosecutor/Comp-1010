final int NUM_ROWS = 10; // number of rows of rectangles

final int RECT_HEIGHT = 50; // height of each row

final int MIN_WIDTH = 10; // minimum and maximum values
final int MAX_WIDTH = 40; // for randomly selected widths

// for setting fill colors
final int BLACK = 0; 
final int WHITE = 255; 

void setup() {
  // DO NOT EDIT THIS FUNCTION
  size(500, 500);
  noLoop();
}


void draw()
{
  // put all of your code here
  // do not use arrays
  // do not create any global variables or user-defined functions
  int rectWidth = 0;
 


  for (int j=0; j<NUM_ROWS; j++)
  {  
    int leftX =0;
    int rectDrawn = j;
    
    while (leftX<width) 
    {
      if (rectDrawn %2 ==0)
      {
        fill(WHITE);
      } else 
      {
        fill(BLACK);
      }
      rectWidth = (int)random(MIN_WIDTH, MAX_WIDTH);
      rect(leftX, j*RECT_HEIGHT, rectWidth, RECT_HEIGHT);
      
      leftX += rectWidth;      
      rectDrawn++;
    }
  }
}
