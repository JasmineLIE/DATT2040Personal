int correctCount; //Counts player correct guesses
int falseCount; //Counts player incorrect guesses
int printTrigger; //to manage when to fire the printer sounds without glitchy overlap

// duration before triggering new note
int duration = 50;

// This variable stores the point in time when the next note should be triggered
int trigger = millis();

//For retrieving values from interactable atan knob
float val;
float a;

//Variables for soundwaves
float attackTime = 0.001;
float sustainTime = 0.04;
float sustainLevel = 0.3;
float releaseTime = 0.2;
float output;

//Variables to construct Sine Waves
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

//---String arrays to contain words fed into the Ovilus---
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
//-----

SoundFile print; //for printer sounds

BubblesSystem bs; //for printer sfx

/**
 * This class defines an Artwork object.
 */
class Artworks {
  PImage artwork, artworkInspec, artworkOG;
  Boolean isHaunted;
  String exhibURL, inspecURL;
  int difficultyRating;
  String artProfile;
  String[] ovilusWords = new String[3];
  int ovilusCount1 = 0, ovilusCount2 = 0, ovilusCount3 = 0;
  int wordPhase = 0;

  /**
   * This constructor makes the artwork
   * @param  hauntedRoll is an integer that determines whether the artwork is haunted or not.  It is sent as a parameter to the function assignHaunted, which returns a boolean value
   * @param  exhibURL is a String that contains the img address for the artwork to be viewed in the Exhibition Room
   * @param  inspecURL is a String that contains the img address for the artwork to be viewed through Inspection
   * @param  artProfile  is a String that contains the address for the txt file that will be read by the methods and displayed on the document in the Office
   */
  Artworks(int hauntedRoll, String exhibURL, String inspecURL, String artProfile) {
    this.isHaunted = assignHaunted(hauntedRoll);
    this.exhibURL = exhibURL;
    this.inspecURL = inspecURL;
    this.difficultyRating = (int)random(2); //1=Artwork will have visual hauntedness, 2==no visual hauntedness.  Ovilus is not affected
    this.artProfile = artProfile;
    setupImage(); //Perform image setup all in constructor
  }

  /**
   * This method tallies correctness/incorrectness for the Player's descision on whether an artwork should be denied/passed and if the painting was haunted or not
   * @param  answer is a boolean variable the player passes through when they choose either PASS or DENY for an artwork
   */
  void verification(boolean answer) { //User's stamp of approval/disapproval is passed through this function as a boolean variable, which increments the incorrect or correct values
    //true = "PASS"
    //false = "PROHIBIT"
    if (answer && !this.isHaunted || !answer && this.isHaunted) { //if the artwork is passed AND it wasn't haunted, OR if the artwork was denied AND the painting was haunted
      correctCount++;
    } else {
      falseCount++;
    }
    stageSwitch(); //Call the stageSwitch function to change to proceed to the next artwork

    println(correctCount + "     " + falseCount); //debug
  }

  /**
   * This method returns a value that determines if the artwork is haunted
   * @param  num is an integer value
   * @return  a boolean variable.  True (Haunted) if the number as 1, false (Not Haunted) if anything else
   */
  boolean assignHaunted(int num) { //whether the artwork is haunted or not is randomized
    return (num==1);
  }

  /**
   * This method loads the images in the setup() associated with each artwork
   */
  void setupImage() {
    artwork = loadImage(exhibURL);
    artworkInspec = loadImage(inspecURL);
    artworkOG = loadImage(inspecURL);
  }

  /**
   * This method draws the image of the artwork when viewed at the Exhibit Room
   */
  void drawImage() {
    image(artwork, width/2, height/2);
  }

  /**
   * This method is meant to be overridden to receive more functioanlity, and to differ between what artworks transition into what.  Asides from that, it resets the variables which trigger the printing animation again
   */
  void stageSwitch() {
    isPrinting = true;
    printTrigger = 0;
    //To Override
  }

