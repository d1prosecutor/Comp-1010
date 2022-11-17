void setup()
{
  size(500,500);
}

void draw()
{
  float lineLength = dist(mouseX, mouseY, pmouseX, pmouseY);
  println(lineLength);
  line(mouseX, mouseY, mouseX, mouseY+lineLength);
}
