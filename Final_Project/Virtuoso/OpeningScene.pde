String s = "Click Anywhere To Continue.";
String dialogue = "I can't shake off the feeling that something is wrong.";
int counter = 0;
boolean isPressed = true;
int introState = 0;
void openingScene() {

  switch (introState) {
  case 0:
    openingText();
    break;
  case 1:
    openingSlides();
    break;
  case 2:
    gameStateManager();
    break;
  }
}
void typeWriter(String script, int speed) {
  textSize(40);
  fill(#EAE295);
  text(script.substring(0, counter), width/2, height/2);
  if (counter < script.length() && isPressed) {
    if (frameCount%speed==0)
      click.play();
    counter++;
  } else {
    isPressed = false;
  }
}
void openingText() {

  typeWriter(dialogue, 5);
  textSize(30);
  fill(#9D9D9D);
  text(s, width/2, 100);
  if (mousePressed && !isPressed) {
    isPressed = true;
    introState = 1;
    counter = 0;
  }
}


void openingSlides() {
  textSize(30);
  fill(#9D9D9D);
  text(s, width/2, 100);
  
}
