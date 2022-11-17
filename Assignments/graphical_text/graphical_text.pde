final int SPACE_MIN = 10;

final int SPACE_MAX = 100;

final String message = "howdy!";

int space = SPACE_MIN;

 

void setup()

{

 size(500,500);

}

 

void draw()

{

 background(0);

 space = space + 1;

 if (space > SPACE_MAX)

  space = SPACE_MIN;

 for (int i = 0; i < message.length(); i++)

 {

  char c = message.charAt(i);

  text(c, space*i, mouseY);

 }

}
