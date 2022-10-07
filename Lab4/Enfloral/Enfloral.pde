/*
* Enfloral: An urban antasy, mystery game.
 * jazz music: https://www.youtube.com/watch?v=BZm_U5YVwVY
 * @author Jasmine Ly
 */
import processing.sound.*;
SoundFile bgMusic;
String gameMode = "menu";
UI ui;

Buttons buttonStart, buttonClock;


void setup() {
  size (900, 600); 
  buttonStart = new Buttons(new PVector(width/2, height/2), 100, "start");
  buttonClock = new Buttons(new PVector(700, 300), 100, "clockRoom");
  ui = new UI();
  bgMusic = new SoundFile(this, "jazz.wav");
  bgMusic.loop();
}

void draw() {
  background(255);
  
  if (gameMode == "menu") {
    buttonStart.run();
  }
  else if (gameMode == "start") {
    background(0);
    String s = "gaaaaah there is a MURDER.  You are a DETECTIVE.";
    fill(255);
    text(s, 40, 40, 280, 320);
    buttonClock.run();
  } else if (gameMode == "clockRoom") {
    
    clockRoom();
  }


  if (gameMode != "start" && gameMode != "menu") {
    ui.run();
  }
}
