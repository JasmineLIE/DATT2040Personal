class Lobelia {
  String l1Dialogue = "Fine evening, isn't?";
  int padding = 50;
  void drawL() {
    int s = second();

    if (s % 2 == 0) {
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
