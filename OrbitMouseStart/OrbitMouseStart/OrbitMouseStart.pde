//Fix this code so that it uses good programming practices: constants,
//loops, functions, etc.

float angle = 0.0;

void setup(){
  size(800,500); 
}

void draw(){
  background(190);

  float x = mouseX + 40 * cos(angle);
  float y = mouseY + 40 * sin(angle);
  ellipse(x,y,10,10);

  x = mouseX + 40 * cos(angle+0.4);
  y = mouseY + 40 * sin(angle+0.4);
  ellipse(x,y,10,10);

  x = mouseX + 40 * cos(angle+0.8);
  y = mouseY + 40 * sin(angle+0.8);
  ellipse(x,y,10,10);

  angle = angle - 0.02;
}
