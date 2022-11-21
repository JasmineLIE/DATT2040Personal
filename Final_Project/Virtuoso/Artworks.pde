int correctCount = 0;
int falseCount = 0;
int printTrigger = 0;
PImage painting, sculpture, pottery, paintInspec, sculpInspec, pottInspec, cursor1, cursor2;
boolean docClicked = false;
boolean isPrinting = true;
boolean paperPrinted = false;
PVector acc = new PVector (1, 0);
PVector printerPos = new PVector(475, 160);
PVector paperPos = new PVector(475, 200);
SoundFile print;

BubblesSystem bs;

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
    stageSwitch();
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


  void stageSwitch() {
    isPrinting = true;
    //To Override
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
        float adjustBrightness = map(d, 0, 300, 2, 0);
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

  void printer() {
    rectMode(CENTER);

    fill(255);
    rect(paperPos.x, paperPos.y, 200, 280);
     bs.run();
    image(printer, printerPos.x, printerPos.y);
   

    if (isPrinting) {

      if (second() > printTrigger) {
        print.play();
        printTrigger = second() + (int)print.duration();
      }
      paperPos.y++;
      if (printerPos.x>(480) ) {
        ;
        acc.x*=-1;
      }
      if (printerPos.x < (470)) {
        acc.x*=-1;
      }
      printerPos.add(acc);
      if (paperPos.y == 500) isPrinting = false;
      paperPrinted = true;
    } else {
      print.stop();
      if (dist(mouseX, mouseY, paperPos.x, paperPos.y) <= 180 && !docClicked && paperPrinted) {
        cursorInspec = true;
        if (mousePressed) {
          docClicked = true;
        }
      } else {
        cursorInspec = false;
      }
    }

    rectMode(NORMAL);
    if (docClicked) {
      image(paper, width/2, height/2);
      loadDocument();
    }
  }
  void loadDocument() {
    String[] lines = loadStrings(artProfile);
    fill(255);
    rect(0, 0, width/2+100, height);
    fill(0);
    textAlign(NORMAL);
    for (int i = 0; i < lines.length; i++) {
      text(lines[i], 10, 10, width/2+100, height);
    }

    navigation(new PVector(800, 600), "OFFICE", 1, #EAE295);
    navigation(new PVector(800, 200), "PASS", 1, #02F54D);
    navigation(new PVector(800, 400), "DENY", 1, #F50202);
  }
}

class Painting extends Artworks {
  Painting(int hauntedRoll, String exhibURL, String inspecURL, String artProfile, String cursedURL) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile, cursedURL); //Line 11
  }

  void inspecArt() {
    super.inspecArt();
  }
  void stageSwitch() {
    super.stageSwitch();
    artState = "sculpture";
  }
}

class Sculpture extends Artworks {
  Sculpture(int hauntedRoll, String exhibURL, String inspecURL, String artProfile, String cursedURL) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile, cursedURL); //Line 11
  }
  void inspecArt() {
    super.inspecArt();
  }
  void stageSwitch() {
    super.stageSwitch();
    artState = "pottery";
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
