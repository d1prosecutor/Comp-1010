//Why we need to use variables? 
size(800, 500);

int firstQuarterWidthX = width/4;
int threeQuarterWidthX = width/4*3;
int halfHeightY = height/2;
int halfWidthX = width/2;
//use these variables + height and width to draw the image 

//red rectangle 
fill(255,0,0,255);
rect(0,0, A,B);

//blue rectangle
fill(0,0,255,255);
rect(C,0,D,E);

//white ellipse 
fill(255,255,255,250);
ellipse(F,G,H,I);

//black ellipse 
fill(0,0,0,250);
ellipse(J,K,L,M);

//left black line
stroke(0,0,0,255);
strokeWeight(4);
line(0,0,N,P);

//right white line
stroke(255,255,255,255);
line(Q,R,S,0);
