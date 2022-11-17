
//global constants 
final int DIAMETER = 50; //diameter of our circle 
int counter = 0;

void setup()
{
  //setting the size of canvas 
  size(500,500);
}

void draw()
{
  //set the colour of backgroud (WHITE)
 background(255);
 
 //Set the colour of our circle 
 fill(130,0,0);
 ellipse(mouseX, mouseY, DIAMETER, DIAMETER);
  
  
}
