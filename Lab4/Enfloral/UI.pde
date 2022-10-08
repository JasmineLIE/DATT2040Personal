
PVector textBoxPos, itemBoxPos;
PVector itemPos = new PVector(810, 530);
String desc = "";
String item ="";
int padding = 50;
int itemSize = 50;
boolean itemDragged = false;
class UI {
  void drawBoxes() {
    textBoxPos = new PVector(150, 490);
    
    image(boxUI, 0, 0);
    itemBoxPos = new PVector(750, 470);
   
    text(desc, textBoxPos.x+padding, textBoxPos.y+padding);
  }

  void drawItem() {

    ellipse(itemPos.x, itemPos.y, itemSize, itemSize);
    fill(0);
    text(item, itemPos.x, itemPos.y);
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
        itemDragged = true;
      }
    } else {
      itemPos.x = 810;
      itemPos.y = 530;
      itemDragged = false;
    }
  }

  void run() {
    drawBoxes();
    drawItem();
    dragItem();
    getItem();
  }
  
  public String getItem() {
   return item; 
  }
}
