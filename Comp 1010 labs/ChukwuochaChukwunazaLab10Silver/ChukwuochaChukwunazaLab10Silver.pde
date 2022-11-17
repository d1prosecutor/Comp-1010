/**
 * Chukwunaza Chukwuocha
 * Fall Lab 10 - COMP 1010
 * Silver exercise
 
 * Simplified Yahtzee game - phase 2
 * Allow the user to select and reroll some of the dice,
 * several times (set by NUM_REROLLS), then show what
 * the score would be for each number from 1 to NUM_SIDES.
 * 
 */

//Constants controlling the game.
//The number of sides should not be changed since the
//graphics only handles from 1-6 dots.
//In this version, the number of dice or turns could be varied.
final int NUM_SIDES=6;   //Sides on the dice
final int NUM_DICE=5;    //The number of dice used
final int NUM_REROLLS=2; //Number of rerolls after the initial roll

//-------- Bronze -------------------------------------

//Insert all of your Bronze code here

//***Add the variable storing the dice here:
int[] numDice = new int[NUM_DICE];

void rollDice() {
  for (int i=0; i<NUM_DICE; i++)
  {
    numDice[i] = (int)random(1, NUM_SIDES+1);
  }
}//rollDice

void showDiceRoll() {
  for (int i=0; i<NUM_DICE; i++)
  {
    drawDie(i, numDice[i]);
  }
}//showDiceRoll

//-------- Silver -------------------------------------

void reroll(boolean[] diceToRoll) {
  //diceToRoll = new boolean[NUM_DICE];

  for (int i=0; i<NUM_DICE; i++)
  {
    if (diceToRoll[i])
    {
      numDice[i] = (int)random(1, NUM_SIDES+1);
    }
  }
}//reroll

int scoreAs(int chosenNumber) {
  int score = 0;
  for (int i=0; i<NUM_DICE; i++)
  {
    if (chosenNumber == numDice[i])
    {
      score += chosenNumber;
    }
  }
  println(score);
  return score;
}//scoreAs



//==================================================================
//
//    SUPPLIED CODE - DO NOT EDIT ANYTHING BELOW THIS LINE

int rerollsMade = 0;        //Keep track of the number of rerolls done
boolean turnOver = true;    //True means a new turn will star on the next click 

final int BG_COLOR = 192;   //Light grey background colour.

final String REROLL_MESSAGE = "Click all the dice you want to reroll.\nThen click anywhere else to roll.";
final String ROLL_MESSAGE = "Click to roll a new set of dice.";

//This variable keeps track of which dice are to be rerolled.
//This will also control whether dice are red or grey.
boolean[] diceToRoll = new boolean[NUM_DICE];

final int WIDTH = 500, HEIGHT = 500; //MUST MATCH THE size() COMMAND BELOW

//--------------------------------------------------------------

void setup() {
  size(500, 500);
  displayMessage(ROLL_MESSAGE);
}//setup

//--------------------------------------------------------------

void draw() {
}//draw

//--------------------------------------------------------------

void mouseClicked() {
  if (turnOver)    //If the previous turn was over,
    startTurn(); //Start a new one
  else {
    int clickedDie = checkForDieClick(); //See which die was clicked, if any
    if (clickedDie>=0) {
      //When a die is clicked, just change its status and redraw the dice.
      diceToRoll[clickedDie] = !diceToRoll[clickedDie];
      showDiceRoll();
    } else
      doReroll(); //A click anywhere else means reroll the selected dice
  }
}//mouseClicked

//--------------------------------------------------------------

void startTurn() {
  //Start a new turn with a fresh roll of the dice.
  rollDice();           //Roll the dice, and start a new turn
  background(BG_COLOR); //Erase the canvas
  showDiceRoll();       //Draw the dice
  turnOver = false;     //Indicate that the turn has started
  displayMessage("You have "+NUM_REROLLS+" rerolls.\n"+REROLL_MESSAGE);
  rerollsMade = 0;
}

//--------------------------------------------------------------

void doReroll() {
  //Reroll the dice that are selected (grey) and update the dice and message.
  background(BG_COLOR);
  reroll(diceToRoll);
  for (int i=0; i<NUM_DICE; i++) //Reset all dice back to..
    diceToRoll[i]=false;        //..unselected or red.
  showDiceRoll();
  rerollsMade++;
  if (rerollsMade < NUM_REROLLS)
    displayMessage("You have "+(NUM_REROLLS-rerollsMade)+" rerolls left.\n"+REROLL_MESSAGE);
  else {
    turnOver = true;
    displayMessage(generateScoreMessage()+"\n"+ROLL_MESSAGE);
  }
}

//--------------------------------------------------------------

int checkForDieClick() {
  //Check all of the dice to see if any were clicked on.
  //Return the die number if so, else return -1.
  for (int die=0; die<NUM_DICE; die++)
    if (clickInDie(die))
      return die;
  return -1;
}

