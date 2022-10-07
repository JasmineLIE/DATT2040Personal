class Mover {
  PVector location, velocity, acceleration; 
  float mass;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector (0, 0);
    acceleration = new PVector(-0.01, 0.01);
    mass = 10;
  }
  void update() {




    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0); //clearr acceleration each time
  }

  void applyForce(PVector force) {

    //Receive a force, divide by mass, and add to acceleration.

    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }



  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {


      velocity.y *= -1;
      location.y = height;
    }else if (location.x < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
  }

  void run() {
    update();
    display();
    checkEdges();
  }
}
