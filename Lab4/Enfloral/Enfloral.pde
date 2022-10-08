/*
* Enfloral: An urban antasy, mystery game.
 * jazz music: https://www.youtube.com/watch?v=BZm_U5YVwVY
 * @author Jasmine Ly
 */
import processing.sound.*;

String gameMode = "menu";
UI ui;

Buttons buttonStart, buttonClock, buttonLobby, buttonLounge, buttonTank, buttonDoor;

Mover [] mover;
int numMovers = 10;
Attractor a;

void setup() {
  size (900, 600); 
  

  boxUI = loadImage("UIBox.png");
  menu = loadImage("menuScreen.png");
  button = loadImage("button.png");
  start = loadImage("start.png");
  mover = new Mover[numMovers];
  for (int i = 0; i < numMovers; i++) {
    mover[i] = new Mover();
  }
  a = new Attractor();
  textSize(16);

  buttonStart = new Buttons(new PVector(100, 500), 100, "Start!");
  buttonClock = new Buttons(new PVector(400, 300), 100, "Clock");
  buttonLobby = new Buttons(new PVector(700, 100), 100, "Lobby");
  buttonLounge = new Buttons(new PVector(700,300), 100, "Lounge");
  buttonTank = new Buttons (new PVector (150, 200), 100, "Tank");
  buttonDoor = new Buttons(new PVector (450, 200), 100, "Door");

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
    clockRoom();
    buttonLounge.run();
  } else if (gameMode == "Lobby") {
    background(0);

    buttonDoor.run();
    buttonLounge.run();
  } else if (gameMode == "Lounge") {
    background(0);
    ui.setDesc("");
    text("LOUNGE", 40, 40, 280, 320);
    buttonLobby.run();
    buttonClock.run();
    buttonTank.run();
  } else if (gameMode == "Tank") {
    background(0);
    for (Mover m : mover) {
      m.run(); 
      PVector f = a.attract(m);
      m.applyForce(f);
    }
    text("IMAGINE", 40, 40, 280, 320);

    a.run();
    buttonLounge.run();
  } else if (gameMode == "Door") {
    background(0);
    buttonLobby.run();
  }


  if (gameMode != "Start!" && gameMode != "menu") {
    ui.run();
  }
}
