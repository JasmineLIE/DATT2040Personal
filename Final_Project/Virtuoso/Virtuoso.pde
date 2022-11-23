import processing.sound.*;

Painting paintObj;
Sculpture sculpObj;
Pottery pottObj;
PFont mono;
boolean cursorInspec = false;

void setup() {
  noCursor();
  noSmooth();
  imageMode(CENTER);
  size(1000, 800, P2D);

  mono=createFont("jupiterc.ttf", 24);
  textAlign(CENTER, CENTER);
  textFont(mono);

  reset(); //for replayability!

  office = loadImage("img/officeDesk.png");
  ovilus = loadImage("img/ovilus.png");
  titleScreen = loadImage("img/openingScreen.png");
  button = loadImage("img/button.png");
  printer = loadImage("img/printer.png");
  paper = loadImage("img/deskZoom.png");
  cursor1 = loadImage("img/cursorDefault.png");
  cursor2 = loadImage("img/cursorPrompt.png");

  bs = new BubblesSystem(new PVector(475, 325));

  opImages = new PImage[4];
  for (int i = 0; i < 4; i++) {
    String fileName = "img/op/op" + i + ".png";
    opImages[i] = loadImage(fileName);
  }

  edImages = new PImage[5];
  for (int i = 0; i < 5; i++) {
    String fileName = "img/ed/ed"+i+".png";
    edImages[i] = loadImage(fileName);
  }
  openingSong = new SoundFile(this, "music/TheVirtuoso.mp3");
  click = new SoundFile(this, "music/click.wav");
  print = new SoundFile(this, "music/printing.wav");

  stepx = width/col; //for grid shaping
  stepy = height/row; //for grid shaping
}

void draw() {
  background(0);
  openingScene();
  if (!cursorInspec) {
    image(cursor1, mouseX, mouseY);
  } else {
    image(cursor2, mouseX, mouseY);
  }
}
