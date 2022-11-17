/*Chukwunaza Chukwuocha
 Comp 1010 - Assignment 3
 
 Creates a text styler Application...from SCRATCH!!!
 */

import javax.swing.JOptionPane;// Imports the java library for the pop up box

//Constants for the size of the canvas
//Must be changed if the size of the canvas is changed
final int CANVAS_WIDTH = 800;
final int CANVAS_HEIGHT = 400;

// Constant for the Number of buttons at the top button bar
final int NUM_OF_BUTTONS = 8;

//Constants for the Height and Width of the buttons at the top button bar
final int BUTTON_WIDTH = CANVAS_WIDTH/NUM_OF_BUTTONS;
final int BUTTON_HEIGHT = CANVAS_HEIGHT/10;

//Constant for the number of color hues and saturation represented in the color Palette
final int NUMBER_OF_HUES = 20;// Number of colours represented
final int SUB_SWATCH_NUM = 4;// number of sub swatches which represent the saturation

//Constants for the width and height of the color swatches
final int SWATCH_WIDTH = CANVAS_WIDTH/NUMBER_OF_HUES;// width of the hue swatches
final int SWATCH_HEIGHT = CANVAS_HEIGHT/10;//  height of the hue swatches
final int SUB_SWATCH_HEIGHT = SWATCH_HEIGHT/SUB_SWATCH_NUM;// height of the saturation swatches

//Constant for the brightness and saturation of the colours
final int COLOR_BRIGHTNESS =150;
//final int COLOR_SATURATION =150;//not needed in final code

//String variables for the different transformations of the user text
String userText = "";// stores the original text gotten foem the user
String toUpperCase = "";// changes the user text to Upper Case
String toLowerCase = "";// changes the user text to Lower Case
String toInvertedCase = "";// Inverts the user text
String toCamelCase = "";// changes the user text to Camel Case
String toConstantCase = "";// changes the user text to Consant Case
String toBackwardsCase = "";//Re-writes the user text backwards

//This displays the current form of the user text depending on the button clicked
String displayText = "";

// Global color Variable for the text displayed
color textColor = color(0, 0, 0);

void setup()
{
  size(800, 400);
  getText();
}

void drawButton()
{
  //Draws the buttons at the top bar
  colorMode(RGB);// Chnages the color mode to RGB
  for (int i=0; i<=CANVAS_WIDTH; i++)
  {
    strokeWeight(2);
    stroke(0);
    if ((mouseX > i*BUTTON_WIDTH && mouseX < (i+1)*BUTTON_WIDTH)&&(mouseY < BUTTON_HEIGHT))
    {
      fill(120, 0, 200);
    } else {
      fill(0, 0, 250, 100);
    }
    rect(i*BUTTON_WIDTH, 0, BUTTON_WIDTH, BUTTON_HEIGHT);
  }
}

void drawButtonLabel()
{
  /* Draws the labels of each button at the button bar
   Calculations are done to make sure the text is vertically aligned and centered
   The text is aligned horizontally by offsetting the textwidth/2 from the button center
   and is aligned vertically by making the starting point of the text buttonCenter+TextHeight/2
   */
  fill(0);
  textSize(15);
  float textHeight = textAscent() + textDescent();
  float textYLocation = (BUTTON_HEIGHT/2)+(textHeight/2);
  text("New...", (BUTTON_WIDTH/2)-(textWidth("New...")/2), textYLocation);
  text("Original", (BUTTON_WIDTH/2)-(textWidth("Original")/2) + BUTTON_WIDTH, textYLocation);
  text("UPPER", (BUTTON_WIDTH/2)-(textWidth("UPPER")/2) + 2*BUTTON_WIDTH, textYLocation);
  text("lower", (BUTTON_WIDTH/2)-(textWidth("lower")/2) + 3*BUTTON_WIDTH, textYLocation);
  text("iNVERT", (BUTTON_WIDTH/2)-(textWidth("iNVERT")/2) + 4*BUTTON_WIDTH, textYLocation);
  text("camelCase", (BUTTON_WIDTH/2)-(textWidth("camelCase")/2) + 5*BUTTON_WIDTH, textYLocation);
  text("CONSTANT", (BUTTON_WIDTH/2)-(textWidth("CONSTANT")/2)+  6*BUTTON_WIDTH, textYLocation);
  text("Backwards", (BUTTON_WIDTH/2)-(textWidth("Backwards")/2)+  7*BUTTON_WIDTH, textYLocation);
}

