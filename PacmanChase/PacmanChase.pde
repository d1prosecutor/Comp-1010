/* This program draws an animated pacman whose mouth opens
   and snaps shut, and who chases the mouse around the screen.
   
   Example for COMP 1010
   Written by J. Bate Aug 2016
   
   This example uses the float data type, which has not been covered yet.
   In this case, it simply means that fractional values like 3.56 are allowed.
*/

//The variables that control everything known about the pacman
float pacmanX, pacmanY;           //The position of the pacman
final int PACMAN_DIAMETER = 50; //The diameter of the pacman
float pacmanAngle = 0.0;        //The direction the pacman is facing
float pacmanMouth = 0.0;        //The angle that the mouth is open

void setup(){
   size(500,500);
   pacmanX = width/2;  //Start the pacman in the
   pacmanY = height/2; //centre of the canvas
}

void draw(){
  background(128); //draw a fresh frame each time
  movePacman();    //Move the pacman toward the mouse
  turnPacman();    //Turn it to face the mouse
  calcMouthAnimation();  //Make the mouth open and close
  drawPacman();    //And draw it
}

void drawPacman(){
  /* Draw an arc filled with yellow to represent a "pacman". It will
     be drawn at position (pacmanX,pacmanY) with a diameter of
     PACMAN_DIAMETER. It will face in the direction
     given by pacmanAngle, and the mouth will be open at an angle of
     pacmanMouth. This angle will increase by PACMAN_MOUTH_SPEED radians each
     frame, until it reaches PACMAN_MAX_MOUTH, and snaps shut.
  */  
  fill(255,255,0); //yellow pacman
  stroke(0);       //with a black outline
  strokeWeight(2); //that's a little thicker
  //Use the arc command to draw it
  arc(pacmanX, pacmanY, PACMAN_DIAMETER, PACMAN_DIAMETER,
      pacmanAngle+pacmanMouth/2, pacmanAngle+TWO_PI-pacmanMouth/2, PIE);

}

void calcMouthAnimation(){
  //This function changes the pacmanMouth variable so that it slowly
  //increases from 0 to PACMAN_MAX_MOUTH, then snaps closed to 0 again.
  final float PACMAN_MOUTH_SPEED = 0.08;
  final float PACMAN_MAX_MOUTH = 1.5;
  //Increase the mouth opening each time, but snap it shut at the maximum
  pacmanMouth = (pacmanMouth + PACMAN_MOUTH_SPEED)%PACMAN_MAX_MOUTH;
}
 
void movePacman(){
  //Change the pacman's position (paxmanX and pacmanY) by 1/Nth
  //of the distance from the pacman to the mouse, in both X and Y.
  int N = 20; //Try moving 1/20th of the way each frame.
  float xChange = (mouseX-pacmanX)/N;
  float yChange = (mouseY-pacmanY)/N;
  //Move the pacman by those amounts.
  pacmanX = pacmanX + xChange;
  pacmanY = pacmanY + yChange;
}

void turnPacman(){
  //Set the pacmanAngle variable to be the angle from the pacman to the mouse
  //Wait until Week 4 material has been done to discuss this.
  pacmanAngle = atan2(mouseY-pacmanY,mouseX-pacmanX);
}
