//reference: https://processing.org/examples/simpleparticlesystem.html


int ballWidth;
class Bubbles {

  PVector position;
  PVector acceleration;
  float lifespan;
  PVector velocity;
  float accel1 = 0;
  float accel2 = 0.01;


  Bubbles (PVector l) {
    acceleration = new PVector(accel1, accel2);
    velocity = new PVector(random(-2, 2), random(-2, 2));
    position = l.copy();
    lifespan = 255.0;
  }

  void update() {

    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }
  void display() {
    float val = random(125, 255);
    fill(color(val, val, val), lifespan);
    noStroke();
    rect(position.x, position.y, random(10, 30), random(10, 30));
  }




  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  void run() {
    update();
    display();
  }
}
