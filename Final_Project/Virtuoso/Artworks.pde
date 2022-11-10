int correctCount = 0;
int falseCount = 0;

class Artworks { //The following attributes will be inherited by all subclasses automatically at extension
  PVector pos;
  PImage img;
  Boolean isHaunted;
  String imgURL;


  Artworks(PVector pos, PImage img, int hauntedRoll, String imgURL) {
    this.pos = pos;
    this.img = img;
    this.isHaunted = assignHaunted(hauntedRoll); //Line 28
    this.imgURL = imgURL;
  }

  void verification(boolean answer) { //User's stamp of approval/disapproval is passed through this function as a boolean variable, which increments the incorrect or correct values
    //true = "PASS"
    //false = "PROHIBIT"
    if (answer && !this.isHaunted || !answer && this.isHaunted) {
      correctCount++;
    } else {
      falseCount++;
    }
  }

  boolean assignHaunted(int num) { //whether the artwork is haunted or not is randomized
    if (num == 1) {
      return true;
    } else {
      return false;
    }
  }

  void drawImage() {
    image(img, pos.x, pos.y);
  }
  void setupImage() {
    PImage img = loadImage(imgURL);
  }
}

class Painting extends Artworks {
  Painting(PVector pos, PImage img, int hauntedRoll, String imgURL) {
    super(pos, img, hauntedRoll, imgURL); //Line 11
  }
}

class Sculpture extends Artworks {
  Sculpture(PVector pos, PImage img, int hauntedRoll, String imgURL) {
    super(pos, img, hauntedRoll, imgURL); //Line 11
  }
}

class Pottery extends Artworks {
  Pottery(PVector pos, PImage img, int hauntedRoll, String imgURL) {
    super(pos, img, hauntedRoll, imgURL); //Line 11
  }
}
