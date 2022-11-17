/*
 * COMP 1010 SECTION [A02]
 * INSTRUCTOR: [Ali Neshati]
 * NAME: [Chukwunaza Chukwuocha]
 * ASSIGNMENT: [Assignment 4]
 * QUESTION: [question 4]
 *
 * PURPOSE: To create a quick Colour Game which is a colouing applicaton 
 and a game in one. The Player can simply colour the grid 
 however they want, or they can try to colour the grid to match the 
 target image shown, trying to do so in as few moves as posswble.
 */

//CONSTANTS FOR THE DIMENSION OF THE CANVAS
final int CANVAS_WIDTH = 800;
final int CANVAS_HEIGHT = 800;

//CONSTANTS FOR THE COLOURS OF THE COLOURING WELLS
final color RED = #D12020;
final color BLUE = #515DD8;
final color GREEN = #21AF20;
final color YELLOW = #F5EF74;
final color ORANGE = #F59219;
final color PURPLE = #B219F5;
final color WHITE = #FFFFFF;

//Variables for the colour well 
int colourWellSize = 50; //size of the square representing the colour well
int colourWellGap = 10; // space between two colour wells
int colourWellLeftX = 50; // the x coordinate of the first colour well(from the left)
int numColourWells = 7; // Number of colour wells
int colourWellSelected = -1; // variable representing the colour well clicked by the user

//Variables for the grid
int numGridRows = 12; // Number of rows in the grid
int numGridColumns = 8; // Number of Columns in the grid
int colourGridStartX = 120; // x coordinate for the first cell in the grid
int colourGridStartY = 120; // y coordinate for the first cell in the grid
int selectedCell = -1; // variable representing the cell int the grid clicked by the user
int gridCellSize = 30; // size of each cell in the grid
boolean isCellSelected = false; // checks if a cell in the grid was selected by the player

//Variables for the row selectors
int numRowCircles = 12; // Number of row selectors
int rowSelectorX = 100; // x coordinate of the first row selector circle
int rowSelectorY = 135; // y coordinate of the first row selector circle
int rowCircleSize = 20; // size of the row selectors
int rowCircleSpacing = 30; // The space between two row selectors
int selectedRow = -1; // variable representing the colour well clicked by the user
boolean isRowSelected = false; // checks if a row in the grid was selected by the player

//Variable that indicates the y coordinate on the canvas 
//of the "Top side" of the first row selector circle
int rowSelectorTopY = rowSelectorY-rowCircleSize/2; 


//Variables for the Column selectors
int numColumnCircles = 8; // number of column selectors
int columnSelectorX = 135; // x coordinate of the first column selector circle
int columnSelectorY = 100; // y coordinate of the first column selector circle
int columnCircleSize = 20; // size of the colmn selectors
int columnCircleSpacing = 30; // space between two column selectors
int selectedColumn = -1; //variable representing the column selector clicked by the user
boolean isColumnSelected = false; // checks if a column in the grid was selected by the player

//Variable that indicates the x coordinate on the canvas 
//of the "Left side" of the first row selector circle
int columnSelectorLeftY = columnSelectorX-columnCircleSize/2;

//Variable that stores the number of moves done by the player
int numMoves = 0;

//Variable that Displays a random target image(from 5 stored images)
//each time the code is run
String targetImage = "target" +int(random(5))+".png"; // create filename

void setup()
{
  size(800, 600);
  background(0);
}

/*
 This draws the colour wells(squares) from the top of canvas
 filling the appropriate colours
 and using the colourWellLeftX as starting point.
 !!! The literals here represent the index of each Colour Well 
 !!! which helps in the calculation of the x coordinates
 */
