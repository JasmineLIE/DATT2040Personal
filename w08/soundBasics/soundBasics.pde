import processing.sound.*;
//sound has specific properties, have to be careful not to repeatedly trigger the sound, like if it tries to start the sound every frame
//to amend this, use trigger created by millis() and set conditions
void setup() {
  Sound s = new Sound(this); 
  print(Sound.list());
}  
