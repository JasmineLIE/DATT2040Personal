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
   collide[i] = new Collider(new PVector(random(width), random(height)), random(20,30), i, collide); 
  }
  
}

void draw() {
 background(0); 
 
 for (Collider c : collide) {
  c.collide();
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
  Collider[]others;
  
  //make a constructor
  Collider(PVector locin, float di, int idi, Collider[] oi) {
    loc = locin;
    diameter = di;
    id = idi;
    others = oi;
  }
  
  //collission and trajectory change
  
  void collide() {
    for (int i = id+1; i < particles; i++) { //only checks other particles, could also have an if-statement that checks if the id is the same as i, and if so then do not execute the collision code
      
      PVector dxy1 = new PVector(loc.x, loc.y); //location of our current position
      PVector dxy2 = new PVector(others[i].loc.x, others[i].loc.y);
      
      PVector sub = PVector.sub(dxy2, dxy1); //
      
      float distance = PVector.dist(dxy1, dxy2);
      float minDist = (others[i].diameter + diameter)/2;
      
      if (distance < minDist) { //if its distances closes in with another ball
        
        //calculate
        float angle = atan2(sub.y, sub.x); //consistently need to apply these forces to both x and y valuel returns an angle based on the distance
        float targetX = loc.x + cos(angle)*minDist; //where we want to head towards
        float targetY = loc.y + sin(angle)*minDist;
        
        float ax = (targetX - others[i].loc.x);
        float ay = (targetY - others[i].loc.y);
        
        force.x -= ax;
        force.y -= ay;
        
        others[i].force.x +=ax;
        others[i].force.y += ay;
      }
    }
  }
  
  //end of
  
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
