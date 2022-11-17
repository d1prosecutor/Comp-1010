/** //<>//
 * Template - Gold exercise
 * Fall Lab 10 - COMP 1010
 * 
 * Simplified Yahtzee game - phase 3
 * Use the first half of the score sheet. Allow the player
 * to play 6 turns and score the numbers 1-6. Handle the
 * bonus and total score.
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

//Put your Bronze code here

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

//Put your Silver code here

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
  return score;
}//scoreAs

//-------- Gold -------------------------------------

int EMPTY = -1;              //Special code for a blank unused row
int BONUS_THRESHOLD = (NUM_SIDES)*(NUM_SIDES+1)*3/2; //This is 3 of each number from 1 to NUM_SIDES
int BONUS_VALUE = 35;        //The bonus for getting the above value

int[] scoreSheet;  //The variable that should hold a score sheet array

void resetScoreSheet() 
{
  scoreSheet = new int[8];
  for (int i=0; i<scoreSheet.length-2; i++)
  {
    scoreSheet[i] = EMPTY;
  }
  for (int j=6; j<scoreSheet.length; j++)
  {
    scoreSheet[j] = 0;
  }
}

boolean enterScore(int row, int score) 
{
  boolean emptyRowSelected = false;

  if (scoreSheet[row] == EMPTY)
  {
    emptyRowSelected = true;
    scoreSheet[row] = score;
    scoreSheet[7] += score;
    if (scoreSheet[6]== 0 && scoreSheet[7] >= BONUS_THRESHOLD)
    {
      scoreSheet[6] = BONUS_VALUE;
      scoreSheet[7] += BONUS_VALUE;
    }
  } else
  {
    emptyRowSelected = false;
  }
  return emptyRowSelected;
}//enterScore

//==================================================================
//
//    SUPPLIED CODE - DO NOT EDIT ANYTHING BELOW THIS LINE

int rerollsMade = 0;        //Keep track of the number of rerolls done
boolean turnOver = true;    //True means a new turn will star on the next click
boolean scoringPhase = false; //True means the next click will choose where to score the roll
boolean gameOver = false;   //True when all turns have been played and the game is over
int turnsPlayed = 0;        //The number of turns that have been completed.

final int BG_COLOR = 192;   //Light grey background colour.

final String REROLL_MESSAGE = "Click all the dice you want to reroll.\nThen click anywhere else to roll.";
final String ROLL_MESSAGE = "Click to roll a new set of dice.";

//This variable keeps track of which dice are to be rerolled.
//This will also control whether dice are red or grey.
boolean[] diceToRoll = new boolean[NUM_DICE];

final int WIDTH = 500, HEIGHT = 600; //MUST MATCH THE size() COMMAND BELOW

//--------------------------------------------------------------

void setup() {
  size(500, 600);
  displayMessage(ROLL_MESSAGE);
  resetScoreSheet();
  drawScoreSheet(scoreSheet);
}//setup

//--------------------------------------------------------------

void draw() {
}//draw

//--------------------------------------------------------------

void mouseClicked() {
  /* This is really the main function that controls the entire flow
   of the game, since everything happens as a result of a mouse
   click.
   */
  if (gameOver) return; //Just ignore everything after the game is over.

  if (turnOver)    //If the previous turn was over,
    if (scoringPhase) { //If it has not been scored yet, score it.
      int rowChosen = checkScoreClick();
      if (rowChosen>=0) { //if it's a click on scoring cell at all
        //try to score it
        boolean valid = enterScore(rowChosen, scoreAs(rowChosen+1));
        if (valid) { 
          drawScoreSheet(scoreSheet); //It worked. Draw the new score sheet
          scoringPhase = false;       //We're not scoring any more.
          turnsPlayed++;              //That's one more turn completed
          if (turnsPlayed == NUM_SIDES) {  //If it was the last turn.
            gameOver = true;            //Game over
            displayMessage("Game Over. Thanks for playing.");
          } else //It wasn't the last turn. Ask to roll fresh dice.
          displayMessage(ROLL_MESSAGE);
        }//if scoresheet cell was empty
      }//if scoresheet cell chosen
    }//if in the socring phase
    else
      startTurn(); //Else start a new turn
  else { //We're in the middle of a turn, doing rerolls
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
  drawScoreSheet(scoreSheet);
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
  drawScoreSheet(scoreSheet);
  rerollsMade++;
  if (rerollsMade < NUM_REROLLS)
    displayMessage("You have "+(NUM_REROLLS-rerollsMade)+" rerolls left.\n"+REROLL_MESSAGE);
  else {
    turnOver = true;
    scoreTheTurn();
  }
}//doReroll

//--------------------------------------------------------------

void scoreTheTurn() {
  displayMessage("Click on an empty score box to score that number.");
  scoringPhase = true; //Just set the flag and wait for mouse clicks.
}//scoreTheTurn

//--------------------------------------------------------------

int checkForDieClick() {
  //Check all of the dice to see if any were clicked on.
  //Retrun the die number if so, else return -1.
  for (int die=0; die<NUM_DICE; die++)
    if (clickInDie(die))
      return die;
  return -1;
}

//--------------------------------------------------------------
//  Constants that control the way the dice, scoresheet, and
//  message area are displayed graphically.

//Message box at the bottom
final int MESSAGE_HEIGHT = 100;    //Bottom 50 pixels of the window
final int MESSAGE_BG = #F0D798;   //A light orange background

