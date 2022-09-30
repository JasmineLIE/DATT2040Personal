//Initiate an array of objects
Collider[] collide; 

//create some global constants

//the number of particles we will create
int particles = 10;

//some values that will drive the physics in our virtual space
float bounce = 0.005;
float gravity = 0.04;
float friction = -0.7;

void setup(){
  size(600,400);
  collide = new Collider[particles];
  
  for(int i = 0; i <particles; i++) {
    //PVector x,y --> random diameter, index
   collide[i] = new Collider(new PVector(random(width), random(height)), random(20,30), i); 
  }
  
}

void draw() {
 background(0); 
 
 for (Collider c : collide) {
  c.drawit(); 
  c.move();
  c.selected();
 }
}

//our object class - lets add some collisions
class Collider{
  
  PVector loc;
  PVector force = new PVector(0,0);
  float diameter;
  
  //will be useful
  int id;
  
  //make a constructor
  Collider(PVector locin, float di, int idi) {
    loc = locin;
    diameter = di;
    id = idi;
    
  }
  
    void move() {
    force.y+=gravity;
    loc.x+=force.x;
    loc.y+=force.y;
    
    if (loc.x+diameter/2 > width) { //when they hit the ground they'll my multiplited by friction and reposition -- a diminishing effect that pulls on it when it drops, dampening effect
      loc.x = width-diameter/2; 
      force.x*=friction;
    } else if (loc.x - diameter/2 <0) {
      loc.x=diameter/2;
      force.x*=friction;
    }
    if (loc.y+diameter/2 > height) {
      loc.y = height-diameter/2; 
      force.y*=friction;
    } else if (loc.y - diameter/2 <0) {
      loc.y=diameter/2;
      force.y*=friction;
    }
  }
  
  void drawit() {
   ellipse(loc.x, loc.y, diameter, diameter); 
  }
  
  void selected() {
   if(mousePressed) {
    if (dist(mouseX, mouseY, loc.x, loc.y) <= diameter/2) { //lets us select an individual circle within that diameter
      loc.x = mouseX;
      loc.y = mouseY;
    }
   }
  }

}
