/* Chukwuocha Chukwunaza 
 Lab 02 Fall - COMP 1010 A02- Gold exercise
 A Droodle picture (Google it) representing
 "A bird who caught a very stong worm"
 It should adapt to any size window, using the window's height
 to control the size of the picture.*/
 
size(500, 400);
background(255);

//variables for the horizon and hole
int holeCenterX = width/2; //x coordinate of the center of the hole
int holeCenterY = (height*7)/10; //y coordinate of the center of the hole(70 percent)
int holeHeight = 10*height/100; //height of the hole
int holeWidth = holeHeight*2; //width of the hole being twice the height
int horizonHeight = (height*3)/5; // heght of the horizon from the top of the window(60 percent)

//variables for the legs and claws
int legHeight = (height*2)/5; //height of the legs from the top of the window     
int leg1Location = (holeCenterX-(holeWidth/2)); //stores the location of the height of the left leg
int leg2Location = (holeCenterX+(holeWidth/2)); //stores the location of the height of the right leg
int clawLength = (width*1)/20; //scales and sets the claw length as 5 percent of the width
int clawDistanceY = (height*1)/20; // scales and sets the vertical distance from the claws to the leg as 5 percent of the height


//drawing begins here

//draw hole
stroke(100); //sets the stroke colour for the circle
ellipse(holeCenterX, holeCenterY, holeWidth, holeHeight); //draws the hole

//draw horizon
stroke(80); //sets the stroke colour for the rectangle
rect(0, 0, width, horizonHeight); //draws the horizon

//feet
line(holeCenterX, holeCenterY, leg1Location, legHeight); //draws the left feet
line(holeCenterX, holeCenterY, leg2Location, legHeight); //draws the right feet

//claws ---READ ME(LABELLED OR DRAWN FROM THE LEFT TO THE RIGHT!!!)
//In some cases, the claw length is divided by 10 to compensate for the length of the claw in order to make it look better :)
line(leg1Location, legHeight, leg1Location-clawLength, legHeight); //draws the first claw on the first leg
line(leg1Location, legHeight, leg1Location-clawLength, legHeight-clawDistanceY); //draws the second claw on the first leg
line(leg1Location, legHeight, leg1Location+(clawLength/10), legHeight-clawDistanceY); //draws the third claw on the first leg
line(leg2Location, legHeight, leg2Location+clawLength, legHeight); //draws the first claw on the second leg
line(leg2Location, legHeight, leg2Location+clawLength, legHeight-clawDistanceY); //draws the second claw on the second leg
line(leg2Location, legHeight, leg2Location-(clawLength/10), legHeight-clawDistanceY); //draws the third claw on the second leg
// :)
