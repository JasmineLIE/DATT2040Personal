int col;
int row;
int stepx, stepy;
int decrement;

void transition() {
  noStroke();
  float opacityShift = map(255-decrement, 0, 255, 0, 300);
  for (int i = 0; i<row+col; i++) {
    float x = i%col;
    float y = i/row;
    fill(105+(i*2), 76, 137-(i*2), opacityShift); //create a subtle gradient
    rect(x*stepx, y*stepy, width, height);
  }
  textAlign(CENTER, CENTER);
  fill(#EAE295, opacityShift*10);
  textSize(120);
  text("V I R T U O S O", width/2, height/2); //text in the middle has a different fade out time
  decrement+=5;
}