void drawColourWells()
{
  stroke(WHITE);

  //distance from the starting point of one colour well to the next
  int colourWellSpacing = colourWellLeftX + colourWellGap; 

  fill(RED);
  rect(colourWellLeftX, 0, colourWellSize, colourWellSize);

  fill(BLUE);
  rect(colourWellLeftX+colourWellSpacing, 0, colourWellSize, colourWellSize);

  fill(GREEN);
  rect(colourWellLeftX+(2*colourWellSpacing), 0, colourWellSize, colourWellSize);

  fill(YELLOW);
  rect(colourWellLeftX+(3*colourWellSpacing), 0, colourWellSize, colourWellSize);

  fill(ORANGE);
  rect(colourWellLeftX+(4*colourWellSpacing), 0, colourWellSize, colourWellSize);

  fill(PURPLE);
  rect(colourWellLeftX+(5*colourWellSpacing), 0, colourWellSize, colourWellSize);

  fill(WHITE);
  rect(colourWellLeftX+(6*colourWellSpacing), 0, colourWellSize, colourWellSize);
}

/*
 This draws the circles representing the column selectors,
 checks for the user click on a column selector and
 highlights a clicked circle red
 */
void drawColumnSelectors()
{
  for (int i=0; i<numColumnCircles; i++)
  {
    strokeWeight(1);
    stroke(175);
    circle(columnSelectorX + i*columnCircleSpacing, 
      columnSelectorY, columnCircleSize);

    if (isColumnSelected)
    {
      stroke(RED);
      circle(columnSelectorX + selectedColumn*columnCircleSpacing, 
        columnSelectorY, columnCircleSize);
    }
  }
}

/*
 This draws the circles representing the row selectors,
 checks for the user click on a row selector and
 highlights a clicked circle red
 */
void drawRowSelectors()
{
  for (int i=0; i<numRowCircles; i++)
  {
    strokeWeight(1);
    stroke(175);
    circle(rowSelectorX, rowSelectorY + i*rowCircleSpacing, 
      rowCircleSize);

    if (isRowSelected)
    {
      stroke(RED);
      circle(rowSelectorX, rowSelectorY + selectedRow*rowCircleSpacing, 
        rowCircleSize);
    }
  }
}

/*
 This draws the grid (all the individual cells),
 checks for the user click on a particular cell and
 highlights a clicked cell Red
 */
void drawGrid()
{
  int cellRowNumNum = selectedCell / numGridColumns;
  int cellColumnNumNum = selectedCell % numGridColumns;

  for (int i=0; i<numGridColumns; i++)
  {
    for (int j=0; j<numGridRows; j++)
    {
      noFill();
      stroke(175);// for grey outline

      rect(colourGridStartX + i*gridCellSize, 
        colourGridStartY + j*gridCellSize, gridCellSize, gridCellSize);

      if (isCellSelected)
      {
        stroke(RED);
        rect(colourGridStartX + cellColumnNumNum*gridCellSize, 
          colourGridStartY + cellRowNumNum*gridCellSize, gridCellSize, gridCellSize);
      }
    }
  }
}

/*
 Displays a random image(from 5 stored images)at the defined location
 which the user would try to match by filling the grid with colours
 */
void drawTargetImage()
{
  int targetImageX = 400; // x coordinate for the rectangle representing the image
  int targetImageY = 120; // y coordinate for the rectangle representing the image

  PImage target; // create a variable that can point to an off-screen buffer
  String filename = targetImage;
  target = loadImage(filename); // load image file into off-screen buffer
  image(target, targetImageX, targetImageY);
}

/*
 Draws the rectangle that holds the number of moves
 also displays the text which shows the score
 */
void drawScoreLabel()
{
  int labelXLoc = 270; // x coordinate of the label  
  int labelYLoc = 500; // y coordinate of the label
  int labelWidth = 200; // width of the label
  int labelHeight = 40; // height of the label

  fill(WHITE);
  stroke(WHITE);
  rect(labelXLoc, labelYLoc, labelWidth, labelHeight);

  int textLocX = labelXLoc + 30; //x coordinate for the displayed text
  int textLocY = labelYLoc + 30; //y coordinate for the displayed text

  String scoreLabel = "Num moves: "+numMoves;
  fill(0);
  textSize(20);
  text(scoreLabel, textLocX, textLocY);
}

