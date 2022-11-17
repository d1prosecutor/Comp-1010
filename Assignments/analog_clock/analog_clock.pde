int clockRadius = 100;

int tickSize = 1;

int largeTickSize = 3;

 

void setup()

{

 size(500, 500);

 stroke(255);

}

 

void draw()

{

 background(0);

 float angle;

 float x;

 float y;

 

 // draw tick marks

 for (int i = 0; i < 60; i++)

 {

  angle = i/60.0 * 2 * PI; // angle to dot

  // center these on canvas

  x = cos(angle)*clockRadius + width/2;

  y = sin(angle)*clockRadius + height/2;

  if (i%5 == 0)

  {

   ellipse(x, y, largeTickSize, largeTickSize);

  } else {

   ellipse(x, y, tickSize, tickSize);

  }

 }

 

 // calculate and draw the second hand

 angle = second()/60.0*PI*2;

 x = cos(angle)*clockRadius + width/2;

 y = sin(angle)*clockRadius + height/2;

 line(width/2, height/2, x, y);

}
