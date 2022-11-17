void setup()
{
  int[] myArray = {1, 2, 3};
  int[] newArray = enlargeArray(myArray);
  println(newArray);
}




int[] enlargeArray(int[] originalArray)
{
  int[] newArray = new int[originalArray.length*2]; //size = 6

  for (int i = 0; i<originalArray.length; i++)
  {
    newArray[i]= originalArray[i];
  }
  
  //3 - 6
  for(int i = originalArray.length; i<newArray.length;i++)
  {
   newArray[i] = -1; 
  }
  //[1,2,3,-1,-1,-1]
  
  return newArray;
  
}
