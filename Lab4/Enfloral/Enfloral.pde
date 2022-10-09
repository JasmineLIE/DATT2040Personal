/*
* Enfloral: An urban antasy, mystery game.
 * jazz music: https://www.youtube.com/watch?v=BZm_U5YVwVY
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
Attractor a;

PImage boxUI, menu, button, start, lobby, sf1, sf2, door, l1, l2, lounge, tank, clock;
SoundFile bgMusic;

void setup() {
  size (900, 600); 

  boxUI = loadImage("UIBox.png");
  menu = loadImage("menuScreen.png");
  button = loadImage("button.png");
  start = loadImage("start.png");
  lobby = loadImage("lobby.png");
  sf1 = loadImage("sf1.png");
  sf2 = loadImage("sf2.png");
  door = loadImage("door.png");
  l1 = loadImage("l1.png");
  l2 = loadImage("l2.png");
  lounge = loadImage("lounge.png");
  tank = loadImage("tank.png");
  clock = loadImage("clock.png");

  mover = new Mover[numMovers];
  for (int i = 0; i < numMovers; i++) {
    mover[i] = new Mover();
  }
  a = new Attractor();
  textSize(16);

  buttonStart = new Buttons(new PVector(100, 500), 100, "Start!");
  buttonClock = new Buttons(new PVector(300, 100), 100, "Clock");
  buttonLobby = new Buttons(new PVector(700, 100), 100, "Lobby");
  buttonLounge = new Buttons(new PVector(800, 350), 100, "Lounge");
  buttonTank = new Buttons (new PVector (150, 200), 100, "Tank");
  buttonDoor = new Buttons(new PVector (600, 125), 100, "Door");

  sf = new Sunflower();
  lob = new Lobelia();
  ui = new UI();
  bgMusic = new SoundFile(this, "jazz.wav");
  bgMusic.loop();
}

void draw() {


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
}
