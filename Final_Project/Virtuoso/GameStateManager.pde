String artState = "painting";
PImage office, ovilus, titleScreen, button;
SoundFile openingSong, click;
int trigger = second();
int gameState = 0;
void gameStateManager() {
  switch(gameState) {
  case 0:
    titleScreen();
    break;
  case 1:
    office();
    transition();
    break;
  case 2:
    ovilus();
    transition();
    break;
  }
}

void exhibitionRoom() {
  if (artState == "painting") {
    paintObj.drawImage();
  }
  if (artState == "sculpture") {
    paintObj.drawImage();
  }
  if (artState == "pottery") {
    sculpObj.drawImage();
  }
}

void office() {
  image(office, width/2, height/2);
}

void ovilus() {
  image(ovilus, width/2, height/2);
}

void titleScreen() {
  image(titleScreen, width/2, height/2);
  fill(#EAE295);
  textSize(160);
  text("V I R T U O S O", width/2, 160); //text in the middle has a different fade out time
  if (second() > trigger) { //let this play once without overlap
    openingSong.play();
    trigger = second() + (int)openingSong.duration();
  }
  navigation (new PVector (width/4, 300), "PLAY", 1);
}

void navigation(PVector pos, String btnName, int num) {
  rectMode(CENTER);
  rect(pos.x, pos.y, 240, 85, 28);
  rectMode(NORMAL);
  image(button, pos.x, pos.y);
  textSize(30);
  text(btnName, pos.x, pos.y);

  if (dist(mouseX, mouseY, pos.x, pos.y) <= 100) {
    if (mousePressed) {
     gameState = num;
     click.play();
    }
  }
}
