float lx = -height, ly = -height;
void wavesHack() {
  blendMode(NORMAL);
  frameRate(30);
  stroke(random(255), random(255), random(255));
  

  for (int i = 0; i < width; i++) { //each frame draw a sinewave spanning from the width of the screen

    float wlen1 = mouseX;
    float w1 = sin(i*wlen1)*50;


    float w2 = 1+sin(m)*10;

    float waveadd = (w1*w2)/2;      



    point(i, height/2+waveadd);

    //keeps line nice
    if (lx < (width)-1) {
      rect(i, height/2+waveadd, lx, ly); 
      lx = i;
      ly = height/2+waveadd;
    } else {
      lx = 0;
      ly = height/2;
    }
  }
  saveFrame("line-######.png");

}
