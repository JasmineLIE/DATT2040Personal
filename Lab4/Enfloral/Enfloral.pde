/*
* Enfloral: An urban antasy, mystery game.
 * jazz music: https://www.youtube.com/watch?v=BZm_U5YVwVY
 * @author Jasmine Ly
 */
import processing.sound.*;
SoundFile bgMusic;
String gameMode = "menu";
UI ui;

Buttons buttonStart, buttonClock, buttonLobby, buttonLounge, buttonTank;

Mover [] mover;
int numMovers = 10;
Attractor a;
Magnet m;

void setup() {
  mover = new Mover[numMovers];
  for (int i = 0; i < numMovers; i++) {
    mover[i] = new Mover();
  }
  a = new Attractor();
  m = new Magnet();
  textSize(16);
  size (900, 600); 
  buttonStart = new Buttons(new PVector(100, 100), 100, "start");
  buttonClock = new Buttons(new PVector(700, 300), 100, "clockRoom");
  buttonLobby = new Buttons(new PVector(width/2, height/2), 100, "lobby");
  buttonLounge = new Buttons(new PVector(400, 400), 100, "lounge");
  buttonTank = new Buttons (new PVector (200, 200), 100, "tank");
  ui = new UI();
  bgMusic = new SoundFile(this, "jazz.wav");
  bgMusic.loop();
}

void draw() {
  background(255);


  if (gameMode == "menu") {
    buttonStart.run();
  } else if (gameMode == "start") {
    background(0);
    String s = "gaaaaah there is a MURDER.  You are a DETECTIVE.";
    text(s, 40, 40, 280, 320);
    buttonLobby.run();
  } else if (gameMode == "clockRoom") {
    clockRoom();
    buttonLounge.run();
  } else if (gameMode == "lobby") {
    background(0);
    text("LOBBY ROOM", 40, 40, 280, 320);
    buttonLounge.run();
  } else if (gameMode == "lounge") {
    background(0);
    text("LOUNGE", 40, 40, 280, 320);
    buttonClock.run();
    buttonTank.run();
  } else if (gameMode == "tank") {
    background(0);
      for (Mover m : mover) {
    m.run(); 
    PVector f = a.attract(m);
    m.applyForce(f);
  }
    text("IMAGINE", 40, 40, 280, 320);


    a.run();
    m.run();
    buttonLounge.run();
  }


  if (gameMode != "start" && gameMode != "menu") {
    ui.run();
  }
}
