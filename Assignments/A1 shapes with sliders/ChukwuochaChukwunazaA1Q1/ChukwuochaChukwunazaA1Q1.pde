/*Chukwunaza Chukwuocha
comp1010-A02
Assignment 1 Q1

THE NUMBERS VISIBLE IN THE VARIABLE ASSIGNMENTS ARE NOT LITERALS BUT ALEGRAIC EXPRESSIONS FOR SCALING THE SHAPES!!!
*/

size(500, 500);// the usual canvas size
background(255);

//Declaring The Variables for the root shape
float ellipseX = (width/2); // x coordinate of the ellipse center
float ellipseY = (height-(height/10)); // y coordinate of the ellipse center
float ellipseWidth = (width/5); // width of the ellipse
float ellipseHeight = (height/15); // height of the ellipse

// Drwaing the root shape whcih is an ellipse
noStroke();
fill(150, 150); // sets the colour for the ellipse
ellipse(ellipseX, ellipseY, ellipseWidth, ellipseHeight);

//variables for the Pencil Collar
float pencilCollarX = (ellipseX); 
float pencilCollarY = (ellipseY-(ellipseHeight*3/10));
float pencilCollarLeft = (ellipseX-(ellipseWidth/2));
float pencilCollarRight = (ellipseX+(ellipseWidth/2));
float pencilCollarHeight = (ellipseY-(ellipseHeight*4));

//Drwaing the pencil collar
fill(#CB9F7D);
triangle(pencilCollarX, pencilCollarY, pencilCollarLeft, pencilCollarHeight, pencilCollarRight, pencilCollarHeight);

//variables the Pencil tip
float pencilTipX = pencilCollarX;
float pencilTipY = pencilCollarY;
float pencilTipLeft = pencilCollarLeft + ((pencilCollarRight - pencilCollarLeft)/3);
float pencilTipRight = pencilCollarRight - ((pencilCollarRight - pencilCollarLeft)/3);
float pencilTipHeight = (pencilCollarHeight + ((pencilCollarY-pencilCollarHeight)*2/3));

//Drawaing the pencil tip
fill(0);
triangle(pencilTipX, pencilTipY, pencilTipLeft, pencilTipHeight, pencilTipRight, pencilTipHeight);

//variables the pencil body
float rect1Width = (pencilCollarRight - pencilCollarLeft);
float rect1Height = ellipseHeight*6;
float rect1X = pencilCollarLeft;
float rect1Y = pencilCollarHeight;

//Drawaing the pencil body
fill(#EAB836);
rect(rect1X,rect1Y, rect1Width, -rect1Height);

//Drawing the eraser holder
float rect2Width = rect1Width;
float rect2Height = ellipseHeight;
float rect2X = pencilCollarLeft;
float rect2Y = (pencilCollarHeight - rect1Height);

fill(#BCBBBA);
rect(rect2X, rect2Y, rect2Width, -rect2Height);

//variables for the Eraser
float rect3Width = rect1Width;
float rect3Height = ellipseHeight*2;
float rect3X = pencilCollarLeft;
float rect3Y = rect2Y-rect2Height;

//Drawaing the Eraser
fill(#CE2534);
rect(rect3X, rect3Y, rect3Width, -rect3Height);
