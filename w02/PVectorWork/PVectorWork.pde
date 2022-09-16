//Createa PVector to define x,y,z position
PVector pos;

//Create a PVector to define acceleration 
PVector acc;
int speed = 10;
void setup() {

  size(500, 500);
  pos = new PVector (random(width), random(height), 50); //create new PVector and hold it in pos
  acc = new PVector (random(-speed, speed), random(-speed, speed), 0);
}

void draw() {
  background(0);
  pos.add(acc); //increments whatever value of acc to pos continously

  //--Boundary Check--
  if (pos.x>width-(pos.z/2) || pos.x<pos.z/2) { //If the position of the ellipse exceeds the boundaries in relation to its size, so it bounces using the ellipse's edge
   acc.x = acc.x*-1;
  }
  
  if (pos.y>height-(pos.z/2) || pos.y<pos.z/2) { //If you don't divide by 2, there will be a circle extra of space, so dividing it by 2 gives the radius to use as the boundary
   acc.y = acc.y*-1; 
  }

  ellipse(pos.x, pos.y, pos.z, pos.z); //can also use cicle(), which uses the x, y, z parameters only -- takes only three arguments
  //Though, ellipse comes in handy if you don't want something to just be a spherical circle, like an oval
}

void mousePressed() {
  acc = new PVector (random(-speed, speed), random(-speed, speed), 0);
  pos = new PVector (random(width), random(height), 50); //reset PVector position every time mouse is clicked
}
