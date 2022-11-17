final int NOT_FOUND = -1;

int find(int[] a, int key) 
{
  int index = NOT_FOUND; 
  for (int i=0; i < a.length && index == NOT_FOUND; i++)
  {
    if (a[i] == key)
    {
      index = i;
    }
  }
  //to delete from impossible-value PFA
  //if (index!=NOT_FOUND)
  //{
  //  myArray[index] = EMPTY;
  //}

  return index;
}
