float angle;
boolean magnetGone = true;
void clockRoom() {
   int s = second();
  
  background(0);
  stroke(255);
  noFill();
  pushMatrix();
  translate(width/2, height/2);
  strokeWeight(1);
  float rad = 150;
  circle(0,0,rad*2);
  
  strokeWeight(34);
  stroke(252,238,33);
  float x = rad*cos(angle);
  float y = rad*sin(angle);
  point(x,y);
  strokeWeight(10);
  line(0, 0, x, y);
  popMatrix();
  
  if (magnetGone) {
  if (s%2==0) angle += 0.005;
  } 
}
