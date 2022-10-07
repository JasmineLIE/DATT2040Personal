boolean magnetGrabbed = false;
class Magnet {
 float size;
 PVector pos;
 
 Magnet() {
  size = 50;
  pos = new PVector (800, 400);
 }
 
 void grab() {
    if (dist(mouseX, mouseY, pos.x, pos.y) <= size/2) {
     
      if (mousePressed) {
      magnetGrabbed = true;
      pos.x = mouseX;
      pos.y = mouseY;
  } else {
    magnetGrabbed = false;
 }
 
}
 }
 
 void drawMagnet() {
   ellipse(pos.x, pos.y, size, size);
 }
 
 void run() {
  grab();
  drawMagnet();
 }
}
