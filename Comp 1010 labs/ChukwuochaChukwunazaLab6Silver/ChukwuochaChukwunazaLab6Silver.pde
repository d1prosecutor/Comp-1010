/*
Chukwunaza Chukwuocha
Comp 1010 A02 - Lab 6 Silver

Displays text entered by the user on the canvas in a random and rather annoying
manner but such that all text fits correctly in te canvas
*/

void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  // This block performs no function whatsoever
}

void keyPressed()
{
  fill(0);// sets the colour of the character displayed to black
  textSize(25);// sets the size of the character

  if (keyPressed)
  {
    char letterPressed = key;// stores the key pressed in letterPressed

    float textWidth = textWidth(letterPressed);// stores the width of the character pressed

    float textHeight = textAscent() + textDescent();//stores the height of the character

    //variables to make sure the character is never printed outside the canvas
    float xTextLocation = random(0, width-textWidth);  
    float yTextLocation = random(textHeight, height);

    /*Displaying the character Pressed at random location in the canvas
    such that the charcter is fits inside the canvas*/
    text(letterPressed, xTextLocation, yTextLocation);
  } 
  if (key == '\n')
  {
    //Clears the canvas when the enter/return key is pressed
    background(255);
  }
}
