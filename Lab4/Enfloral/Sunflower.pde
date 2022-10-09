//The Sunflower class draws Sunflower bartender, keeps track of booleans, and uses ui setter method upon correct conditions
//Sunflower has a string that draws certain dialogue onto the screen depending if she has her pin or not, and by the distance of the cursoer to where her illustration falls on the sketch
boolean sfHasPin = false;
class Sunflower {

  String sf1Dialogue = "Nards... where did I put my lucky pin?!";
  String sfObservation1 = "Excuse me-- Nevermind.  She seems too lost in her head. \n I'll ask again later.";
  String sf2Dialogue = "Oh!  Thanks for finding my pin!  \n Don't tell Lobelia about this 'on the house'.";
  int padding = 145;
  void drawSF() {
    int s = second();

    if (s % 2 == 0) { //every 2 seconds change image back and forth to simulate animation
      image(sf1, 0, 0);
    } else {
      image(sf2, 0, 0);
    }

    if (!sfHasPin) //Poinsetta will remark about Sunflower's busyness when she doesn't have her pin
      ui.setDesc(sfObservation1); 


    if (dist(mouseX, mouseY, 303, 244) <=150 && !sfHasPin) {
      text(sf1Dialogue, mouseX-padding, mouseY);
      if (mousePressed && ui.getItem() == "pin" ) { //if the pin is in the inventory box and is dragged to Sunflower's viscinity, change the pin to a key, set item to key, and check that the boolean for having the key is true
        sfHasPin = true;
        ui.setItem("key");
        hasKey = true;
      }
    } else if (dist(mouseX, mouseY, 303, 244) <=150 && sfHasPin) {
      text(sf2Dialogue, mouseX-padding-10, mouseY);
    }
  }
}
