//reference: https://processing.org/examples/simpleparticlesystem.html

int ballWidth;

/**
 * This class defines a Bubble
 */
class Bubbles {

  PVector position;
  PVector acceleration;
  float lifespan;
  PVector velocity;
  float accel1 = 0;
  float accel2 = 0.01;

  /**
   * This is a constructor to create a Bubblect object
   * @param  l is a PVector that sets the initial position of the bubble
   */
  Bubbles (PVector l) {
    acceleration = new PVector(accel1, accel2);
    velocity = new PVector(random(-2, 2), random(-2, 2));
    position = l.copy();
    lifespan = 255.0;
  }

  /**
   * This method applies PVector physic movements to the bubble, as well constantly lowering it sopacity
   */
  void update() {

    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  /**
   * This method draws the way the bubble looks, from its colour to its position
   */
  void display() {
    float val = random(125, 255);
    fill(color(val, val, val), lifespan);
    noStroke();
    rect(position.x, position.y, random(10, 30), random(10, 30));
  }

  /**
   * This method checks if the Bubble's opacity is below 0.0
   * @return  Returns true of the Bubble's opacity is below 0,0, classifying it as 'dead'
   */
  boolean isDead() {
    return (lifespan < 0.0);
  }

  /**
   * This method runs both the update() and display() method
   */
  void run() {
    update();
    display();
  }
}

/**
 * This class defines a Bubble System which takes Bubble objects and manipulates them
 */
class BubblesSystem {
  ArrayList<Bubbles> bubbles;
  PVector origin;
  /**
   * This constructor makes the BubblesSystem
   * @param  position is a PVector variable that is copied to the origin field
   */
  BubblesSystem(PVector position) {
    origin = position.copy();
    bubbles = new ArrayList<Bubbles>();
  }

  /**
   * This method adds another Bubble to the bubbles arrayList using the position retrieved from origin
   */
  void addBubbles() {
    bubbles.add(new Bubbles(origin));
  }

  /**
   * This method adds bubbles if the isPrinting is true, meaning if the printer is still printing and removes bubbles when the opacity of one reaches 0.0
   */
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
