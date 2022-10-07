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
    PVector force = PVector.sub(location,m.location);
    force.normalize(); //to keep the Movers flying in a pointed direction to the attractor
    float distance = force.mag();

//Remember, we need to constrain the distance so that our circle doesn’t spin out of control.

    distance = constrain(distance,1,10);
 
 
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
