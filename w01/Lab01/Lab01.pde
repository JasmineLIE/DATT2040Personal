//global variables
int col = 10;
int row = 10;

//to hold step size / distance between lines
int stepx, stepy;

void setup() {
  size(500, 500);

  //define step sizes
  stepx = width/col;
  stepy = height/row;

  noLoop(); //identify that our program is going to go through the process one time
}

void draw() {

  for (int i=0; i < col; i++) {
    for (int j=0; j < row; j++) {
      
      float x = i* stepx;
      float y = j * stepy;
      
      if (random(1) > 0.5) {
          fill (255);
      } else {
        fill(0);
      }
      rect(x,y, stepx, stepy);
    }
  }
}
