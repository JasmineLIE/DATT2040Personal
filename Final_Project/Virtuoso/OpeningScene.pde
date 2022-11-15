String s = "Click Anywhere To Continue.";
String dialogue = "I can't shake off the feeling that something is wrong.";

int introState = 0;
PImage[] opImages;
int imgCount = 0;
String [] opDialogue = {
  "My exhibits shows soon at the Yggrasil Gallery. This was my dream, but all I feel is dread.",
  "Not after what Director Gray said.  About the haunted curse of the museum. The thing that lurks in the art.",
  "That it strikes disaster for every new curator. The worse part; I'm giving it a chance that it's real.",
  "...But I guess it's better safe than sorry."
};

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

void openingText() {

  typeWriter(dialogue, 5, #EAE295, 40, new PVector(width/2, height/2));
  textSize(30);
  fill(#9D9D9D);
  text(s, width/2, 50);
  if (mousePressed && !isPressed) { //reset these variables to be used in the next scene
    isPressed = true;
    introState = 1;
    counter = 0;
  }
}


void openingSlides() {
  image(opImages[imgCount], width/2, height/2);
  typeWriter(opDialogue[imgCount], 5, #EAE295, 25, new PVector(width/2, 750));
  textSize(30);
  fill(#9D9D9D);
  text(s, width/2, 50);
}

void mouseClicked() {
  if (introState == 1 && imgCount < 3 && !isPressed) {
    isPressed = true;
    counter = 0;
    imgCount++;
  } else if (imgCount == 3) {
    introState = 2;
  }
}
