/* Example
   Write all of the words in an array of words in the
   canvas, in random positions (making sure the whole
   word fits within the canvas).
*/

//The words to be printed
String[] words = {"This","is","a","quick","test","of","an","array"};

//Set up the canvas, and the text colour and size
size(500,500);
fill(0); //Black text
textSize(30); //Fairly big

//Now draw all the words
for(int i=0; i<words.length; i++){
  float x = random(0,width-textWidth(words[i]));
  float y = random(textAscent(),height-textDescent());
  text(words[i],x,y);
}
