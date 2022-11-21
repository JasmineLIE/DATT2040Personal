//refernece : https://processing.org/examples/simpleparticlesystem.html
class BubblesSystem {
  ArrayList<Bubbles> bubbles;
  PVector origin;

  BubblesSystem(PVector position) {
    origin = position.copy();
    bubbles = new ArrayList<Bubbles>();
  }

  void addBubbles() {
    bubbles.add(new Bubbles(origin));
  }

  void run() {
    if (isPrinting) {
      addBubbles();
    }
    for (int i = bubbles.size()-1; i >= 0; i--) {
      Bubbles b = bubbles.get(i);
      b.run();
      if (b.isDead()) {
        bubbles.remove(i);
      }
    }
  }
}
