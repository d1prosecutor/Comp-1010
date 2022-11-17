import javax. swing. JOptionPane;
final int SPACING = 30;
String s;

void setup () {
  size (500, 500);
  textsize(30);
  background (0) ;
  fill (200, 100, 50) ;
  S = JOptionPane. showInputDialog ("Type in a word or phrase") ;
}
void draw()
{
  // go down the screen, one row at a time, chaning yPos
  for (int yPos = SPACING; yPos < height; yPos+= SPACING) 
  {
    int xPos = SPACING; // each row restart at left
    // each row add one more letter, until we
    // run out of letters
    for (int i = 0; i < min (yPos/SPACING, s.length()); i++) 
    {
      text(s. charAt (i), xPos, yPos) ;
      xPos += SPACING; // have to increment spacing for each letter
    }
  }
}
