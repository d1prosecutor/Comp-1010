boolean validate(float x)
{
  return 0<=x && x<=100;
}

float[] validatedData(float[] data)
{
  int count =0;
  for (int i=0; i<data.length; i++)
  {
    if (validate(data[i]))
    {
      count++;
    }
  }
  float[] y = new float[count];
  count = 0;

  for (int i=0; i<data.length; i++)
  {
    if (validate(data[i]))
    {
      y[count] = data[i];
      count ++;
    }
  }
  return y;
}
