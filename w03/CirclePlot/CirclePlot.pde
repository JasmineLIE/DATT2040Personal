size (500, 500);
int rad = 250;
for (int i = 0; i<3600; i++) {
  float r = rad*sqrt(random(1));
  float theta = random(1) * 2 * PI;

  float x  = width/2+r*cos(theta);
  float y = height/2+r*sin(theta);
  
  ellipse(x,y,2,2);
}
