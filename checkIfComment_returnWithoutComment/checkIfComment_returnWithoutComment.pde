String test = "int x=0; //This is x";
String s = chopComment(test);// should return " int x=0; "

int hasComment(String line) {
  for (int i=0; i<line.length()-1; i++) //important to stop one character early
    if (line.charAt(i)=='/' && line.charAt(i+1)=='/')
      return i;
  return -1;
}

String chopComment(String line) {
  String newLine = "";
  int place = hasComment(line);
  if (place == -1)
  {
    return line;
  } else
  { 
    for (int i=0; i<place; i++)
    {
      newLine += line.charAt(i);
    }
  }
  return newLine;
}
