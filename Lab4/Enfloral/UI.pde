
PVector textBoxPos, itemBoxPos;
PVector itemPos = new PVector(810, 530);
String desc = "";
String item;
int padding = 50;
int itemSize = 50;

class UI {
  void drawBoxes() {
    textBoxPos = new PVector(150, 490);
    
    image(boxUI, 0, 0);
    itemBoxPos = new PVector(750, 470);
   
    text(desc, textBoxPos.x+padding, textBoxPos.y+padding);
  }

  void drawItem() {

    ellipse(itemPos.x, itemPos.y, itemSize, itemSize);
  }
  void setItem(String newItem) {
    item = newItem;
  }

  void setDesc (String newDesc) {
    desc = newDesc;
  }

  void dragItem() {
    if (mousePressed) {
      if (dist(mouseX, mouseY, itemPos.x, itemPos.y) <= itemSize + padding) {
        itemPos.x = mouseX;
        itemPos.y = mouseY;
      }
    } else {
      itemPos.x = 810;
      itemPos.y = 530;
    }
  }

  void run() {
    drawBoxes();
    drawItem();
    dragItem();
  }
}
