/* Example - COMP 1010
   Written by J. Bate, Aug, 2016
   
   Make a ball orbit the mouse position
*/

//the current angle to the ball from the centre
float angle = 0;

//How fast that angle is changing (the speed of the ball)
//This is in radians per frame (how much the angle changes each frame)
final float SPEED = 0.1; //Find a good value by experimentation

//Standard colours
final int BLACK = 0;
final int WHITE = 255;
final int YELLOW = #FFFF00;

//The size of the ball and its orbit
final int BALL_DIAMETER = 10;
final int ORBIT_RADIUS = 30;

void setup(){
  size(500,500);
}

void draw(){

  //erase the window and start a new image
  background(BLACK);
       
  //Draw the ball, in yellow (and white outline)
  fill(YELLOW);
  stroke(WHITE);
  ellipse(mouseX+ORBIT_RADIUS*sin(angle),
          mouseY+ORBIT_RADIUS*cos(angle),
          BALL_DIAMETER,BALL_DIAMETER);
  
  //Change the angle each time
  angle = angle+SPEED;
  
}
