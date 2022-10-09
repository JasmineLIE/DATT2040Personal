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
    imageMode(CENTER);
    image(button, pos.x+30, pos.y-10);
    fill(255);
    text(id, pos.x, pos.y);

    imageMode(CORNER);
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
