//Random walk-like, but at some point tell it to stop
//Most slow fake designs is a hexagonal pattern -- think of that as a bunch of triangular slices
//constain the branching within the perimeter of each slice, and then rotate around six tems

Particle current;
ArrayList<Particle> snowflake;
void setup() {
  size(600, 600);
  current = new Particle(width/2, 0);
  snowflake = new ArrayList<Particle>();
  background(0);
}

void draw() {

  translate(width/2, height/2);
  rotate(PI/6);
  current.update();




  while (!current.finished() && !current.intersects(snowflake)) { //adds one particle each time the previous one meets its destination and stops

      snowflake.add(current);
  current = new Particle(width/2, 0);
  }



  for (int i = 0; i < 6; i++) {
    rotate(PI/3);
    current.show();
    for (Particle p : snowflake) {
      p.show();
    }

    pushMatrix();
    scale(1, -1);
    current.show();
    for (Particle p : snowflake) {
      p.show();
    }
    popMatrix();
  }
}
