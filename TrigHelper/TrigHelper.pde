//The size of the arc that shows which angle is being used
final float ARC_SIZE = 70;

//The positions of the seven text displays at the bottom
final int ANGLE_DISPLAY_X = 260;
final int ANGLE_DISPLAY_Y = 470;
final int DEGREE_DISPLAY_X = 260;
final int DEGREE_DISPLAY_Y = 495;
final int DISTANCE_DISPLAY_X = 10;
final int DISTANCE_DISPLAY_Y = 395;
final int SIN_DISPLAY_X = 10;
final int SIN_DISPLAY_Y = 420;
final int D_SIN_DISPLAY_Y = 470;
final int COS_DISPLAY_X = 10;
final int COS_DISPLAY_Y = 445;
final int D_COS_DISPLAY_Y = 495;

void setup() {
  size(500,500);
  strokeWeight(2); //Double-thickness lines will be used
}

void draw() {
  background(200); //A light grey background
  
  //Tricky part: The arc showing the angle
  stroke(0); fill(128); //Grey with a black line
  float xAxisAngle = 0; //The arc starts at the x axis
  //and the arc finishes at the angle that goes
  //from the centre to the mouse position
  float mouseAngle = atan2(mouseY-height/2,mouseX-width/2);
  //Draw the arc. Same as an ellipse, but with start and ending angles
  arc(width/2,height/2,ARC_SIZE,ARC_SIZE,
      //The start angle always has to be the smaller one
      min(xAxisAngle,mouseAngle),
      //And the end angle always has to be the bigger one
      max(xAxisAngle,mouseAngle),
      PIE); //This is a predefined constants that selects a "pie" shape.
      
  //draw in the X and Y axes (black)
  stroke(0); //Black
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  
  //A red line from the centre to the mouse (the hypoteneuse)
  stroke(255,0,0);
  line(width/2,height/2,mouseX,mouseY);
  
  //Draw the x and y components of the mouse position, too
  stroke(255,0,255); //Make the vertical line purple
  line(mouseX,height/2,mouseX,mouseY); //vertical line
  stroke(0,0,255); //Make the horizontal line blue
  line(width/2,height/2,mouseX,height/2); //horizontal line
  
  //Display some text showing what the angle is
  textSize(18); //Make it fairly big
  fill(0); //And black
  text("Angle = "+-mouseAngle,ANGLE_DISPLAY_X,ANGLE_DISPLAY_Y);
  text("(or "+(-mouseAngle*180.0/PI)+" degrees)",DEGREE_DISPLAY_X,DEGREE_DISPLAY_Y);
  //And what the distance of the mouse from the centre is
  // (That's the length of the red line)
  float distance = sqrt(sq(mouseX-width/2)+sq(mouseY-height/2));
  fill(255,0,0); //The line is red - make the text red, too.
  text("distance d = "+int(distance),DISTANCE_DISPLAY_X,DISTANCE_DISPLAY_Y);
  //And now the sin and cos values, too (x and y distances)
  fill(255,0,255); //The vertical line is purple
  text("sin(angle) = "+sin(-mouseAngle),SIN_DISPLAY_X,SIN_DISPLAY_Y);
  text("d*sin(angle) = "+(height/2-mouseY),SIN_DISPLAY_X,D_SIN_DISPLAY_Y);
  fill(0,0,255); //The horizontal line is blue
  text("cos(angle) = "+cos(mouseAngle),COS_DISPLAY_X,COS_DISPLAY_Y);
  text("d*cos(angle) = "+(mouseX-width/2),COS_DISPLAY_X,D_COS_DISPLAY_Y);
 
}
