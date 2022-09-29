  float r = 150;
  float thisAngle = 0;
  int numSpirals = 5;
void spiral() {

  frameRate(60);
for (int i = 0; i<numSpirals; i++) {
  

  translate(200, 200);
  strokeWeight(16);
  stroke(random(255), random(230), random(255));
  float x = r*cos(thisAngle);
  float y = r*sin(thisAngle);
  point(x,y);
}
  thisAngle += 0.04;
  r -= 0.2;
}
