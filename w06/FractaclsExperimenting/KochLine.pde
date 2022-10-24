/* If each segment is an object, we can allow each segment to behave and move differntly from each other
* Konch Curve is a series of connected lines which have a start point ('a') and an end point ('b'), which we can translate using PVector
* Use of get here is intended to retrieve a COPY of the vector so that altercations do not change the PVector of other objects, and if we want segments to move independantly from eahcother
*/
class KochLine {
  PVector start;
  PVector end;
  
  KochLine(PVector a, PVector b) { //constructor to intialize PVectors
     start = a.get();
     end = b.get();
  }
  
  void display() {
     stroke(random(255), random(255), random(255)); 
     strokeWeight(random(15));
     
     line(start.x, start.y, end.x, end.y); //draw the line using our PVectors
  }
  
  PVector kochA() {
    return start.get(); 
  }
  PVector kochE() {
   return end.get(); 
  }
  
  PVector kochB() {
   PVector v = PVector.sub(end, start); //PVector from start to end;
   v.div(3); //For Koch patterns, the line following the mountain is 1/3 of the OG line
   v.add(start); //add that PVector to the beginning of the line to find the new point;
   return v;
  }
  
  PVector kochD() {
   PVector v = PVector.sub(end, start);
   v.mult(2/3.0); //we only need to move 3/4 along the ling instead of 1/3 -- this has to be a deciaml number
   v.add(start);
   return v;
  }
  
  PVector kochC() {
    //angles of all equilateral triangles are sixty degrees
    //We can start by using POint B-- a Pvector 1/3 of the length of the line
   PVector a = start.get();
   PVector v = PVector.sub(end,start);
   v.div(3); //move 1/3rd of the way to point B
   a.add(v); 
   
   v.rotate(-radians(60)); //rotrate 'above' the line 60 degrees
   a.add(v); //move along that vector to point C
   
   return a;
  }
}