void getText()
{
  //shows an input box and stores the user's input in userInput
  String userInput = JOptionPane.showInputDialog("Enter a short phrase");

  if (userInput != null)// Solves the null problem if the user clicks cancel or something else
  {
    userText = userInput;// copies a non-null value into userText
    upperCase();
    lowerCase();
    invertedCase();
    camelCase();
    constantCase();
    backwardsCase();
    displayText = userText;// stores the original form of the text in DisplayText
  } else {
    displayText = userText;
  }
}

void upperCase()
{
  //converts the user's Text to Upper case
  toUpperCase = userText.toUpperCase();
}

void lowerCase()
{
  //converts the user's Text to Lower Case
  toLowerCase = userText.toLowerCase();
}

void invertedCase()
{
  toInvertedCase = "";

  //Inverts the casing of all the characters in the user's text 
  for (int i=0; i<userText.length(); i++)
  {
    if (Character.isUpperCase(userText.charAt(i)))
    {
      toInvertedCase += Character.toLowerCase(userText.charAt(i));
    } else if (Character.isLetter(userText.charAt(i)))
    {
      toInvertedCase += Character.toUpperCase(userText.charAt(i));
    }
  }
}

void camelCase()
{
  toCamelCase = "";

  //Converts the user's text to camelCase
  //(as used in processing for declaring variables and functions)
  for (int i=0; i<userText.length(); i++)
  {
    if (i>0 && Character.isSpaceChar(userText.charAt(i-1)) && Character.isLetter(userText.charAt(i)))
    {
      //converts the letter after space to Upper Case 
      toCamelCase += Character.toUpperCase(userText.charAt(i));
    } else if (Character.isLetter(userText.charAt(i)))
    {
      //The Character.isLetter() method takes care of removing the space 
      //between the words
      toCamelCase += Character.toLowerCase(userText.charAt(i));
    }
  }
}


void constantCase()
{
  toConstantCase = "";

  //converts the user's text to constant case(as used in processing for declaring constants)
  for (int i=0; i<userText.length(); i++)
  {
    if (Character.isSpaceChar(userText.charAt(i)))
    {
      // replaces spaces with Underscores
      toConstantCase += '_';
    } else if (Character.isLetter(userText.charAt(i)))
    {
      //converts every other letter ton upper case
      toConstantCase += Character.toUpperCase(userText.charAt(i));
    }
  }
}

void backwardsCase()
{
  //re-writes the user's text backwards(from the last to the first character) 
  //without altering the text
  for (int i=0; i<userText.length(); i++)
  {
    toBackwardsCase += (userText.charAt((userText.length()-1)-i));
  }
}

void drawText()
{
  fill(textColor);
  textSize(30);

  //Draws the text, offsetting it horizontally from the center of the canvas
  text(displayText, (CANVAS_WIDTH/2)-(textWidth(displayText)/2), (CANVAS_HEIGHT/2)+(textAscent()/2));
}

