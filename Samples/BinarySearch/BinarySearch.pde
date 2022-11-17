
int[] numbers = new int[100];

for (int i = 0; i<numbers.length; i++)
{
  numbers[i] = i;
}

//[0,1,2,3,4,5,.....,99]

int searchThis = 25 ;

//[0,1,2,3,4,5,.....,99]
searchThis = 25 ;

int counter = 0;
for (int i = 0; i<numbers.length; i++)
{
  counter++;
  if (numbers[i] == searchThis)
  {
    println("FOUND in ", counter, "steps");
  }
}

int beginIndex = 0;
int endIndex = numbers.length; 
boolean foundFlag = false;


//Initialise the variables.
int[] intArray = new int[100];
int lower = 0;
int upper = 99;
int flag = 0;
int mid = 0;


for (int i=0; i<100; i++)
{
  intArray[i] = i;
}

//[0,1,2,3,4,5,.....,99]
//[0,1,2,*3,[4],5,6,7,8,9]


counter = 0;
// Main loop.
while (flag == 0)
{
  counter++;
  //Sets the element to search by finding mid point.
  mid = ((lower+upper)/2);

  //Checks if the mid point is equal to search criteria.
  if (intArray[mid] == searchThis)
  {
    flag = 1;
  }
  //Checks if it's grater than the currently searched element.
  else if (searchThis > intArray[mid])
  {
    lower = (mid+1);
  } else
  {
    upper = (mid - 1);
  }

  //Checks if the lower value is higher than the upper value.
  if (lower > upper)
  {
    flag = 2;
  }
}


//println("Found in", counter, "steps"); 
