void setup()
{
  //***********************************
  println("[0] *********");
  int[] myArray = thisMethodReturnsArray(10); //[- - - - - -]
  println(myArray);


  println("[1] *********");
  int[] myArrayV2 =  new int[10];
  myArrayV2 = thisMethodReturnsArray(10);
  println(myArrayV2);


  //emptyFunction(myArray[2]);







  //**************************************
  
//  void changeInt(int a)
//{
//  a = 20;
//}




  int y = 13;
  println("[2]:", y); //13
  changeInt(y);
  println("[3]:", y); //13


  int[] array1 = {1, 2, 3};
  int[] array2 = array1;
  println(array2); // 1,2,3
  array1[0] = 13;
  println(array2); //13, 2, 3






//void changeArray(int[] a)
//{
  //  x and a are pointing to the same block of memory 
//  a[2]=9;
//}


  println("*********");
  int [] x = {1, 5, 7, 2};
  println(x); //1,5,7,2
  changeArray(x);
  println("**** AFTER *****");
  println(x); //1,5,9,2












  println("*********");
  int [] x2 = {1, 5, 7, 2};
  println(x2);
  int [] newArray = deepCopy(x2);
  newArray[0] = 99;
  println("**** AFTER *****");
  println(x2);
}








//return 
int[] thisMethodReturnsArray(int num)
{
  int[] resultArray = new int[num];
  for (int i = 0; i<num; i++)
  {
    resultArray[i] = (int)random(100);
  }
  return resultArray;
}




//input 
int inputArrayFunction(String[] s)
{
  int result = 0;
  println(s[2]);
  result = s.length;
  return result;
}


void emptyFunction(int a)
{
  
}


void changeInt(int a)
{
  a = 20;
}

void changeArray(int[] a)
{
  a[2]=9;
}





//DeepCopy
int[] deepCopy(int [] original)
{
  int[] localCopy = new int[original.length];
  for (int i = 0; i<original.length; i++)
  {
    localCopy[i] = original[i];
  }

  return localCopy;
}







//Comparing 
boolean arrayEqualFunction(int[]a1, int[]a2)
{
  boolean equal = true;
  if (a1.length != a2.length)
  {
    equal = false;
  }

  for (int i = 0; i<a1.length && equal; i++)
  {
    if (a1[i] != a2[i])
    {
      equal = false;
    }
  }
  return equal;
}


//Swapping
void swappArray(int[]a, int index1, int index2)
{
  int tempInt = a[index1];
  a[index1] = a[index2];
  a[index2] = tempInt;
}
