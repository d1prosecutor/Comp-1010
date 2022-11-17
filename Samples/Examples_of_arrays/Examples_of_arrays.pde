//default value for an array is false;
//define an array and assign values to the cells of the array, else it will be false

/*
boolean [] booleanArray = new boolean [100];
  //EXPECTED OUTPUT: [ture,false,f,t,f,f,t,f,f,t...]
for (int i = 0; i< booleanArray.length; i++) { //to make it true you could have i%3 == 0 (if i is divisible by 3, the remainder will be 0, or you could have i + 3
  if (i%3==0){
   booleanArray[i] = true; 
  }
}*/


/*

//fibonachi sequence first two numbers are 1, then the next number is the sum of the 2 previous numbers, 1,1,2,3,5,8,13,21

int [] fibArray = new int [10];
//expected output is the fibonachi sequence
fibArray [0] = 1;
fibArray [1] = 1;

for (int i =2; i<fibArray.length; i++){                 //we know the first two numbers of fibonachi is 1, so we have to start from cell 2
  fibArray [i] = fibArray [i-1] + fibArray [i-2];
  println(fibArray[i]);
} 

*/

/*
int inputInt = 200;
int [] arrayTest = new int[inputInt]; //get input of user
*/

/*

//want to calculate the sum of the elements
int [] numbers = {2,-9,0,5,12,-25,22,9,8,12}; //array of numbers
int sum = 0;                    //important to have zero as first value for the sum
double average;

for (int i = o; i<numbers.length; i++){
  
}

int arrayLength = numbers.length;
average = ((double)sum/arrayLength);

println("Sum = " + sum);
println("Average = " + average);

*/



size(500,500);
int squareWidth = 30;

int [] squarePoints = {10,20,200,300,50,50,300,20,440,40,40,450};

for (int i = 0; i<squarePoints.length; i+=2){                           //uses the first number for x, the second number for y, the third number as x, the fourth number as y
   rect (squarePoints[i],squarePoints[i+1], squareWidth, squareWidth); 
}

//this is a more simple way to do it

int [] squarePointsX = {10,200,50,300,440,40};
int [] squarePointsY = {20,300,50,20,40,450};

for (int i = 0; i < squarePointsX.length; i++){
 rect(squarePointsX[i], squarePointsY[i], squareWidth, squareWidth); 
}
