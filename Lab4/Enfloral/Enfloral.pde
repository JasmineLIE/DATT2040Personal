/*
* Enfloral: An urban fantasy, mystery game where you looking around the club, Enflora, to gain access into the recently missing Mr. Daisy's study for clues.
 * jazz music: https://www.youtube.com/watch?v=BZm_U5YVwVY
 * Guide for the puzzles: Click dotted tip of clock arm > use the magnet to fish out the sunflower pin from the bug tank > take the pin to the sunflower bartender > use the key on the locked door in the lobby
 * @author Jasmine Ly
 */
import processing.sound.*;

String gameMode = "menu";

UI ui;

Buttons buttonStart, buttonClock, buttonLobby, buttonLounge, buttonTank, buttonDoor;

Sunflower sf;
Lobelia lob;

Mover [] mover;
int numMovers = 10;
int alphaDecrement = 255;
int alphaIncrement = 0;
Attractor a;

PImage boxUI, menu, button, start, lobby, sf1, sf2, door, l1, l2, lounge, tank, clock, doorKey, magnet, flowerPin, endScene;
SoundFile bgMusic, doorOpen;

void setup() {
  size (900, 600); 
  //---Initializing images---
  boxUI = loadImage("img/UIBox.png");
  menu = loadImage("img/menuScreen.png");
  button = loadImage("img/button.png");
  start = loadImage("img/start.png");
  lobby = loadImage("img/lobby.png");
  sf1 = loadImage("img/sf1.png");
  sf2 = loadImage("img/sf2.png");
  door = loadImage("img/door.png");
  l1 = loadImage("img/l1.png");
  l2 = loadImage("img/l2.png");
  lounge = loadImage("img/lounge.png");
  tank = loadImage("img/tank.png");
  clock = loadImage("img/clock.png");
  doorKey = loadImage("img/key.png");
  magnet = loadImage("img/magnet.png");
  flowerPin = loadImage("img/sunflowerPin.png");
  endScene = loadImage("img/endScene.png");
  //-----

  //---Initlializing movers class; they are the bugs in the tank

  mover = new Mover[numMovers];
  for (int i = 0; i < numMovers; i++) {
    mover[i] = new Mover();
  }

  //-----

  a = new Attractor(); //Initliazing key in tank

  textSize(16);

  //----initializing buttons around the game----
  buttonStart = new Buttons(new PVector(100, 500), 100, "Start!");
  buttonClock = new Buttons(new PVector(300, 100), 100, "Clock");
  buttonLobby = new Buttons(new PVector(700, 100), 100, "Lobby");
  buttonLounge = new Buttons(new PVector(800, 350), 100, "Lounge");
  buttonTank = new Buttons (new PVector (150, 200), 100, "Tank");
  buttonDoor = new Buttons(new PVector (600, 125), 100, "Door");

  //-----

  
  sf = new Sunflower(); //for Sunflower bartender animations and dialogue pop up
  lob = new Lobelia(); //for Lobelia animations and dialogue pop up
  ui = new UI(); //UI initialization

  //initializing sound
  bgMusic = new SoundFile(this, "audio/jazz.wav");
  bgMusic.loop();
  doorOpen = new SoundFile(this, "audio/doorOpen.wav");
  //-----
}

void draw() {
  background(0); 

  //---Keeping track of game modes organizes which clases & functions are used ---

  if (gameMode == "menu") {
    image(menu, 0, 0);

    buttonStart.run();
  } else if (gameMode == "Start!") {
    image(start, 0, 0);

    buttonLobby.run();
  } else if (gameMode == "Clock") {
    image(clock, 0, 0);
    clockRoom();

    buttonLounge.run();
  } else if (gameMode == "Lobby") {
    image(lobby, 0, 0);

    ui.setDesc("");
    buttonDoor.run();
    buttonLounge.run();
    sf.drawSF();
  } else if (gameMode == "Lounge") {
    image(lounge, 0, 0);
    lob.drawL();
    ui.setDesc("");
    buttonLobby.run();
    buttonClock.run();
    buttonTank.run();
    ui.setDesc("There's Lobelia...  Fairly relaxed for a prime suspect.");
  } else if (gameMode == "Tank") {
    image(tank, 0, 0);
    for (Mover m : mover) {
      m.run(); 
      PVector f = a.attract(m);
      m.applyForce(f);
    }

    a.run();
    buttonLounge.run();
  } else if (gameMode == "Door") {
    image(door, 0, 0);

    ui.setDesc("Locked tight.");
    buttonLobby.run();
  }

  if (gameMode != "Start!" && gameMode != "menu") {
    ui.run();
  }

  //-----

  //---Game mode finale with a fade in and out effect using
  if (gameMode == "End") {

    tint(255, alphaDecrement); //induce fadeout effect
    alphaDecrement-=5;  

    ui.setDesc("");
    bgMusic.stop();
    if (alphaDecrement <0) {
      alphaIncrement+=5;
      tint(255, alphaIncrement);
      image(endScene, 0, 0);
    }
  }

  //-----
}
