void setup() {
  size(500, 500); 
  background(64);
  noStroke();
}

void draw() {

  float size = random (25, 100);

  float x = random(width);
  float y = random(height);

  for (float ring = size; ring >= 0; ring -= random(2, 10)) {
    fill(random(256), random(256), random(256));
    ellipse(x, y, ring, ring);
  }
}
