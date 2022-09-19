//--Sound---
import processing.sound.*;
SoundFile blop;
//--Sound---

PImage koiPond; //initialize PImage object
Brush[] brushArr = {}; //An array to store the Brush objects

void setup() {
  size (1000, 700);
  background(0);
  blop = new SoundFile(this, "blop.mp3");
  koiPond = loadImage("KoiMap.png");
  image(koiPond, width/2, height/2);
  imageMode(CENTER);
}

void draw() {
  //---Create a fading trail effect using the background image overlaying with little opacity---
  tint(255, 30);
  image(koiPond, width/2, height/2);
  tint(255, 255); //Call another tint with full opacity so the lotus images aren't also transluscent
  //-------------
  
  //---Keep track and update each Brush object each frame, can also manage new ones---
  for (int i = 0; i < brushArr.length; i++) {
    Brush thisBrush = brushArr[i];
    thisBrush.update();
  }
  //-------------  
 
}

void mouseReleased() { //New lotus flowers can spawn each mouse click
  genBrush();
  println(brushArr.length); //debug
}

void genBrush() { //creates a new instance of Brush(), a.k.a the lotus flowers.  Append the new instance to the array to be kept track of
  Brush thisBrush = new Brush();
  thisBrush.drawMe();
  brushArr = (Brush[])append(brushArr, thisBrush);
}

void mousePressed() { //Every mouse click makes a water drop sound effect
  blop.play();
}
