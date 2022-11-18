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
    
    printing = true;
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
    artworkCursed = loadImage(cursedURL);
  }
  void drawImage() { //contains access to the close inspection method which will be overridden per each artwork
    image(artwork, width/2, height/2);
  }


  void inspecArt() {
    loadPixels();
    artworkInspec.loadPixels();
    for (int x = 0; x < width; x++) {
      for (int y = 0; y<height; y++) {
        int loc = x + y*artworkInspec.width;

        float r = red(artworkInspec.pixels[loc]);
        float g = green(artworkInspec.pixels[loc]);
        float b = blue(artworkInspec.pixels[loc]);

        float d = dist(x, y, mouseX, mouseY);
        float adjustBrightness = map(d, 0, 400, 2, 0);
        r *= adjustBrightness;
        g *= adjustBrightness;
        b *= adjustBrightness;
        color c = color(r, g, b);
        pixels[loc] = c;
      }
    }

    updatePixels();
    navigation(new PVector(150, 700), "EXHIBITION", 3, #EAE295);
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

  void inspecArt() {
    super.inspecArt();
  }
}

class Sculpture extends Artworks {
  Sculpture(int hauntedRoll, String exhibURL, String inspecURL, String artProfile, String cursedURL) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile, cursedURL); //Line 11
  }
  void inspecArt() {
    super.inspecArt();
  }
}

class Pottery extends Artworks {
  Pottery(int hauntedRoll, String exhibURL, String inspecURL, String artProfile, String cursedURL) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile, cursedURL); //Line 11
  }
  void inspecArt() {
    super.inspecArt();
  }
}
