float angle = 0;
final float SPEED = radians(3);//TWO_PI/120
void setup() {
  size(400, 400);
}
void draw() {
  size(400, 400);
  background(255); //white background
  strokeWeight(6); //thick lines, as shown
  stroke(0, 255, 0);
  line(width/2, height/2, width/2, height);

  fill(255, 0, 0);
  stroke(0);
  ellipse(width/2, height/2, width/2, width/2);

  fill(255);
  rect(3*width/8, 3*height/8, width/4, height/4);

  fill(0);
  ellipse(width/2+width/3*cos(angle), height/2+width/3*sin(angle), 
    width/40, width/40);
  angle += SPEED;
}
