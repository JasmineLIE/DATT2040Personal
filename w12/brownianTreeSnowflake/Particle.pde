class Particle {
  PVector pos;
  float r;
  Particle(float x, float y) {
   pos = new PVector(x,y);
    r = 3;
  }
  void update() {
    pos.x -=1;
    pos.y += random(-3, 3);
    
    float angle = pos.heading(); 
    angle = constrain(angle, 0, PI/6);
    float mag = pos.mag();
    pos = PVector.fromAngle(angle);
    pos.setMag(mag); //take existing vector, constrain angle and change the way the vector looks
  }

  void show() {
    fill(255);
    stroke(255);
    ellipse(pos.x, pos.y, r*2, r*2);
  }

  boolean intersects(ArrayList<Particle> snowflake) {
    boolean result = false;

    for (Particle s : snowflake) {
      float d = dist(pos.x, pos.y, this.pos.x, this.pos.y);
      if (d < r*2) {
        result = true;
        break;
      }
    }
    return result;
  }

  boolean finished() {
    return (pos.x < 1);
  }
}
