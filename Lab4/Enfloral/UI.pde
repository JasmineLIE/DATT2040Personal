
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

    if (item == "magnet") { //different padding for placing the different items on the UI
      image(magnet, itemPos.x-25, itemPos.y-20);
    } else if (item == "pin") {
     image(flowerPin, itemPos.x-45, itemPos.y-35); 
    } else if (item == "key") {
     image(doorKey, itemPos.x-25, itemPos.y-20); 
    }

  }
  void setItem(String newItem) { //setter method that when invoked changes the String of item.  The item string is used throughout the game to for condition checks
    item = newItem;
  }

  void setDesc (String newDesc) { //setter method that when invoked changes the String of desc, which is the text located in the UI box right beside Poinsettia's portrait
    desc = newDesc;
  }

  void dragItem() { //function to drag items from their place in the item box for interaction.  Snaps back when released
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

  public String getItem() { //getter method for methods and classes that need to check what item is.  Used for conditions
    return item;
  }
}