//Dice
final float X_SPACING = (float)WIDTH/NUM_DICE;       //X spacing of the dice
final float DIE_SIZE = X_SPACING*0.8;    //width and height of one die
final float X_LEFT_DIE = X_SPACING*0.1;  //left side of the leftmost die
final float Y_OFFSET = X_SPACING*0.15;   //slight Y offset of the odd-numbered ones
final float Y_POSITION = HEIGHT-DIE_SIZE-Y_OFFSET-MESSAGE_HEIGHT; //Y coordinate of most dice
final float PIP_OFFSET = DIE_SIZE/3.5;  //Distance from centre to pips, and between pips
final float PIP_DIAM = DIE_SIZE/5;    //Diameter of the pips (dots)

//Scoresheet
final int SS_MARGIN = 10; //Top and bottom margins
final int SS_HEIGHT = (int)(HEIGHT-MESSAGE_HEIGHT-X_SPACING-SS_MARGIN*4); //Space left after dice and messages
final int SS_WIDTH = (int)(WIDTH*0.45);   //Use about 45% of the width available
final int SS_LEFT = (WIDTH-SS_WIDTH)/2;   //and centre it
final int SS_TOP = SS_MARGIN;       //Starts one margin away from the top of the window
final int SS_ROWS = NUM_SIDES+2;     //Number of rows will be 2 more that the sides (6)
final int SS_BACKGROUND = #F2DCAB;  //Light yellow-orange background
final String[] TITLES = {"1's", "2's", "3's", "4's", "5's", "6's", "Bonus", "Total"};

//--------------------------------------------------------------

void displayMessage(String message) {
  //Display the given message in the centre of the message area.
  //Draw the coloured box to erase any old message
  fill(MESSAGE_BG);
  rect(0, height-MESSAGE_HEIGHT, width, MESSAGE_HEIGHT);
  //Set the text size, and colour.
  final int TEXT_SIZE = 18;
  textSize(TEXT_SIZE);
  fill(0);
  //Allow for multi-line messages. Count the \n characters to see.
  int numLines = 1; //One by default
  for (int i=0; i<message.length(); i++)
    if (message.charAt(i) == '\n')
      numLines++; //Add one more line for every \n character found
  text(message, (width-textWidth(message))/2, 
    (height-MESSAGE_HEIGHT/2)-TEXT_SIZE*numLines/2);
}
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

int checkScoreClick() {
  //Check for a click in a valid scoring box. Return the number of the box
  //if a blank box is clicked, or -1 if the click is not in a valid box at all.
  for (int r=0; r<NUM_SIDES; r++) {
    //Determine where the rectangle for that score entry is
    float colWidth = (SS_WIDTH-2*SS_MARGIN)/2;
    float rowHeight = (SS_HEIGHT-2*SS_MARGIN)/SS_ROWS;
    float left = SS_LEFT+SS_MARGIN+colWidth;
    float top = SS_TOP+SS_MARGIN+r*rowHeight;
    //Check for a click in that rectangle
    if (clickIn(left, top, colWidth, rowHeight))
      return r;
  }//for each row in the score sheet
  return -1; //Nothing valid was clicked
}

//--------------------------------------------------------------

boolean clickIn(float left, float top, float wide, float high) {
  /* Determine whether or not the values of mouseX and mouseY
   mean that the cursor is inside the rectangle with the
   given position and size.
   */
  return mouseX>=left && mouseX<=left+wide &&
    mouseY>=top && mouseY<=top+high;
}

//--------------------------------------------------------------

void drawDie(int position, int value) {
  /* Draw one die in thecanvas.
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

//--------------------------------------------------------------

void drawScoreSheet(int[] score) {
  /* Draw a "Yahtzee" score sheet (or half of one, anyway)
   containing the given scores.
   */

  //Draw the overall rectangle, and calculate the size of the small boxes.
  fill(SS_BACKGROUND);
  stroke(SS_BACKGROUND);
  rect(SS_LEFT, SS_TOP, SS_WIDTH, SS_HEIGHT);
  stroke(0); //Inset black rectangles
  float colWidth = (SS_WIDTH-2*SS_MARGIN)/2;         //There are 2 columns
  float rowHeight = (SS_HEIGHT-2*SS_MARGIN)/SS_ROWS;

  //Draw all of the rows and columns of the sheet
  for (int r=0; r<SS_ROWS; r++)
    for (int col=0; col<2; col++) { //Always 2 columns - titles and scores
      //Determine what should be drawn in this position
      String contents;
      if (col==0)
        contents = TITLES[r];
      else if (score[r]==EMPTY)
        contents = " ";
      else
        contents = str(score[r]);
      //Draw the contents of this small rectangular area
      boxedText(contents, SS_BACKGROUND, 
        SS_LEFT+SS_MARGIN+col*colWidth, 
        SS_TOP+SS_MARGIN+r*rowHeight, 
        colWidth, rowHeight);
    }//nested for
}//drawScoreSheet

//--------------------------------------------------------------

void boxedText(String textToDraw, int colour, 
  float left, float top, float wide, float high) {
  /* Draw the given text, against a background of the supplied
   colour, in the given rectangular area. The text should be
   exactly centred, and with a text size that is
   TEXT_SIZE_FACTOR of the height of the rectangle.
   There will be black text and a black outline to the box.
   */
  final float TEXT_SIZE_FACTOR = 0.60;

  fill(colour);
  stroke(0); //Black outline
  rect(left, top, wide, high);
  fill(0); //Black text
  float textHeight = high*TEXT_SIZE_FACTOR;
  textSize(textHeight);
  float textLeft = left+(wide/2)-textWidth(textToDraw)/2;
  float textBase = top+high/2+textHeight/2;
  text(textToDraw, textLeft, textBase);
}
