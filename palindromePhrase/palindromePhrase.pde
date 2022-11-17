String s = "race car";
String sWithoutSpace = "";
String result = "";

for (int i=0; i<s.length(); i++)
{
  if (Character.isLetter(s.charAt(i)))
  {
    sWithoutSpace += s.charAt(i);
  }
}

for (int i=sWithoutSpace.length()-1; i>=0; i--)
{
  result += sWithoutSpace.charAt(i);
}

if (sWithoutSpace.equals(result))
{
  println(s +" is a palindrome");
} else
{
  println(s +" is not a palindrome");
}
