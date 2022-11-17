/*Chukwunaza Chukwuocha
 COMP 1010 LAB 5 Silver
 
 Making the rose from lab 4 Gold draw with a
 different colour for each petal
 */

//The constants needed in the equations for the "rose"
final float K = 4; //The factor that controls the number of "petals"
final float RATE = 0.02; //The change in t each frame. Controls speed and smoothness.
final float ROSE_RADIUS = 200; //The radius, in pixels, of the "rose"

//The "state" variables that remember what's happening
float t = 0; //The "parameter" t which will slowly change from 0 to 2PI
float prevX; //What were x...
float prevY; //...and y last time?

float distPrevPoint;// distance from the point in the previous frame to the center

boolean prevToCenter;//This shows if the previous point 
//is approaching the center

void setup() {
  size(500, 500);  //Usual window size
  background(0);   //Use a black background, and...
  strokeWeight(2); //nice thick lines
  stroke(255);     //that are white

  //Precalculate the first point (with t=0). This must be done
  //after the size command because width and height are needed.
  prevX=width/2+ROSE_RADIUS;
  prevY=height/2;

  distPrevPoint = dist(width/2, height/2, prevX, prevY);//distance from the center to the
  //point in the previous frame

  prevToCenter = true;//the point is approaching the center at the beginning
}


void draw() {
  //Calculate the new point
  float x = cos(K*t)*cos(t)*ROSE_RADIUS+width/2;
  float y = cos(K*t)*sin(t)*ROSE_RADIUS+height/2;

  float distNewPoint = dist(width/2, height/2, x, y); //distance from the point in the current frame to the center
  boolean newToCenter = (distNewPoint < distPrevPoint);//This shows if the new point 
  //is approaching the center


  if (prevToCenter && !newToCenter) {

    stroke(random(255), random(255), random(255));
  }

  line(prevX, prevY, x, y); //draw the next line

  //Keep all the information needed for next time
  prevX = x;
  prevY = y;
  distPrevPoint = distNewPoint;
  prevToCenter = newToCenter;



  //Advance t
  t +=RATE;
}//draw
