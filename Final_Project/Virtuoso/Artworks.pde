int correctCount;
int falseCount;
int printTrigger;

// duration before triggering new note
int duration = 50;

// This variable stores the point in time when the next note should be triggered
int trigger = millis();

float val;
float a;

float attackTime = 0.001;
float sustainTime = 0.04;
float sustainLevel = 0.3;
float releaseTime = 0.2;
float output;

float f;
float omega;
float phi;
float tx, ty;
float thresh;


PImage painting, sculpture, pottery, cursor1, cursor2;

boolean docClicked;
boolean isPrinting;
boolean paperPrinted;

PVector acc;
PVector printerPos;
PVector paperPos;

String[] words1 = {"Loki", "Grey", "Winter", "Solomon", "Shaw", "Aitne", "Morgan"};
String[] words2 = {"Fair", "Lovely", "Wait", "Horrid", "Void", "Longing"};
String[] words3 = {"Drown", "No", "Fall", "Peaceful", "Painful", "Quiet"};

String[] paintWords1 = {"Doyle", "Judas", "Vance", "Beatrice", "Hyperia", "Angelo"};
String[] paintWords2 = {"Red", "Traitor", "Synod", "Vandalised", "Letter"};
String[] paintWords3 = {"Betrayel", "Murder", "Incident", "Foreshadow", "Censor", "Purge"};

String[] sculpWords1 = {"Athena", "Amer", "Ahdia", "Memphis"};
String[] sculpWords2 = {"Golden", "Stun", "Solid", "Cold", "Strong"};
String[] sculpWords3 = {"Pride", "Scourge", "Midas", "Froze"};

String[] pottWords1 = {"Lucina", "Odhran", "Gift", "Eris"};
String[] pottWords2 = {"Greedy", "Gifted", "Sick", "Warded"};
String[] pottWords3 = {"Spun", "Spat", "Visions", "Dreamt"};

SoundFile print;

BubblesSystem bs;

class Artworks { //The following attributes will be inherited by all subclasses automatically at extension
  PImage artwork, artworkInspec, artworkOG;
  Boolean isHaunted;
  String exhibURL, inspecURL;
  int difficultyRating;
  String artProfile;
  String[] ovilusWords = new String[3];
  int ovilusCount1 = 0, ovilusCount2 = 0, ovilusCount3 = 0;
  int wordPhase = 0;

  Artworks(int hauntedRoll, String exhibURL, String inspecURL, String artProfile) {
    this.isHaunted = assignHaunted(hauntedRoll); //Line 30
    this.exhibURL = exhibURL;
    this.inspecURL = inspecURL;
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
    println(correctCount + "     " + falseCount);
  }

  boolean assignHaunted(int num) { //whether the artwork is haunted or not is randomized
    return (num==1);
  }

  void setupImage() {
    artwork = loadImage(exhibURL);
    artworkInspec = loadImage(inspecURL);
    artworkOG = loadImage(inspecURL);
  }

  void drawImage() { //contains access to the close inspection method which will be overridden per each artwork
    image(artwork, width/2, height/2);
  }


  void stageSwitch() {
    isPrinting = true;
    printTrigger = 0;
    //To Override
  }

  String[] wordGen(String [] words1, String[] words2, String[] words3, String[] badWords1, String[] badWords2, String[] badWords3) {
    String[] ovilusWords = new String[3];
    if (this.isHaunted) {
      ovilusWords[0] = badWords1[(int)random(0, badWords1.length)];
      ovilusWords[1] = badWords2[(int)random(0, badWords2.length)];
      ovilusWords[2] = badWords3[(int)random(0, badWords3.length)];
    } else {
      ovilusWords[0] = words1[(int)random(0, words1.length)];
      ovilusWords[1] = words2[(int)random(0, words2.length)];
      ovilusWords[2] = words3[(int)random(0, words3.length)];
    }

    return ovilusWords;
  }


