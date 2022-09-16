PVector[] pos;
PVector[] acc;

int num = 30;
int speed = 10;
void setup() {
  size(700, 700);

  pos = new PVector[num]; //Declaring how many we want to hold, in this case 30
  acc = new PVector[num];
  //Populate
  for (int i = 0; i < num; i++) {
    pos[i] =  new PVector (random(width), random(height), random(30, 70));
    acc[i] =  new PVector (random(-speed, speed), random(-speed, speed), 0);
  }
}

void draw() {
  for (int j = 0; j<num; j++) {
    pos[j].add(acc[j]);
    ellipse(pos[j].x, pos[j].y, pos[j].z, pos[j].z);
  }
}

void mousePressed() {
  //Populate
  for (int i = 0; i < num; i++) {
    pos[i] =  new PVector (random(width), random(height), random(30, 70));
    acc[i] =  new PVector (random(-speed, speed), random(-speed, speed), 0);
  }
}
