/*
* COMP 1010 SECTION [A02]
 * INSTRUCTOR: Ali Neshati
 * NAME: Chukwunaza Chukwuocha
 * ASSIGNMENT: 5
 * QUESTION: 5
 *
 * To create a simplified minesweeper game, where the computer will randomly 
 place mines, and the user will make guesses.  The game will end 
 when the user guesses all cells not occupied by a mine (the player wins),
 or the user guesses a cell occupied by a mine (the player loses).  
 the user is also ability to play another game, without restartng the program.
 */

//CONSTANTS FOR THE SIZE OF A CELL AND NUMBER OF ROWS && COLUMNS
final int CELLSIZE = 50;
final int NUM_ROWS = 10;
final int NUM_COLS = 12;

//Variable for half the size of one cell in the grid
int halfCellSize = CELLSIZE/2;

int numMines = 30;// Starting number of mines
int maxNumMines = 70;// Max number of mines there could be in the game

//PFA's for the mines && their counter
int[] mineRowNum = new int[maxNumMines];
int[] mineColNum = new int[maxNumMines];

int mineCounter = 0;

// Number of max guesses possible
int numMaxGuesses = (NUM_ROWS*NUM_COLS)-numMines;

//PFA's for the guesses && their counter
int[] guessColNum = new int[numMaxGuesses];
int[] guessRowNum = new int[numMaxGuesses];
int[] guessValue = new int[numMaxGuesses];

int guessCounter;

// Varaibles that determine the state of the game at each time
boolean gameOver = false;
boolean gameLost = false;
boolean gameWon = false;
boolean guessIsInvalid = false;

//Variable that stores the store of the player
int playerScore = 0;

//String to be displayed at the end of the game(whether lost or won)
String playAgain = "To Play again press N";


/*
 sets the canvas and generates a random set of mines 
 at the start of the game
 */
void setup()
{
  size(600, 500); //size MUST be (NUM_COLS*CELLSIZE) by (NUM_ROWS*CELLSIZE);
  generateMines(mineColNum, mineRowNum, numMines);
}

/* 
 draws the grid, mines, and guesses(numbers) if the game is not over
 displays all the mines, prints the 'lose' string and 
 ends the game if a mine is clicked
 diplays all the mines if the game is won and prints the 'won' string
 */
void draw() 
{
  if (!gameOver)
  {
    drawGrid();
    drawNums(guessColNum, guessRowNum, guessValue, guessCounter);
  } else if (gameLost)
  {
    drawMines(mineColNum, mineRowNum, numMines);

    fill(0);
    textSize(22);
    float textHeight = textAscent()+textDescent();

    String gameOver = "GAME OVER! YOU LOST WITH A SCORE OF "+playerScore+" :(";
    text(gameOver, (width-textWidth(gameOver))/2, height/2);
    text(playAgain, (width-textWidth(playAgain))/2, (height/2)+textHeight);
  } else if (gameWon)
  {
    drawMines(mineColNum, mineRowNum, numMines);
    drawNums(guessColNum, guessRowNum, guessValue, guessCounter);

    fill(0);
    textSize(22);
    float textHeight = textAscent()+textDescent();

    String gameWon = "CONGRATS! YOU WON WITH A SCORE OF "+playerScore+" :)";
    text(gameWon, (width-textWidth(gameWon))/2, height/2);
    text(playAgain, (width-textWidth(playAgain))/2, (height/2)+textHeight);
  }
}

/*
 Clears the bacground to grey
 Draws the grid on the canvas with cells of size 'CELLSIZE'
 */
void drawGrid()
{
  background(200);
  for (int i=0; i<NUM_ROWS; i++)
  {
    for (int j=0; j<NUM_COLS; j++)
    {
      stroke(0);
      noFill();
      rect(j*CELLSIZE, i*CELLSIZE, CELLSIZE, CELLSIZE);
    }
  }
}

/*
 Takes in row and column Arrays, counter for the arrays,
 row and column numbers and checks if the row and column
 numbers are found in the row and column arrays respectively
 returns true if it is found
 */
boolean search(int[] x, int[] y, int n, int col, int row)
{
  boolean filled = false;
  for (int i=0; i<n; i++)
  {
    if (col == x[i] && row == y[i])
    {
      filled = true;
    }
  }
  return filled;
}

/*
 Takes in row and column Arrays for mines,
 counter for the arrays, row and column numbers 
 and inserts the row and column numbers inside the
 row and column arrays untill the arrays are filled up.
 
 Increases the counter for the arrays each time an element
 is added and returns the counter
 */
int insert(int[] x, int[] y, int n, int col, int row)
{ 
  if (n < numMines) 
  {
    x[n] = col;
    y[n] = row;
    n++;
  }
  return n;
}

/*
 Takes in row and column arrays and generates 'numMines'
 random mines without generating duplicate mines(using search function). 
 */
void generateMines(int[] colNum, int[] rowNum, int numMines)
{
  int i=0;

  while (i<numMines)
  {
    int prevCol = (int)random(NUM_COLS);
    int prevRow = (int)random(NUM_ROWS);

    boolean filled =  search(colNum, rowNum, numMines, prevCol, prevRow);

    if (!filled)
    { 
      mineCounter = insert(colNum, rowNum, mineCounter, prevCol, prevRow);
      i++;
    }
  }
}

/*
 Takes in a row and column number and draws a mine 
 at that location on the grid
 */
