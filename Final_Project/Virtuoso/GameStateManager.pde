String artState = "painting";
PImage office, ovilus, titleScreen, button, printer, paper;
SoundFile openingSong, click;
int songTrigger = 0; //create this so that the intro song can play, set to 0 for now, so that it always plays after the intro no matter how long the player takes
int gameState = 0;
boolean buttonVisibility = true;



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
  case 3:
    exhibitionRoom();
    transition();
    break;
  case 4:
    inspec();
    break;
  }
}


void exhibitionRoom() {
  switch (artState) {
  case "painting":
    paintObj.drawImage();
    break;
  case "sculpture":
    sculpObj.drawImage();
    break;
  case "pottery":
    sculpObj.drawImage();
    break;
  }
  navigation(new PVector(200, 80), "OFFICE", 1, #EAE295);
  navigation(new PVector(350, 725), "INSPECTION", 4, #EAE295);
  navigation(new PVector(700, 725), "OVILUS", 2, #EAE295);
}

void inspec() {
  switch (artState) {
  case "painting":
    paintObj.inspecArt();
    break;
  case "sculpture":
    sculpObj.inspecArt();
    break;
  case "pottery":
    sculpObj.inspecArt();
    break;
  }
}


void office() {
  image(office, width/2, height/2);
  navigation(new PVector (width/2, 700), "EXHIBITION", 3, #EAE295);
  switch (artState) {
  case "painting":
    paintObj.printer();
    break;
  case "sculpture":
    sculpObj.printer();
    break;
  case "pottery":
    sculpObj.printer();
    break;
  }
}

void ovilus() {
  image(ovilus, width/2, height/2);
  navigation(new PVector(200, 725), "EXHIBITION", 3, #EAE295);
}

void titleScreen() {

  image(titleScreen, width/2, height/2);
  textSize(160);
  fill(#EAE295);
  text("V I R T U O S O", width/2, 120); //text in the middle has a different fade out time
  if (second() > songTrigger) {
    openingSong.play();
    songTrigger = second() + (int)openingSong.duration();
  }
  navigation (new PVector (width/4, 300), "PLAY", 1, #EAE295);
  navigation(new PVector(0+(width*0.75), 300), "ABOUT", 5, #EAE295);
}

void navigation(PVector pos, String btnName, int num, color col) {

  image(button, pos.x, pos.y);
  fill(col);
  textSize(30);
  textAlign(CENTER, CENTER);
  if (dist(mouseX, mouseY, pos.x, pos.y) <= 100) {
    tint(#FFD95A);
    image(button, pos.x, pos.y);
    noTint();
    if (mousePressed) {
      if (btnName == "PASS") {
        switch (artState) {
        case "painting":
          paintObj.verification(true);
          break;
        case "sculpture" :
          sculpObj.verification(true);
          break;
        case "pottery" :
          pottObj.verification(true);
          break;
        }
      } else if (btnName == "DENY") {
        switch (artState) {
        case "painting":
          paintObj.verification(false);
          break;
        case "sculpture" :
          sculpObj.verification(false);
          break;
        case "pottery" :
          pottObj.verification(false);
          break;
        }
        
      } else {
        decrement = 0;
        gameState = num;
        click.play();
        openingSong.stop();
      }
      docClicked = false;
    }
  }

  text(btnName, pos.x, pos.y);
}

void keyPressed() {
  if (key == '1') artState = "sculpture";
}
