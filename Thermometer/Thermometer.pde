final int S_TOP = 100;

final int S_LEFT = 30;

final int S_WIDTH = 430;

final int S_HEIGHT = 30;

final int HOT = 50; // celcius

final int COLD = -80;

final int TEMP_RANGE = HOT-COLD;

final int xOffset = 0;


 

void setup()

{

  size(500, 500);

}

 

void drawScaleBackground()

{

  stroke(255);

  fill(0);

  rect(S_LEFT, S_TOP, S_WIDTH, S_HEIGHT);

}

 

void drawScaleLabels()

{

  fill(255);

 

  int x = S_LEFT;

  int y = S_TOP;

  

  float f = 9.0/5.0*COLD+32;

  

  String celsius = COLD+"c";

  String fahrenheit = f+"f";

  text(celsius, x, y);

  text(fahrenheit, x, y+S_HEIGHT);

  

  x = S_LEFT + S_WIDTH;

  f = 9.0/5.0*HOT+32;

  celsius = HOT+"c";

   fahrenheit = f+"f";

  text(celsius, x, y);

  text(fahrenheit, x, y+S_HEIGHT);

}

  

void fillScaleUsingMouse()

{

   // fill in thermometer

  int xOffset = mouseX - S_LEFT; // how far along scale

  xOffset = max(0, xOffset); // if <0, make 0

  xOffset = min(S_WIDTH, xOffset); // if >width, make width

  fill(127);

  rect(S_LEFT, S_TOP, xOffset, S_HEIGHT);

}

 

void drawScaleReading()

{

   // output the reading from the mouse

   float xOffset = mouseX - S_LEFT; // how far along scale

   float tempPerc = xOffset/(float)(S_WIDTH);

  float tempC = tempPerc*TEMP_RANGE+COLD;

  float tempF = 9.0/5.0*tempC+32;

  String message = "Temperature: "+tempC+"c, "+tempF+"f.";

  stroke(255);

  text(message, 20, 20);

}

 

void draw()

{

  background(0);

  drawScaleBackground();

  drawScaleLabels();

  fillScaleUsingMouse();

  drawScaleReading();

}