  /**
   * This method randomly selects three words depending on if the artwork is haunted or not and stores them into the ovilusWords String array
   * @param  words1 is a String array containing
   * @param  words2 is a String array containing condition words
   * @param  words3 is a String array containing words related to passing
   * @param  badWords1 is a String array containing for haunted artworks
   * @param  badWords2 is a String array containing condition words for haunted artworks
   * @param  badWords3 is a String array containing words related to passing for haunted artworks
   * @return  ovilusWord is returned, which is a String array containing the randomized words
   */
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

  /**
   * This method passes an image to invoke another method which draws the image and manipulates its pixels.  This method also draws a button which will take the player back to the Exhibition Room
   * @param  art is an Image containing the zoomed in image of an artwork for inspection
   */
  void inspecArt(PImage art) {
    flashlightInspec(art);
    navigation(new PVector(150, 700), "EXHIBITION", 3, #EAE295);
  }

  /**
   * This method manipulates pixels of an image to create a flashlight effect
   * @param  art is an Image containing the zoomed in image of an artwork for inspection
   */
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

  /**
   * This method animates the printer at the start
   */
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
      if (printerPos.x>(480) ) { //creates jiggling animation; if hits one boundary, reverse the acceleration
        ;
        acc.x*=-1;
      }
      if (printerPos.x < (470)) {
        acc.x*=-1;
      }
      printerPos.add(acc); //apply the acceleration to the printer position to move it

      if (paperPos.y == 500) isPrinting = false; //when the paper reaches a certain destination, the printer stops moving and running the BubbleSystem
      paperPrinted = true;
    } else {
      print.stop(); //stop printing sounds

      if (dist(mouseX, mouseY, paperPos.x, paperPos.y) <= 180 && !docClicked && paperPrinted) { //change the look of the cursor from feather to magnifrying glass when hovering over the paper
        cursorInspec = true;
        if (mousePressed) {
          docClicked = true;
        }
      } else {
        cursorInspec = false;
      }
    }

    rectMode(NORMAL);
    if (docClicked) { //when the player clicks the paper, it opens up the text associated with the artwork, and the buttons that decide whether to PASS or DENY the artwork
      image(paper, width/2, height/2);
      loadDocument();
    }
  }

  /**
   * This method loads the txtfile of the artwork to be displayed to the viewer, as well as provide the buttons to PASS/DENY the artwork or return to the previous screen
   */
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

  /**
   * This method draws the Sine Wave, atan knob, and text for the Ovilus scene.  Here, the players can reveal each word that was generated by the wordGen function by matching the knob value with randomly generated target
   */
  void ovilus() {

    textAlign(LEFT);

    if (mousePressed && dist(mouseX, mouseY, width*0.82, height*0.80) <= 600) {

      a = atan2(mouseY-height/2, mouseX-width/2);
      val = a;
      output = map(a, -PI, PI, 1, 0);

      if (round(val) == round(thresh)) { //A thresh is randomly generated at the start of the game.
        //This acts as the target value.  If the player matches the value provided by turning the atan knob with the target, they earn a letter

        click.play();

        thresh = random(-3, 3); //once the target is hit, generate a new one

        switch (wordPhase) { //ensures all the words are written down from up-to-down basis
        case 0:
          ovilusCount1++;
          if (ovilusCount1 == ovilusWords[wordPhase].length())
            wordPhase++;
          break;
        case 1:
          ovilusCount2++;
          if (ovilusCount2 == ovilusWords[wordPhase].length())
            wordPhase++;
          break;
        case 2:
          ovilusCount3++;
          if (ovilusCount3 == ovilusWords[wordPhase].length())
            wordPhase++;
          break;
        }
      }


      if (millis() > trigger) {

        sine.play(midiToFreq(int(200*output)), 1); //Uses Since and Env to generate sounds based on the value given by turning the atan knob

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
      f = 180    +  val*80       * sin(radians(t*(omega/2)+phi)); //sine wave is affected by the value of the atan knob to reflect player impact

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
    //substring so the words are drawn out letter at a time, the player unlocks each letter
    text(ovilusWords[0].substring(0, ovilusCount1), 110, 200);
    text(ovilusWords[1].substring(0, ovilusCount2), 110, 400);
    text(ovilusWords[2].substring(0, ovilusCount3), 110, 600);
  }
}

/**
 * This class is a child of the Artwork class
 */
class Painting extends Artworks {
  /**
   * This is the constructor that generates a Painting object
   */
  Painting(int hauntedRoll, String exhibURL, String inspecURL, String artProfile) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile); 
    ovilusWords = wordGen(words1, words2, words3, paintWords1, paintWords2, paintWords3);
  }

  /**
   * This method manipulates the kernals of the Painting inspection image, then passes it to the inspecArt function to further add a flashlight effect
   */

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

  /**
   * This method adds to the stageSwitch() method, changing the artState as well to move on to the next artwork
   */
  void stageSwitch() {
    super.stageSwitch();
    artState = "sculpture";
  }
}

