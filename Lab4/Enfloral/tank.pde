boolean magnetGrabbed = false;
class Magnet {
  float size;
  PVector pos;

  Magnet() {
    size = 50;
    pos = new PVector (800, 400);
  }

  void grab() {
    if (dist(mouseX, mouseY, pos.x, pos.y) <= size/2) {

      if (mousePressed) {
        magnetGrabbed = true;
        pos.x = mouseX;
        pos.y = mouseY;
      } else {
        magnetGrabbed = false;
      }
    }
  }

  void drawMagnet() {
    ellipse(pos.x, pos.y, size, size);
  }

  void run() {
    grab();
    drawMagnet();
  }
}

class Attractor { 
  float mass;
  PVector location;
  float G; //gravity

  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 20;
    G = 0.5; //gravitational pull of attractor
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);

    float distance = force.mag();

    //Remember, we need to constrain the distance so that our circle doesn’t spin out of control.

    distance = constrain(distance, 5, 15);


    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  void display() {
    stroke(0);
    fill(175, 200);
    ellipse(location.x, location.y, mass*2, mass*2);

    if (magnetGrabbed && dist(location.x, location.y, m.pos.x, m.pos.y) <= mass*2) {

      location.x = mouseX-mass;
      location.y = mouseY-mass;
    }
  }

  void run() {
    display();
  }
}

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

      location.y = height;
      velocity.y *= -1;
    } else if (location.y < 0) {
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
