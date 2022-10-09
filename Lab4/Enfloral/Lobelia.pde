//The Lobelia class will draw Lobelia onto the sketch when gameMode == "lounge"
//Lobelia has a String which is drawn when the distance between the mouse and a location on the canvas where his illustration are <= 150 pixels

class Lobelia {
  String l1Dialogue = "Fine evening, isn't it?";
  int padding = 50;
  void drawL() {
    int s = second();

    if (s % 2 == 0) { //every 2 seconds, change image. give feel of animation
      image(l1, 0, 0);
    } else {
      image(l2, 0, 0);
    }

    if (dist(mouseX, mouseY, 720, 353) <= 150) {
      fill(255);
      text(l1Dialogue, mouseX-padding, mouseY);
    }
  }
}