void mousePressed()
  //All the nested if-else if statements are used to determine which button is clicked
{
  if (mouseY < BUTTON_HEIGHT)
  {
    if (mouseX/BUTTON_WIDTH < 1)
    {
      userText = "";
      getText();
    } else if (mouseX/BUTTON_WIDTH < 2)
    {
      displayText = userText;
    } else if (mouseX/BUTTON_WIDTH < 3)
    {
      displayText = toUpperCase;
    } else if (mouseX/BUTTON_WIDTH < 4)
    {
      displayText = toLowerCase;
    } else if (mouseX/BUTTON_WIDTH < 5)
    {
      displayText = toInvertedCase;
    } else if (mouseX/BUTTON_WIDTH < 6)
    {
      displayText = toCamelCase;
    } else if (mouseX/BUTTON_WIDTH < 7)
    {
      displayText = toConstantCase;
    } else if (mouseX/BUTTON_WIDTH < 8)
    {
      displayText = toBackwardsCase;
    }
  }
  //This changes the colour to the color selected by clicking the mouse
  checkColour();
}


void drawColorPalette()
{
  colorMode(HSB);//Changes the color mode to HSB

  for (int i=0; i<NUMBER_OF_HUES; i++)
  {
    //This first FOR loop is used to draw the (20)hue swatches across the canvas horizontally

    /*jMinimum and jRange are used in calculating the source percent when scaling
     where jMinimum is the minimum y-coordinate of the saturation swatches
     and jRange is the maximum-minimum y-coordinate of the saturation swatches
     */
    int jMinimum = CANVAS_HEIGHT-SWATCH_HEIGHT;
    int jRange = SWATCH_HEIGHT;

    for (int j=jMinimum; j<CANVAS_HEIGHT; j+=SUB_SWATCH_HEIGHT)
    {
      //This nested FOR loop is used to draw the (4)saturation swatches inside each hue swatch

      //Variables for holding the resulting hue and saturation values
      int hueValue = i*255/20;//Sacles the hue in 20 swatches
      int saturationValue = 50 + (j-jMinimum)*205/jRange;// Scales the Saturation in 4 swatches

      noStroke();// removes the outlines

      //setting the colour based on the scaling of the hue and saturation
      fill(hueValue, saturationValue, COLOR_BRIGHTNESS);

      if ((mousePressed) && (mouseX/SWATCH_WIDTH == i && mouseY/SUB_SWATCH_HEIGHT == j/SUB_SWATCH_HEIGHT))
      {
        //This gives a white outline to the rectangle representing the color 
        //selected by the mouse click
        stroke(255);
        strokeWeight(2);
      }
      //Draws both the hue and saturation swatches based on 'i' and 'j'
      rect(i*SWATCH_WIDTH, j, SWATCH_WIDTH, SUB_SWATCH_HEIGHT);
    }
  }
}
void checkColour()
{
  //This function checks which color was selected by the mouse click and changes the global
  //variable for the text color
  colorMode(HSB);

  /*!!! Just like in drawColorPalette() above
   jMinimum and jRange are used in calculating the source percent when scaling
   where jMinimum is the minimum y-coordinate of the saturation swatches
   and jRange is the maximum-minimum y-coordinate of the saturation swatches
   */
  int jRange = SWATCH_HEIGHT;
  int jMinimum = CANVAS_HEIGHT-SWATCH_HEIGHT;
  for (int i=0; i<NUMBER_OF_HUES; i++)
  {
    //This FOR loop checks the hue selected as relates to the mouseX position
    //using integer division 
    for (int j=jMinimum; j<CANVAS_HEIGHT; j+=SUB_SWATCH_HEIGHT)
    {
      //This FOR loop checks the Saturation selected as relates to the mouseY position
      //using integer division 
      if (mouseX/SWATCH_WIDTH == i && mouseY/SUB_SWATCH_HEIGHT == j/SUB_SWATCH_HEIGHT)
      {
        int selectedHue = i*255/20;// Scales the hue
        int selectedSaturation = 50 + (j-jMinimum)*205/jRange;//Scales the Saturation

        //Replaces the global color variable for the displayed text to the selected hue and saturation
        textColor = color(selectedHue, selectedSaturation, COLOR_BRIGHTNESS);
      }
    }
  }
}

void draw()
{
  background(255);// Clears the Screen and sets it to white each frame
  drawButton();
  drawButtonLabel();
  drawText();
  drawColorPalette();
}
