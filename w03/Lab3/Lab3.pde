/* Practice drawing moving shapes using wave logic
* @author Jasmine Ly
* Switch between the different parts of the sketch using the numbered keys.
*/
  int m = second(); //seconds begin counting as soon as the sketch runs
float angle = 0;
float angleV = 0.1;
String displayMode = "";
void setup() {
  size(800, 800); 
  ellipseMode(CENTER);
  background(0);

}

void draw() {
  fill(0, 30); //Fill for Rect
  rect(0, 0, width, height);
 
  if (displayMode == "ONE") {
    circlePulse();
  } else if (displayMode == "TWO") {
   mapSinY(); 
  } else if (displayMode == "THREE") {
   wavesHack(); 
  }
}
void keyPressed() {
  if (key == '1') {
  displayMode = "ONE";
  } else if (key == '2') {
   displayMode = "TWO"; 
  } else if (key == '3') {
   displayMode = "THREE"; 
  }
}
