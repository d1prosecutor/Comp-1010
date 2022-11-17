String test = ("Test one> two");
String b = grabTag(test);
String grabTag(String s)
{
  String answer = "";
  int open = -1;
  int close = -1;

  for (int i=0; i<s.length(); i++)
  {
    if (s.charAt(i) == '<')
    {
      open = i;
    } else if (s.charAt(i) == '>')
    {
      close = i;
    }
  }

  if (open >= 0 && close > open);
  {
    for(int i=open+1; i<close; i++)
    {
      answer +=(s.charAt(i));
    }
  }
  return answer;
}