  void inspecArt(PImage art) {

    flashlightInspec(art);

    navigation(new PVector(150, 700), "EXHIBITION", 3, #EAE295);
  }

  void flashlightInspec(PImage art) {
    loadPixels();
    art.loadPixels();
    for (int x = 0; x < width; x++) {
      for (int y = 0; y<height; y++) {
        int loc = x + y*art.width;

        float r = red(art.pixels[loc]);
        float g = green(art.pixels[loc]);
        float b = blue(art.pixels[loc]);

        float d = dist(x, y, mouseX, mouseY);
        float adjustBrightness = map(d, 20, 300, 2, 0);
        r *= adjustBrightness;
        g *= adjustBrightness;
        b *= adjustBrightness;
        color c = color(r, g, b);
        pixels[loc] = c;
      }
    }

    updatePixels();
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
    fill(#1F1D1C);
    textAlign(NORMAL);
    for (int i = 0; i < lines.length; i++) {
      text(lines[i], 20, 10+(i*15), width/2+7, height);
    }

    navigation(new PVector(800, 600), "OFFICE", 1, #EAE295);
    navigation(new PVector(800, 200), "PASS", 1, #02F54D);
    navigation(new PVector(800, 400), "DENY", 1, #F50202);
  }


  void ovilus() {

    textAlign(LEFT);

    if (mousePressed && dist(mouseX, mouseY, width*0.82, height*0.80) <= 600) {
 

      a = atan2(mouseY-height/2, mouseX-width/2);
      val = a;
      output = map(a, -PI, PI, 1, 0);

      if (round(val) == round(thresh)) {
        click.play();

        thresh = random(-3, 3);

        switch (wordPhase) {
        case 0:
          ovilusCount1++;
          if (ovilusCount1 >= ovilusWords[wordPhase].length())
            wordPhase++;
          break;
        case 1:
          ovilusCount2++;
          if (ovilusCount2 >= ovilusWords[wordPhase].length())
            wordPhase++;
          break;
        case 2:
          ovilusCount3++;
          if (ovilusCount3 >= ovilusWords[wordPhase].length())
            wordPhase++;
          break;
        }
      }


      if (millis() > trigger) {

        sine.play(midiToFreq(int(200*output)), 1);

        // The envelope gets triggered with the oscillator as input and the times and
        // levels we defined earlier
        env.play(sine, attackTime, sustainTime, sustainLevel, releaseTime);

        trigger = millis() + duration;
      }
    }

      pushMatrix();
      fill(255);

      scale(0.25);
      translate(2950, 690);
      for (int t = 0; t < 360*2; t++) {
        phi-=0.01;
        //  offset +  amplitude  * sin of omega * t(ime) + phi(phase)
        f = 180    +  val*80       * sin(radians(t*(omega/2)+phi));

        if (tx < (360*2)-1) {
          line(t, f, tx*val, ty*val);
          tx = t;
          ty = f;
        } else {
          tx = 0;
          ty = 0;
        }

        ellipse(t, f, 10, 10);
      }

      popMatrix();

      pushMatrix();
      translate(width*0.82, height*0.80);
      rotate(-HALF_PI);

      pushMatrix();

      rotate(val);
      fill(#AF7FAA);
      circle(0, 0, 130);
      fill(#392C37);
      rect(0, -5, 110, 10);
      popMatrix();

      popMatrix();

  
      fill(#746666);
      text("What is your name?", 110, 100);
      text("How are you?", 110, 300);
      text("Can you tell me how you passed?", 110, 500);
      
      textSize(50);
      fill(#3E3131);
      text(ovilusWords[0].substring(0, ovilusCount1), 110, 200);
      text(ovilusWords[1].substring(0, ovilusCount2), 110, 400);
      text(ovilusWords[2].substring(0, ovilusCount3), 110, 600);
    
  }
}

class Painting extends Artworks {
  Painting(int hauntedRoll, String exhibURL, String inspecURL, String artProfile) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile); //Line 11
    ovilusWords = wordGen(words1, words2, words3, paintWords1, paintWords2, paintWords3);
  }



  void inspecArt() {


    if (isHaunted && difficultyRating == 1) {
      for (int i = 0; i < 2; i++) {
        float[][] kernel =
          {{-1, -1, -1},
          {-1, 8-i, -1},
          {-1, -1, -1}, };

        for (int y = 1; y < artworkInspec.height-1; y++) {
          for (int x = 1; x <  artworkInspec.width-1; x++) {

            float sum1 = y;
            float sum2 = y;
            float sum3 = y;

            for (int ky = -1; ky <= 1; ky++) {
              for (int kx = -1; kx <= 1; kx++) {

                int pos = (y + ky)* artworkInspec.width + (x + kx);
                float val1 = hue(artworkInspec.pixels[pos]);
                float val2 = saturation( artworkInspec.pixels[pos]);
                float val3 = brightness( artworkInspec.pixels[pos]);

                sum1 += kernel[ky+1][kx+1] * val1;
                sum2 += kernel[ky+1][kx+1] * val2;
                sum3 += kernel[ky+1][kx+1] * val3;
              }
            }
            artworkInspec.pixels[y*artworkInspec.width + x] = color(sum1, sum2, sum3);
          }
        }
      }
      super.inspecArt(artworkInspec);
    } else {
      super.inspecArt(artworkInspec);
    }
  }
  void stageSwitch() {
    super.stageSwitch();
    artState = "sculpture";
  }
}

float redAdjust;
class Sculpture extends Artworks {
  Sculpture(int hauntedRoll, String exhibURL, String inspecURL, String artProfile) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile); //Line 11
    ovilusWords = wordGen(words1, words2, words3, sculpWords1, sculpWords2, sculpWords3);
  }
  void inspecArt() {
    super.inspecArt(artworkInspec);
  }

  @Override
    void flashlightInspec(PImage art) {

    if (isHaunted && difficultyRating == 1) {

      int s = second();
      loadPixels();
      if (s > random(40, 80)) redAdjust += 0.1;

      art.loadPixels();
      for (int x = 0; x < width; x++) {
        for (int y = 0; y<height; y++) {
          int loc = x + y*art.width;

          float r = red(art.pixels[loc]);
          float g = green(art.pixels[loc]);
          float b = blue(art.pixels[loc]);

          float d = dist(x, y, mouseX, mouseY);
          float adjustBrightness = map(d, 20, 300, 2, 0);
          r *= adjustBrightness + redAdjust;
          g *= adjustBrightness;
          b *= adjustBrightness;
          color c = color(r, g, b);
          pixels[loc] = c;
        }
      }

      updatePixels();
    } else {
      super.flashlightInspec(artworkInspec);
    }
  }
  void stageSwitch() {
    super.stageSwitch();
    artState = "pottery";
  }
}


class Pottery extends Artworks {

  Pottery(int hauntedRoll, String exhibURL, String inspecURL, String artProfile) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile); //Line 11
  }

  void inspecArt() {

    if (isHaunted && difficultyRating == 1) {


      loadPixels();
      artworkInspec.loadPixels();


      int factor1 = int(random(1, 10));
      int factor2 = int(random(1, 10));
      int factor3 = int(random(1, 10));
      int factor4 = int(random(50, 100));

      for (int i=0; i<artworkInspec.pixels.length; i++) {
        if (i % factor1 == 0) {
          artworkInspec.pixels[i] = color(factor1, factor2, factor3, factor4 );
        } else if (i % factor2 == 0) {
          artworkInspec.pixels[i] = color(factor1, factor2, factor3, factor4 );
        } else if (i % factor3 == 0) {
          artworkInspec.pixels[i] = color(factor1, factor2, factor3, factor4 );
        } else {
          artworkInspec.pixels[i] = artworkOG.pixels[i];
        }
      }

      int index1 = int(random(50, artworkInspec.pixels.length));
      int index2 = int(random(50, artworkInspec.pixels.length));
      artworkInspec.pixels[index1] = artworkInspec.pixels[index2];


      artworkInspec.updatePixels();

      super.inspecArt(artworkInspec);
    } else {
      super.inspecArt(artworkInspec);
    }
  }


  @Override
    void stageSwitch() {
    resetTextCounter();
    resetimgCounter();
    gameState = 5;
  }
}

// This helper function calculates the respective frequency of a MIDI note
float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0))) * 440; //the higher the value, the higher the note
}
