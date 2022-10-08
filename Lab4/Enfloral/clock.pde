float angle;
boolean magnetGone = false;

void clockRoom() {
  int s = second();
String clockRoom1 = "Strange.  The clock still ticks.  What's keeping the hand stuck?";
String clockRoom2 = "That sounds better; smooth and sound.  Pesky magnet.  \n I wonder who left that there.";
  background(0);
  stroke(255);
  noFill();
  pushMatrix();
  translate(width/2, 200);
  strokeWeight(1);
  float rad = 150;
  circle(0, 0, rad*2);

  strokeWeight(20);
  stroke(252, 238, 33);
  float x = rad*cos(angle);
  float y = rad*sin(angle);
  point(x, y);
  strokeWeight(10);
  line(0, 0, x, y);
  popMatrix();

  strokeWeight(1);

  if (dist(mouseX, mouseY, 602, 199) <= rad && !magnetGone) {
    if (mousePressed) {
      magnetGone = true;
      ui.setItem("magnet");
    }
  }

  if (magnetGone) {
    if (s%2==0) angle += 0.005;
    ui.setDesc(clockRoom2);
  } else {

    ui.setDesc(clockRoom1);
  }
}
