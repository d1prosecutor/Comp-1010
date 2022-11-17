String s = "There are many vowels in most sentences.";
String output = "";

char Vowel = 'a';

for (int i=0; i<s.length(); i++)
{
  char currentChar = s.charAt(i);
  if (currentChar == ' ')//(Character.isSpaceChar(s.charAt(i)))
  {
    output += Vowel;
  } else 
  {
    if (currentChar == 'a' || currentChar == 'e' ||currentChar == 'i' ||
      currentChar == 'o' ||currentChar =='u')
    {
      Vowel = currentChar;
    }
    output += currentChar;
  }
}
println(output);
