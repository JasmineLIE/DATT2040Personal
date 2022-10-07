Mover [] mover;
int numMovers = 10;
Attractor a;
Magnet m;

void setup() {
  size(900, 600);
  mover = new Mover[numMovers];
  for (int i = 0; i < numMovers; i++) {
   mover[i] = new Mover(); 
  }
  
  a = new Attractor();
  m = new Magnet();
}

void draw() {
  background(255);
  for (Mover m : mover) {
   m.run(); 
   PVector f = a.attract(m);
   m.applyForce(f);
  }
  
  a.run();
  m.run();
}
