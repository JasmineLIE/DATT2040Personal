//two classes are in this tab relating to the tank.  One of them is the Attractor, which works in tandem with Mover to simulate objects gravitating around an item
boolean pinRetrieved = false;
class Attractor { 
  float mass;
  PVector location;
  float G; //gravity
  String tank1 = "These bugs are dangerous.  I can't dip my bare hand in.";
  String tank2 = "Ah, the magic of magnets on a string.  Good thing I brought \n floss today.";
  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 25;
    G = 0.5; //gravitational pull of attractor
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);

    float distance = force.mag(); //store the length of the distance between the vector of the attractor and of the mover into distance



    distance = constrain(distance, 5, 15); //constrain so the movers don't push too deep or fly too far from the attractor


    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance); //the strength is applied to the force that pushes against the movers, influencing their movement speed and drawback
    force.mult(strength);
    return force; //function to be called within draw() so that force is consistently updating and feeding into mover
  }

  void display() { //when we have our magnet, and the pin has yet to be retrieved, when can use the magnet to alter the pin's location and move it around the tank.  Moving it up to the edge of the window sets our pinRetrieved check to true
    if (!pinRetrieved) {
      stroke(0);
      fill(175, 200);
      image(flowerPin, location.x, location.y);

      if (itemDragged && ui.getItem() == "magnet" && dist(location.x, location.y, itemPos.x, itemPos.y) <= mass*2) {

        location.x = mouseX-mass;
        location.y = mouseY-mass;
      }
      ui.setDesc(tank1);
    } else {
      ui.setDesc(tank2);
    }

    if (dist(mouseX, mouseY, height, height) > 600) {
      if (mousePressed && itemDragged) {
        pinRetrieved = true;
        ui.setItem("pin");
      }
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

    //receive a force, divide by mass, and add to acceleration.
    //the mass influences how the effective the force is.  Lighter objects are less swayed by force

    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void display() {
    stroke(0);
    fill(#FFD858);
    ellipse(location.x, location.y, 16, 16);
  }



  void checkEdges() { //keep bugs within sketch
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
