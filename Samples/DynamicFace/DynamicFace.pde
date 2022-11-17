size(100, 215);

final int LEFT_EYE_X = width/4;
final int LEFT_EYE_Y = height/8;

final int RIGHT_EYE_X = width*3/4;
final int RIGHT_EYE_Y = LEFT_EYE_Y;
final int EYE_RADIUS = width/8;

ellipse(LEFT_EYE_X, LEFT_EYE_Y, EYE_RADIUS,EYE_RADIUS);
ellipse(RIGHT_EYE_X, RIGHT_EYE_Y, EYE_RADIUS,EYE_RADIUS);


final int NOSE_WIDTH = width/10;
final int NOSE_HEIGHT = height/5;
final int NOSE_X = LEFT_EYE_X + ((RIGHT_EYE_X - LEFT_EYE_X)/2) - (NOSE_WIDTH/2);
rect(NOSE_X, RIGHT_EYE_Y, NOSE_WIDTH, NOSE_HEIGHT);


final int MOUTH_X = LEFT_EYE_X;
final int MOUTH_Y = height - height/3;

rect(MOUTH_X, MOUTH_Y, (RIGHT_EYE_X - LEFT_EYE_X), height/10);