/*
 Checks if the player clicks within the grid on the canvas, 
 checks and highlights the individual cell clicked -
 then unselects the selected cell
 (uses integer division to check each cell row and column number)
 */
int checkCellClicked(int x, int y)
{
  if (x >= colourGridStartX 
    && x <= colourGridStartX + numGridColumns*gridCellSize)
  {
    if (y >= colourGridStartY 
      && y <= colourGridStartY + numGridRows*gridCellSize)
    {
      int cellRowNum = (y - colourGridStartY)/gridCellSize;
      int cellColumnNum = (x - colourGridStartX)/gridCellSize;
      int firstCells = cellRowNum * numGridColumns; // The first cell in each row
      int clickedCell = firstCells + cellColumnNum;

      if (clickedCell == selectedCell)
      {
        selectedCell = -1;
        isCellSelected = false;
      } else 
      {
        // unselects the cell
        selectedCell = clickedCell;
        isCellSelected = true;
      }
    }
  }
  return selectedCell;
}

/*
 Checks if the player clicks on a row selector circle on the canvas 
 and highlights the individual row selector clicked - 
 then unselects the selected row
 (uses integer division to check the row selector clicked)
 */
int checkRowSelectors(int x, int y)
{
  if ((x >= rowSelectorX-rowCircleSize/2)
    && (x <= rowSelectorX+rowCircleSize/2 ))
  {
    if (y >= rowSelectorTopY 
      && y <= rowSelectorTopY + numRowCircles*rowCircleSpacing)
    {
      int rowSelectorClicked = (y -rowSelectorTopY)/rowCircleSpacing;

      if ((y -rowSelectorTopY)%rowCircleSpacing <= rowCircleSize) 
      {
        if (rowSelectorClicked == selectedRow)
        {
          selectedRow = -1;
          isRowSelected = false;
        } else
        {
          // unselects the row
          selectedRow = rowSelectorClicked;
          isRowSelected = true;
        }
      }
    }
  }
  return selectedRow;
}

/*
 Checks if the player clicks on a column selector circle on the canvas 
 and highlights the individual column selector clicked - 
 then unselects the selected column
 (uses integer division to check the column selector clicked)
 */
int checkColumnSelectors(int x, int y)
{
  if ((x >= columnSelectorLeftY) 
    && (x <= columnSelectorLeftY + numColumnCircles*columnCircleSpacing))
  {
    if (y >= columnSelectorY-columnCircleSize/2 
      && y <= columnSelectorY+columnCircleSize/2)
    {
      int columnSelectorClicked = (x -columnSelectorLeftY)/columnCircleSpacing;

      if ((x -columnSelectorLeftY)%columnCircleSpacing <= columnCircleSize)
      {
        if (columnSelectorClicked == selectedColumn)
        {
          // unselects the column
          selectedColumn = -1; 
          isColumnSelected = false;
        } else
        {
          selectedColumn = columnSelectorClicked;
          isColumnSelected = true;
        }
      }
    }
  }
  return selectedColumn;
}


/*
 Checks if a cell, row, column or a combination of any was clicked,
 checks if a colourWell is selected, 
 and fills the colour from the colour well selected in the selcted cell, row, column 
 (using applyColourCell, applyColourRow and applyColourColumn functions).
 * If a fill function is applied, it increases the score(numMoves) by 1.
 */
