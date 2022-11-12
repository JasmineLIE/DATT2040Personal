String text1 = "Hello, Make this a typewriter.";

PFont font;
int counter = 0;
boolean isPressed = false;

void setup() {
  background(150);
  size(400, 400);
  //frameRate(20);
  smooth();
  font = createFont("Arial", 48);
  textFont(font, 20);
}

void draw() {

  background(150);
  fill(255);a
  if (counter < text1.length()) {

  text(text1.substring(0, counter), 0, 40, width, height);
  counter++;
  text(text1.substring(0, counter), 0, 40, width-20, height);
 if (counter < text1.length() && isPressed) {
    if (frameCount%4==0) //this will adjust speed of counter
    counter++;
  }
  
}

void mousePressed() {

}

void mouseReleased() {
  isPressed= false;
}
