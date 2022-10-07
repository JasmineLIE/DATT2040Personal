class Buttons {
  PVector pos;
  int size;
  String id;
  PImage img;

  Buttons (PVector pos, int size, String id) {
    this.pos = pos;
    this.size = size;
    this.id = id;
   
  }

  void drawButton() {
    ellipse(pos.x, pos.y, size, size);
    fill(0);
    text(id, pos.x, pos.y);
    fill(255);
  }
  void buttonClicked() {

    if (dist(mouseX, mouseY, pos.x, pos.y) <= size/2) {
     
      if (mousePressed) {
        gameMode = id;
      }
    } 
  }





  void run() {
    buttonClicked();
    drawButton();
  }
}
