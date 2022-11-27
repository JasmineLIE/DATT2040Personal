String artState;
PImage office, ovilus, titleScreen, button, printer, paper, aboutScreen;
SoundFile openingSong, click;
int songTrigger; //create this so that the intro song can play, set to 0 for now, so that it always plays after the intro no matter how long the player takes
int gameState;



/**
 * This method checks the game state and draws the scene accordingly
 */
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
  case 5:
    endManager();
    break;

  case 6:
    aboutScreen();
    break;
  }
}


/**
 * This method drwas the Exhibition Room, invoking different Object methods depending on which artwork the player has progressed to
 */
void exhibitionRoom() {
  switch (artState) {
  case "painting":
    paintObj.drawImage();
    break;
  case "sculpture":
    sculpObj.drawImage();
    break;
  case "pottery":
    pottObj.drawImage();
    break;
  }
  navigation(new PVector(200, 80), "OFFICE", 1, #EAE295);
  navigation(new PVector(350, 725), "INSPECTION", 4, #EAE295);
  navigation(new PVector(700, 725), "OVILUS", 2, #EAE295);
}


/**
 * This method draws the Inspection, invoking different Object methods depending on which artwork the player has progressed to
 */
void inspec() {
  switch (artState) {
  case "painting":
    paintObj.inspecArt();
    break;
  case "sculpture":
    sculpObj.inspecArt();
    break;
  case "pottery":
    pottObj.inspecArt();
    break;
  }
}


/**
 * This method draws the office, invoking the printer function of the current artwork
 */
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
    pottObj.printer();
    break;
  }
}

/**
 * This method draws the Ovilus and invokes the current artwork object examined's function
 */
void ovilus() {
  image(ovilus, width/2, height/2);
  navigation(new PVector(200, 725), "EXHIBITION", 3, #EAE295);

  switch (artState) {
  case "painting":
    paintObj.ovilus();
    break;
  case "sculpture":
    sculpObj.ovilus();
    break;
  case "pottery":
    pottObj.ovilus();
    break;
  }
}

/**
 * This method draws the title screen
 */
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
  navigation(new PVector(0+(width*0.75), 300), "ABOUT", 6, #EAE295);
}

/**
 * This method draws the about screen
 */
void aboutScreen() {
  image(aboutScreen, width/2, height/2);
  navigation(new PVector(200, 725), "BACK", 0, #EAE295);
}

/**
 * This method draws a button onto the screen that is interactable and changes scenes
 * @param  pos is a PVector value that sets where the button is drawn on the screen
 * @param  btnName is a String value that sets the label on the button
 * @param  num is an int value that is used to set a new gameState
 * @param  col is a color value that sets the colour button label
 */
void navigation(PVector pos, String btnName, int num, color col) {

  image(button, pos.x, pos.y);
  fill(col);
  textSize(30);
  textAlign(CENTER, CENTER);
  if (dist(mouseX, mouseY, pos.x, pos.y) <= 100) { //changes the colour of the button as a visual indicator that the button is being hovered over
    tint(#FFD95A);
    image(button, pos.x, pos.y);
    noTint();
    
    if (mousePressed) {
      if (btnName == "PASS") {
        switch (artState) { //sends true value into verification function of the current object
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
        click.play();
        paperPrinted = false;
        printerPosReset();
      } else if (btnName == "DENY") { //sends false value into verification function of the current object
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
        click.play();
        paperPrinted = false;
        printerPosReset();
      } else {
        decrement = 0;
        click.play();
        gameState = num;
        openingSong.stop();
        openingSong.removeFromCache();
      }
      docClicked = false;
    }
  }

  text(btnName, pos.x, pos.y);
}

/**
 * This method resets the position of the printer and paper so that it can play the animation again
 */
void printerPosReset() {
  printerPos.set(475, 160);
  paperPos.set(475, 200);
}
