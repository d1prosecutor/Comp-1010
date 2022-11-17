int[] filter(int[] x, int min)
{
  int count =0;
  for (int i=0; i<x.length; i++)
  {
    if (x[i] > min)
      count++;
  }
  int[] y = new int[count];
  int n=0;
  for (int i=0; i<x.length; i++)
  {
    if (x[i] > min)
    {
      y[n] = x[i];
      n++;
    }
  }
  return y;
}
