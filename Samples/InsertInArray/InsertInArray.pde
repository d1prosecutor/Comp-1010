void setup()
{
  //we want to insert 2
  int[] myArray = {1, 4, 5, 6, -1, -1, -1, -1};
  int size = 4;
  orderInsert(size, myArray, 2);
  size++;
  println(myArray);
}



void orderInsert(int n, int[] data, int newItem)
{
  int index = n-1;
  boolean spotFound = false;
  while (index>=0 && !spotFound)
  {
    if (data[index] > newItem)
    {
      data[index+1]= data[index];
      index--;
    } else {
      spotFound = true;
    }
  }//while
  data[index+1]=newItem;
}
