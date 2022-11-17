/* Grid
   Example for COMP 1010
   
   Draw a grid of N vertical and horizontal lines
   equally spaced in the window.
*/

size(500,500);

//Try to get 8 "squares" each way.
final int N = 9; //To get 8 "squares" you need 9 lines

for(int i=0; i<N; i++){
  //i will become 0,1,...N-1 (N different values)
  float xPosition = (width-1)*(i/(N-1.0));
  float yPosition = (height-1)*(i/(N-1.0));
  //Draw one horizontal and one vertical line, full size
  line(0,yPosition,width-1,yPosition);
  line(xPosition,0,xPosition,height-1);
}
