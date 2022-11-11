String artState = "painting";
String location = "";
PImage office, ovilus;

void gameStateManager(int gameState) {
  switch(gameState) {
  case 0:
    exhibitionRoom();
    break;
  case 1:
    office();
    break;
  case 2:
    ovilus();
    break;
  }

  transition();
}

void exhibitionRoom() {
  if (artState == "painting") {
    paintObj.drawImage();
  }
}

void office() {
  image(office, width/2, height/2);
}

void ovilus() {
  image(ovilus, width/2, height/2);
}
