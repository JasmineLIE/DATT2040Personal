int correctCount = 0;
int falseCount = 0;

class Artworks {
  PVector pos;
  PImage img;
  Boolean isHaunted;
  String imgURL;

  Artworks(PVector pos, PImage img, Boolean isHaunted, String imgURL) {
    this.pos = pos;
    this.img = img;
    this.isHaunted = isHaunted;
    this.imgURL = imgURL;
  }

  void verification(boolean answer) { //User's stamp of approval/disapproval is passed through this function as a boolean variable, which increments the incorrect of correct values
    //true = "PASS"
    //false = "PROHIBIT"
    if (answer && !isHaunted || !answer && isHaunted) {
      correctCount++;
    } else {
      falseCount++;
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
  Painting(PVector pos, PImage img, Boolean isHaunted, String imgURL) {
    super(pos, img, isHaunted, imgURL);
  }
}

class Sculpture extends Artworks {
  Sculpture(PVector pos, PImage img, Boolean isHaunted, String imgURL) {
    super(pos, img, isHaunted, imgURL);
  }
}

class Pottery extends Artworks {
  Pottery(PVector pos, PImage img, Boolean isHaunted, String imgURL) {
    super(pos, img, isHaunted, imgURL);
  }
}
