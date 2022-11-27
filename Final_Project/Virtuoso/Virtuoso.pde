import processing.sound.*;
//---Sound, Object, Font and Boolean Initialization--
SinOsc sine;
Env env;

Painting paintObj;
Sculpture sculpObj;
Pottery pottObj;
PFont mono;
boolean cursorInspec = false;

//-----

void setup() {

  // Create triangle wave and start it
  sine = new SinOsc(this);

  // Create the envelope
  env = new Env(this);

  noCursor();
  noSmooth();
  imageMode(CENTER);
  size(1000, 800, P2D); //P2D compresses assets, maximizes performance

  mono=createFont("jupiterc.ttf", 24);
  textAlign(CENTER, CENTER);
  textFont(mono);

  reset(); //for replayability -- when called, this will reset all global variables and restarts the game within the program!

  //---Initializaing Images---
  office = loadImage("img/officeDesk.png");
  ovilus = loadImage("img/ovilus.png");
  titleScreen = loadImage("img/openingScreen.png");
  button = loadImage("img/button.png");
  printer = loadImage("img/printer.png");
  paper = loadImage("img/deskZoom.png");
  cursor1 = loadImage("img/cursorDefault.png");
  cursor2 = loadImage("img/cursorPrompt.png");
  aboutScreen = loadImage("img/aboutScreen.png");
  //-----

  bs = new BubblesSystem(new PVector(475, 325)); //Set up BubbleSystem class that only runs during a certain scene

  //---Initializaing Images---
  opImages = new PImage[4];
  for (int i = 0; i < 4; i++) {
    String fileName = "img/op/op" + i + ".png";
    opImages[i] = loadImage(fileName);
  }
  //-----
  //---Initializing Images---
  edImages = new PImage[5];
  for (int i = 0; i < 5; i++) {
    String fileName = "img/ed/ed"+i+".png";
    edImages[i] = loadImage(fileName);
  }
  //-----

  //---Initializing Sounds---
  openingSong = new SoundFile(this, "music/TheVirtuoso.mp3");
  click = new SoundFile(this, "music/click.wav");
  print = new SoundFile(this, "music/printing.wav");
  //-----

  stepx = width/col; //for grid shaping
  stepy = height/row; //for grid shaping
}

void draw() {
  background(0);
  openingScene(); //run only the opening scene, through this method, the game will flow
  if (!cursorInspec) { //When prompted, the cursor image will change to alert player of interactable objects
    image(cursor1, mouseX, mouseY);
  } else {
    image(cursor2, mouseX, mouseY);
  }
}
