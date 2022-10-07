PVector textBoxPos, itemBoxPos;
String desc = "beginning";
String item;
int padding = 50;

class UI {
  void drawBoxes() {
    textBoxPos = new PVector(150, 490);
    rect(textBoxPos.x, textBoxPos.y, 600, 100);
    itemBoxPos = new PVector(750, 470);
    rect(itemBoxPos.x, itemBoxPos.y, 125, 125);
    text(desc, textBoxPos.x+padding, textBoxPos.y+padding);
  }

  void setItem(String newItem) {
    item = newItem;
  }

  void setDesc (String newDesc) {
    desc = newDesc;
  }
}
