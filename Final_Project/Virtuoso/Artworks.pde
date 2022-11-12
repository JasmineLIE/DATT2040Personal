int correctCount = 0;
int falseCount = 0;
PImage painting, sculpture, pottery, paintInspec, sculpInspec, pottInspec;

class Artworks { //The following attributes will be inherited by all subclasses automatically at extension
  PImage artwork, artworkInspec, artworkCursed;
  Boolean isHaunted;
  String exhibURL, inspecURL, cursedURL;
  int difficultyRating;
  String artProfile;

  Artworks(int hauntedRoll, String exhibURL, String inspecURL, String artProfile, String cursedURL) {
    this.isHaunted = assignHaunted(hauntedRoll); //Line 30
    this.exhibURL = exhibURL;
    this.inspecURL = inspecURL;
    this.cursedURL = cursedURL;
    this.difficultyRating = (int)random(2); //1=Artwork will have visual hauntedness, 2==no visual hauntedness.  Ovilus is not affected
    this.artProfile = artProfile;
    setupImage(); //Perform image setup all in constructor
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

  void setupImage() {
    artwork = loadImage(exhibURL);
    artworkInspec = loadImage(inspecURL);
  }
  void drawImage() { //contains access to the close inspection method which will be overridden per each artwork
    image(artwork, width/2, height/2);
  }


  void inspecArt() {
    image(artworkInspec, width/2, height/2);
  }
  void loadDocument() {
    String[] lines = loadStrings(artProfile);
    fill(255);

    for (int i = 0; i < lines.length; i++) {
      text(lines[i], 0, 0, width, height);
    }
  }
}

class Painting extends Artworks {
  Painting(int hauntedRoll, String exhibURL, String inspecURL, String artProfile, String cursedURL) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile, cursedURL); //Line 11
  }
}

class Sculpture extends Artworks {
  Sculpture(int hauntedRoll, String exhibURL, String inspecURL, String artProfile, String cursedURL) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile, cursedURL); //Line 11
  }
}

class Pottery extends Artworks {
  Pottery(int hauntedRoll, String exhibURL, String inspecURL, String artProfile, String cursedURL) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile, cursedURL); //Line 11
  }
}
