import processing.sound.*;

Painting paintObj;
Sculpture sculpObj;
Pottery pottObj;
PFont mono;

void setup() {
  noSmooth();
  imageMode(CENTER);
  size(1000, 800);
  mono=createFont("jupiterc.ttf", 24);
  textAlign(CENTER, CENTER);
  textFont(mono);
  paintObj = new Painting((int)random(2), "img/exhibit1.png", "img/exhibit1Inspec.png", "txt/painting.txt", "img/cursed1.png");
  sculpObj = new Sculpture( (int)random(2), "img/exhibit2.png", "img/exhibit2.png", "txt/sculpture.txt", "img/cursed.png");
  pottObj = new Pottery((int)random(2), "img/exhibit3.png", "img/exhibit3.png", "txt/pottery.txt", "img/cursed.ong");

  office = loadImage("img/officeDesk.png");
  ovilus = loadImage("img/ovilus.png");
  titleScreen = loadImage("img/openingScreen.png");
  button = loadImage("img/button.png");
  printer = loadImage("img/printer.png");
  
  opImages = new PImage[4];
  for (int i = 0; i < 4; i++) {
     String fileName = "img/op/op" + i + ".png";
     opImages[i] = loadImage(fileName);
  }
  
  openingSong = new SoundFile(this, "music/TheVirtuoso.mp3");
  click = new SoundFile(this, "music/click.wav");

  stepx = width/col; //for grid shaping
  stepy = height/row; //for grid shaping
}

void draw() {
background(0);
openingScene();
}