void checkColourSelection(int x, int y)
{
  int colourWellGap = 10;
  if (y <= colourWellSize)
  {
    if (x >= colourWellLeftX 
      && x <= colourWellLeftX +  numColourWells*(colourWellSize+colourWellGap))
    {
      if ((x-colourWellLeftX)%(colourWellSize+colourWellGap) <= colourWellSize) {
        colourWellSelected = (x-colourWellLeftX)/(colourWellSize+colourWellGap);

        if (isCellSelected || isRowSelected || isColumnSelected)
        {
          numMoves++;
        } 

        if (colourWellSelected == 0)
        {
          fill(RED);
          applyColourCell(selectedCell, RED);
          applyColourRow(selectedRow, RED);
          applyColourColumn(selectedColumn, RED);
        } else if (colourWellSelected == 1)
        {
          fill(BLUE);
          applyColourCell(selectedCell, BLUE);
          applyColourRow(selectedRow, BLUE);
          applyColourColumn(selectedColumn, BLUE);
        } else if (colourWellSelected == 2)
        {
          fill(GREEN);
          applyColourCell(selectedCell, GREEN);
          applyColourRow(selectedRow, GREEN);
          applyColourColumn(selectedColumn, GREEN);
        } else if (colourWellSelected == 3)
        {
          fill(YELLOW);
          applyColourCell(selectedCell, YELLOW);
          applyColourRow(selectedRow, YELLOW);
          applyColourColumn(selectedColumn, YELLOW);
        } else if (colourWellSelected == 4)
        {
          fill(ORANGE);
          applyColourCell(selectedCell, ORANGE);
          applyColourRow(selectedRow, ORANGE);
          applyColourColumn(selectedColumn, ORANGE);
        } else if (colourWellSelected == 5)
        {
          fill(PURPLE);
          applyColourCell(selectedCell, PURPLE);
          applyColourRow(selectedRow, PURPLE);
          applyColourColumn(selectedColumn, PURPLE);
        } else if (colourWellSelected == 6)
        {
          fill(WHITE);
          applyColourCell(selectedCell, WHITE);
          applyColourRow(selectedRow, WHITE);
          applyColourColumn(selectedColumn, WHITE);
        }
      }
    }
  }
}

/*
 Checks if a cell is selected and fills the selected cell 
 with the selected colour from the colour well 
 (by redrawing that individual cell using 
 the row and column number to determine the coordinates)
 - Then unselects the selected cell
 */
void applyColourCell(int cellNum, color cellColour)
{
  //calculates the cell row from the cell Number
  int cellRowNum = cellNum / numGridColumns; 

  //calculates the cell Column from the cell Number
  int cellColumnNum = cellNum % numGridColumns; 

  if (isCellSelected)
  {
    fill(cellColour);
    rect(colourGridStartX + cellColumnNum*gridCellSize, 
      colourGridStartY + cellRowNum*gridCellSize, gridCellSize, gridCellSize);

    isCellSelected = false;
  }
}

/*
 Checks if a row is selected and fills the selected row 
 with the selected colour from the colour well 
 (by redrawing that individual all the cells making up that row 
 using the row number to determine the coordinates)
 - Then unselects the selected row
 */
void applyColourRow(int rowNum, color rowColour)
{
  if (isRowSelected) 
  {
    for (int i=0; i<numGridColumns; i++)
    {
      fill(rowColour);
      rect(colourGridStartX + i*gridCellSize, 
        colourGridStartY + rowNum*gridCellSize, gridCellSize, gridCellSize);
    }
    isRowSelected = false;
  }
}

/*
 Checks if a column is selected and fills the selected column 
 with the selected colour from the colour well 
 (by redrawing that individual all the cells making up that column 
 using the column number to determine the coordinates)
 - Then unselects the selected column
 */
void applyColourColumn(int columnNum, color columnColour)
{
  if (isColumnSelected) 
  {
    for (int i=0; i<numGridRows; i++)
    {
      fill(columnColour);
      rect(colourGridStartX + columnNum*gridCellSize, 
        colourGridStartY + i*gridCellSize, gridCellSize, gridCellSize);
    }
    isColumnSelected = false;
  }
}

/*
 checks if a cell, row, column is clicked
 and fills the ones selected
 (when the mouse is clicked)
 */
void mouseClicked()
{
  checkCellClicked(mouseX, mouseY);
  checkRowSelectors(mouseX, mouseY);
  checkColumnSelectors(mouseX, mouseY);
  checkColourSelection(mouseX, mouseY);
}

/*
 draws the colourWell, Grid, Row and column Selectors,
 score label, and displays the target image.
 */
void draw()
{
  drawColourWells();
  drawGrid();
  drawTargetImage();
  drawRowSelectors();
  drawColumnSelectors();
  drawScoreLabel();
}