float redAdjust;

/**
 * This class is the child of Artworks
 */
class Sculpture extends Artworks {
  /**
   * This is the constructor that generates a Sculpture object
   */
  Sculpture(int hauntedRoll, String exhibURL, String inspecURL, String artProfile) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile); 
    ovilusWords = wordGen(words1, words2, words3, sculpWords1, sculpWords2, sculpWords3);
  }

  /**
   * This method calls the inspecArt method that takes in an image to the parameter
   */
  void inspecArt() {
    super.inspecArt(artworkInspec);
  }

  /**
   * This method overrides flashlightInspec method.  While mostly the same, a new feature to intensify the red pixels after a randomly generated certain amount of time has been implemented
   */
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

  /**
   * Overrides the stageSwitch() function to additionally change the arState to pottery
   */
  void stageSwitch() {
    super.stageSwitch();
    artState = "pottery";
  }
}

/**
 * This class is a child of the Artwork class
 */
class Pottery extends Artworks {
  /**
   * This constructor makes a Pottery object
   */
  Pottery(int hauntedRoll, String exhibURL, String inspecURL, String artProfile) {
    super(hauntedRoll, exhibURL, inspecURL, artProfile); 
    ovilusWords = wordGen(words1, words2, words3, pottWords1, pottWords2, pottWords3);
  }

  /**
   * This method manipulates the pixels of the artworkInspec image before passing it through the inspecArt method
   */
  void inspecArt() {

    if (isHaunted && difficultyRating == 1) { //randomly generates four values that determine R,G,B,A, creating a mishmash image of distortion

      loadPixels();
      artworkInspec.loadPixels();

      int factor1 = int(random(1, 10));
      int factor2 = int(random(1, 10));
      int factor3 = int(random(1, 10));
      int factor4 = int(random(50, 100));

      for (int i=0; i<artworkInspec.pixels.length; i++) {//Then, through a forloop that runs through every pixel, depending on what number pixel it is, apply the pixel manipulation differently
        if (i % factor1 == 0) {
          artworkInspec.pixels[i] = color(factor1, factor2, factor3, factor4 );
        } else if (i % factor2 == 0) {
          artworkInspec.pixels[i] = color(factor1, factor2, factor3, factor4 );
        } else if (i % factor3 == 0) {
          artworkInspec.pixels[i] = color(factor1, factor2, factor3, factor4 );
        } else {
          artworkInspec.pixels[i] = artworkOG.pixels[i]; //A copy of the original image is saved into another PImage, which is free from manipulation, and is taken from to apply to artworkInspec
        }
      }

      //swap the positions of two pixels
      int index1 = int(random(50, artworkInspec.pixels.length));
      int index2 = int(random(50, artworkInspec.pixels.length));
      artworkInspec.pixels[index1] = artworkInspec.pixels[index2];

      artworkInspec.updatePixels();

      super.inspecArt(artworkInspec);
    } else {
      super.inspecArt(artworkInspec);
    }
  }

  /**
   * This method overrides the stageSwitch() method by resetting the text counter, img counter, and moving onto the final stage of the game
   */
  @Override
    void stageSwitch() {
    resetTextCounter();
    resetimgCounter();
    gameState = 5;
  }
}

/**
 * This helper function calculates the respective frequency of a MIDI note
 */
float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0))) * 440; //the higher the value, the higher the note
}
