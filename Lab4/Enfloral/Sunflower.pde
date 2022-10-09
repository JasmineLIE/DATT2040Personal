boolean sfHasPin = false;
class Sunflower {

  String sf1Dialogue = "Nards... where did I put my lucky pin?!";
  String sfObservation1 = "Excuse me-- Nevermind.  She seems too lost in her head. \n I'll ask again later.";
  String sf2Dialogue = "Oh!  Thanks for finding my pin!  \n Don't tell Lobelia about this 'on the house'.";
  int padding = 145;
  void drawSF() {
    int s = second();

    if (s % 2 == 0) {
      image(sf1, 0, 0);
    } else {
      image(sf2, 0, 0);
    }

    if (!sfHasPin) 
      ui.setDesc(sfObservation1); 


    if (dist(mouseX, mouseY, 303, 244) <=150 && !sfHasPin) {
      text(sf1Dialogue, mouseX-padding, mouseY);
      if (mousePressed && ui.getItem() == "pin" ) {
        sfHasPin = true;
        ui.setItem("key");
      }
    } else if (dist(mouseX, mouseY, 303, 244) <=150 && sfHasPin) {
      text(sf2Dialogue, mouseX-padding-10, mouseY);
    }
  }
}
