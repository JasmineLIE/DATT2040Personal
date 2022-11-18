int col = 15;
int row = 15;
int stepx, stepy;
int decrement = 0;

void transition() {
  noStroke();
  float opacityShift = map(255-decrement, 0, 255, 0, 300);
  for (int i = 0; i<row+col; i++) {
    float x = i%col;
    float y = i/row;
    fill(105+(i*2), 76, 137-(i*2), opacityShift); //create a subtle gradient
    rect(x*stepx, y*stepy, width, height);
  }
  fill(#EAE295, opacityShift*10);
  textSize(120);
  text("V I R T U O S O", width/2, height/2); //text in the middle has a different fade out time
  decrement+=5;
}

void printer() {
  rectMode(CENTER);
  PVector pos = new PVector(475, 200);
  fill(255);
 image(printer, 475, 160); 
 rect(pos.x, pos.y, 250, 300);
 rectMode(NORMAL);
 
}