//--------------------------------------------------------------

void displayMessage(String message) {
  //Display the given message in the centre of the window.
  final int TEXT_SIZE = 20;
  textSize(TEXT_SIZE);
  fill(0);
  //Allow for multi-line messages. Count the \n characters to see.
  int numLines = 1; //One by default
  for (int i=0; i<message.length(); i++)
    if (message.charAt(i) == '\n')
      numLines++; //Add one more line for every \n character found
  text(message, (width-textWidth(message))/2, 
    height/2-TEXT_SIZE*numLines/2);
}

//--------------------------------------------------------------

String generateScoreMessage() {
  //Generate a message showing what the score would be if the
  //roll were scored using each number from 1 to NUM_SIDES
  String message = "Turn Over.\nScores under 1-"+NUM_SIDES+" would be:\n";
  for (int i=1; i<=NUM_SIDES; i++)
    message += i+"'s="+scoreAs(i)+"  ";
  return message;
}

//--------------------------------------------------------------
//  Constants that control the way the dice are displayed graphically

final float X_SPACING = (float)WIDTH/NUM_DICE;       //X spacing of the dice
final float DIE_SIZE = X_SPACING*0.8;    //width and height of one die
final float X_LEFT_DIE = X_SPACING*0.1;  //left side of the leftmost die
final float Y_OFFSET = X_SPACING*0.15;   //slight Y offset of the odd-numbered ones
final float Y_POSITION = HEIGHT-DIE_SIZE-Y_OFFSET; //Y coordinate of most dice
final float PIP_OFFSET = DIE_SIZE/3.5;  //Distance from centre to pips, and between pips
final float PIP_DIAM = DIE_SIZE/5;    //Diameter of the pips (dots)

//--------------------------------------------------------------

boolean clickInDie(int dieNumber) {
  //Check to see if the indicated die was clicked on.
  //This function requires some of the constants above.
  float dieX = X_LEFT_DIE+dieNumber*X_SPACING;
  float dieY = Y_POSITION-Y_OFFSET*(dieNumber%2);
  return mouseX>=dieX && mouseX<=dieX+DIE_SIZE &&
    mouseY>=dieY && mouseY<=dieY+DIE_SIZE;
}

//--------------------------------------------------------------

void drawDie(int position, int value) {
  /* Draw one die in the canvas.
   * **This will only work for dice with up to 6 sides.**
   *   position - must be 0..NUM_DICE-1, indicating which die is being drawn
   *   value - must be 1..6, the amount showing on that die
   */

  //From the constants above, and which die it is, find its top left corner
  float dieX = X_LEFT_DIE+position*X_SPACING;
  float dieY = Y_POSITION-Y_OFFSET*(position%2);

  //1.Draw either red or medium grey square with a black outline
  stroke(0); //Black outline
  if (diceToRoll[position])
    fill(128); //Grey fill for dice to reroll
  else
    fill(255, 0, 0); //Red fill for dice to keep
  rect(dieX, dieY, DIE_SIZE, DIE_SIZE);

  //2.Draw the pips (dots)
  fill(255);   //White dots
  stroke(255); //White outline

  //The centre dot (if the value is odd)
  if (1 == value%2)
    ellipse(dieX+DIE_SIZE/2, dieY+DIE_SIZE/2, PIP_DIAM, PIP_DIAM);

  //The top-left and bottom-right dots (if the value is more than 1)
  if (value>1) {
    ellipse(dieX+DIE_SIZE/2-PIP_OFFSET, 
      dieY+DIE_SIZE/2+PIP_OFFSET, PIP_DIAM, PIP_DIAM);
    ellipse(dieX+DIE_SIZE/2+PIP_OFFSET, 
      dieY+DIE_SIZE/2-PIP_OFFSET, PIP_DIAM, PIP_DIAM);
  }//if

  //The bottom-left and top-right dots (if the value is more than 3)
  if (value>3) {
    ellipse(dieX+DIE_SIZE/2+PIP_OFFSET, 
      dieY+DIE_SIZE/2+PIP_OFFSET, PIP_DIAM, PIP_DIAM);
    ellipse(dieX+DIE_SIZE/2-PIP_OFFSET, 
      dieY+DIE_SIZE/2-PIP_OFFSET, PIP_DIAM, PIP_DIAM);
  }//if

  //The left and right dots (only if the value is 6)
  if (value==6) {
    ellipse(dieX+DIE_SIZE/2-PIP_OFFSET, 
      dieY+DIE_SIZE/2, PIP_DIAM, PIP_DIAM);
    ellipse(dieX+DIE_SIZE/2+PIP_OFFSET, 
      dieY+DIE_SIZE/2, PIP_DIAM, PIP_DIAM);
  }//if
}//drawDie
