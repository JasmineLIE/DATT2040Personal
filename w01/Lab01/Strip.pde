class Strip {

  float posX, posyY, sizeVal, colManipulate;

  Strip(float x, float tempSize, float colour) {
    posX = x;
    sizeVal = tempSize;
    colManipulate = colour;
  }


  void draw() {
    for (int i = 0; i < col; i++) {
      float y = i * stepy;
      rect(posX, y, sizeVal, sizeVal);
    }
  }



  void run() {
    draw();
  }
}
