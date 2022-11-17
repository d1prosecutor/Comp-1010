float grid = 10;

void setup()

{

 size(500, 500);

 stroke(255);

}

 

void draw()

{

 background(0);

 

 // calculate grid spacing

 grid = mouseX/10+1; // +1 to avoid / by 0

 float cellSizeX = width/grid;

 float cellSizeY = height/grid;

 

 // draw the lines

 for (int i = 0; i < grid; i++)

 {

  line(cellSizeX*i, 0, 499, cellSizeY*i);

 }

}