void drawMine(int col, int row)
{
  fill(255);
  stroke(0);
  rect(col*CELLSIZE, row*CELLSIZE, CELLSIZE, CELLSIZE);

  noStroke();
  fill(60, 0, 255);
  circle(col*CELLSIZE+(halfCellSize), row*CELLSIZE+(halfCellSize), CELLSIZE);


  fill(255, 0, 0);
  triangle(col*CELLSIZE+(halfCellSize), row*CELLSIZE, col*CELLSIZE, row*CELLSIZE+(halfCellSize), 
    col*CELLSIZE+(halfCellSize), row*CELLSIZE+(halfCellSize));


  triangle(col*CELLSIZE+(halfCellSize), row*CELLSIZE+(halfCellSize), col*CELLSIZE+(halfCellSize), 
    row*CELLSIZE+CELLSIZE, col*CELLSIZE+CELLSIZE, row*CELLSIZE+(halfCellSize));
}

/*
 Takes in row and column arrays and number of Mines to be drawn
 and draws all the mines using the drawMine Function
 */
void drawMines(int[] colNums, int[] rowNums, int numEntries)
{
  for (int i=0; i<numEntries; i++)
  {
    drawMine(colNums[i], rowNums[i]);
  }
}

/*
 Takes in a row and column number, the number to
 be displayed and displays the number at that
 location on the grid
 */
void drawNum(int col, int row, int value)
{
  textSize(30);
  float textHeight = textAscent()+textDescent();

  fill(255);
  stroke(0);
  rect(col*CELLSIZE, row*CELLSIZE, CELLSIZE, CELLSIZE);

  fill(0, 0, 255);

  text(value, col*CELLSIZE+halfCellSize-textWidth(char(value))/2, 
    row*CELLSIZE+textHeight);
}


/*
 Takes in row and column arrays, numbers to
 be displayed (and how many numbers should be diplayed)
 and displays all the numbers at their respective rowa and
 locations on the grid
 */

void drawNums(int[] colNum, int[] rowNum, int[] values, int numEntries)
{
  for (int i=0; i<numEntries; i++)
  {
    drawNum(colNum[i], rowNum[i], values[i]);
  }
}

/*
 Converts the location of the mouse to row and column
 numbers using two helper functions(when the mouse is clicked)
 Checks if the click happened on a mine or not and
 sets GameLost(and gameOver) to true if it happens
 Also checks if the guess made by the user had previously 
 been made and displays the guess if it had not
 
 Increases the player Score with the amount of guesses - 
 (regardless of whether it had been previously guessed, and
 so long as the game is not over)
 */
void mouseClicked()
{
  if (!gameOver)
  {
    int mouseColNum = mouseXToColumn(mouseX);
    int mouseRowNum = mouseYToRow(mouseY);

    boolean playerClick = search(mineColNum, mineRowNum, mineCounter, 
      mouseColNum, mouseRowNum);

    gameLost = search(mineColNum, mineRowNum, mineCounter, 
      mouseColNum, mouseRowNum);

    guessIsInvalid = search(guessColNum, guessRowNum, guessCounter, 
      mouseColNum, mouseRowNum);

    if (!guessIsInvalid)
    {
      guessCounter = insertGuess(guessColNum, guessRowNum, 
        guessCounter, mouseColNum, mouseRowNum);
    }

    if (!playerClick)
    {
      playerScore++;
    }
  }

  gameWon = (guessCounter == numMaxGuesses);

  gameOver = gameWon || gameLost;
}

/*
  Takes in row and column Arrays for guesses,
 counter for the arrays, row and column numbers 
 and inserts the row and column numbers inside the
 row and column arrays untill the arrays are filled up.
 
 Also counts how many mines are adjacent any guess.
 Returns each guess number to be displayed on the grid.
 */
int insertGuess(int[] guessCol, int[] guessRow, int guessNum, int col, int row)
{ 
  int nearbyMineNum = 0;

  if (guessNum < numMaxGuesses) 
  {
    guessCol[guessNum] = col;
    guessRow[guessNum] = row;

    for (int i=-1; i<=1; i++)
    {
      for (int j=-1; j<=1; j++)
      {
        boolean nearbyMines = search(mineColNum, mineRowNum, mineCounter, col+i, row+j);
        if (nearbyMines)
          nearbyMineNum++;
      }
    }
    guessValue[guessNum] = nearbyMineNum;
    guessNum++;
  }
  return guessNum;
}

/*
 Takes in the postion of mouseX and converts
 it to a column number
 Returns the column number.
 */
int mouseXToColumn(int xMouse)
{
  xMouse = mouseX/CELLSIZE;

  return xMouse;
}

/*
 Takes in the postion of mouseY and converts
 it to a row number
 Returns the row number.
 */
int mouseYToRow(int yMouse)
{
  yMouse = mouseY/CELLSIZE;

  return yMouse;
}

/*
 Resets the game when 'n' or 'N' is clicked
 clears the guesses, generates a new set of mines,
 Resets the player score amd increases the number of
 mines by 5 each time
 */
void keyPressed()
{
  if (gameOver && (key == 'n'|| key =='N'))
  {
    gameOver = false;
    playerScore = 0;

    drawGrid();

    numMines += 5;
    numMines = min(numMines, maxNumMines);

    mineCounter = 0;

    mineRowNum = new int[maxNumMines];
    mineColNum = new int[maxNumMines];
    generateMines(mineColNum, mineRowNum, numMines);

    guessCounter = 0;

    guessColNum = new int[numMaxGuesses];
    guessRowNum = new int[numMaxGuesses];
    guessValue = new int[numMaxGuesses];
  }
}
