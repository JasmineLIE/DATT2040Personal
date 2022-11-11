int correctCount = 0;
int falseCount = 0;
PImage painting, sculpture, pottery;

class Artworks { //The following attributes will be inherited by all subclasses automatically at extension
  PVector pos;
  PImage img;
  Boolean isHaunted;
  String imgURL;
  int difficultyRating;
  String artProfile;

  Artworks(PVector pos, PImage img, int hauntedRoll, String imgURL, String artProfile) {
    this.pos = pos;
    this.img = img;
    this.isHaunted = assignHaunted(hauntedRoll); //Line 30
    this.imgURL = imgURL;
    this.difficultyRating = (int)random(2); //1=Artwork will have visual hauntedness, 2==no visual hauntedness.  Ovilus is not affected
    this.artProfile = artProfile;
    setupImage();
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
  void loadDocument() {
    String[] lines = loadStrings(artProfile);
    fill(255);
    textAlign(CENTER);;
    for (int i = 0; i < lines.length; i++) {
      text(lines[i], 0, 0, width, height);
    }
  }
}

class Painting extends Artworks {
  Painting(PVector pos, PImage img, int hauntedRoll, String imgURL, String artProfile) {
    super(pos, img, hauntedRoll, imgURL, artProfile); //Line 11
  }
}

class Sculpture extends Artworks {
  Sculpture(PVector pos, PImage img, int hauntedRoll, String imgURL, String artProfile) {
    super(pos, img, hauntedRoll, imgURL, artProfile); //Line 11
  }
}

class Pottery extends Artworks {
  Pottery(PVector pos, PImage img, int hauntedRoll, String imgURL, String artProfile) {
    super(pos, img, hauntedRoll, imgURL, artProfile); //Line 11
  }
}
