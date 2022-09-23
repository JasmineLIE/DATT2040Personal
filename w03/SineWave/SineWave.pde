void setup() {
  size(600, 300);
}

void draw() {
  background(255);
  for (int i = 0; i < width; i++) {
    float x = i;
    float y = height/2 + sin(i*0.05)*50; //we want to add to the height, because that's going to be our wae
    ellipse(x, y, 10, 10);
  }
}
