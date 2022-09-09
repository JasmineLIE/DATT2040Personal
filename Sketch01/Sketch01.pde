void setup() {
  size(800, 800);
  rectMode(CENTER); //can figure out with a core function does by right-clicking and clicking 'reference' ; CENTER is case sensitive
}

void draw() {
  background(0); //Without background, it's opaque, which shows each draw frame. There's a colour selector under 'Tools' (R,G,B, Alpha)
  ellipse(width/2, height/2, 20, 20);
  //x pos, y pos, size pixels, size pixels
  //there are different starting values for objects, in this case rects start at the top right hand vs ellipse starting at the centre
  
  pushMatrix(); 
  translate(width/2, height/2); //we define the width and the height first, then apply the rotation in the next line
  rotate(0.6); //rotates around an ellipsical axis, use transform to rotate it by its centre
  rect(0, 0, 70, 70); //if using translate with rotate, need to set xpos and ypos of shape to 0 to draw it in the middle, as its position is determined already by translate();
  popMatrix();
  
  /*
  Push and Pop Matrix perserves the space translation done in one segment, and then restores the prior one for the following lines of code.  Stops interference
  */
  pushMatrix();
  translate(400, 400);
  rotate(frameCount*0.1); //to turn it in the other direction, minus (1) the rotation
  rect(0, 0,  70, 70);
  popMatrix();
}
