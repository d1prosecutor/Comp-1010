int number = 0;

 

void setup()

{

  size(500, 500);

}

 

void draw()

{

 background(0);

 

 int copy = number;

 int digits = 0;

 if (number == 0)

 {

  digits = 1;

 } else {

  while (copy > 0)

  {

   copy /= 10;

   digits++;

  }

 }

 

 textSize(1.5*width/digits);

 text(number, 0, height);

 number+=mouseX;

}
