float angle;
boolean magnetGone = false;

void clockRoom() {
  int s = second();
  String clockRoom1 = "Strange.  The clock still ticks.  What's keeping the hand stuck?";
  String clockRoom2 = "That sounds better; smooth and sound.  Pesky magnet.  \n I wonder who left that there.";

  stroke(255);
  noFill();
  pushMatrix();
  translate(width/2, 200);
  strokeWeight(1);
  float rad = 150;


  strokeWeight(20);
  stroke(#187663);
  float x = rad*cos(angle); //uses cos and sin to generate a circle
  float y = rad*sin(angle);
  point(x, y);
  strokeWeight(10);
  line(0, 0, x, y); //follows the circular pattern
  popMatrix();

  strokeWeight(1);

  if (dist(mouseX, mouseY, 602, 199) <= rad && !magnetGone) { //if the mouse presses the particular dot at the end of the clock arm, the magnet is retrieved
    if (mousePressed) {
      magnetGone = true;
      ui.setItem("magnet");
    }
  }

  if (magnetGone) { //clock only moves if the magnet is removed
    if (s%2==0) angle += 0.005;
    ui.setDesc(clockRoom2); //diferent dialogue to reflect the magnet's presence
  } else {

    ui.setDesc(clockRoom1);
  }
}
