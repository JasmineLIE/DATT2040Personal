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
  background(0);
}

void draw() {
 
  fill(0, 30); //Fill for Rect
  rect(0, 0, width, height);
  fill(255); //Fill for Ellipses

  for (int j = 0; j<num; j++) {
    //--Boundary Check--
    if (pos[j].x>width-(pos[j].z/2) || pos[j].x<pos[j].z/2) { //If the position of the ellipse exceeds the boundaries in relation to its size, so it bounces using the ellipse's edge
      acc[j].x = acc[j].x*-1;
    }

    if (pos[j].y>height-(pos[j].z/2) || pos[j].y<pos[j].z/2) { //If you don't divide by 2, there will be a circle extra of space, so dividing it by 2 gives the radius to use as the boundary
      acc[j].y = acc[j].y*-1;
    }

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
