int col = 10;
int row = 10;
int stepx, stepy;
int decrement = 0;
void transition() {
  noStroke(); //<>//
  float opacityShift = map(400-decrement, 0, 255, 0, 200);
  for (int i = 0; i<row+col; i++) {
    float x = i%col;
    float y = i/row;
    fill(171-(i*2), 119+(i*5), 293, opacityShift);
    rect(x*stepx, y*stepy, width, height);
  }
  fill(#EAE295, opacityShift*10);
  textSize(70);
  text("To " + location, width/2, height/2);
  decrement+=5;
}

void keyPressed() {
 decrement = 0; 
}
