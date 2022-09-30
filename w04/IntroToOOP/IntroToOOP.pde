RW [] randwalk;
int num = 100;

void setup() {
 size(1000, 1000);
 background(244);
 randwalk = new RW[num]; //We are giving the array a size, otherwise we get NullPoiinterException
 for (int i = 0; i<num; i++) {
 randwalk[i] = new RW(random(height),random(width),random(6)); //effective, but doesn't do anything if we don't tell it to do anything -- an error will throw if there are no values in the parameters deifned by the constructor

 }
}

void draw() {
  /*for (int i = 0; i<num; i++) {
  randwalk[i].randomwalk(); //invoke the method of this object
  randwalk[i].prox();
  }
  */
  
  for (RW r : randwalk) { //this does the same thing as the for loop 
    r.randomwalk(); 
    r.prox();
  }
}

class RW {//when start instancing classes, just have this curly bracket at the beginning instead of parentheses
  float x;
  float y;
  float rstep;
  float sw = random(2,5);
  
  color c = color(random(255), random(255), random(255));
  
  RW(float x, float y, float rstep) {//constructor, like feeding values to a function
    this.x = x; //this --> means we are referencing this instance of the object
    this.y = y;
    this.rstep = rstep;
  }
  
  void randomwalk() {
   x = x+random(-rstep, rstep);
   y = y+random(-rstep, rstep);
  strokeWeight(sw);
  stroke(c);
  point(x,y);
 
  }
  
  void prox() {
   for (int i = 0; i<num; i++) {
    float d = dist(this.x, this.y, randwalk[i].x, randwalk[i].y); //compare distance between this object and the other ones
    
    if (d <=40) {
      stroke(0,20);
      line(this.x, this.y, randwalk[i].x, randwalk[i].y);
    }
   }
  }
}
