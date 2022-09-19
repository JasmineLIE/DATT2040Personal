class Circle {
  //This is an object constructed according to the template we've defined
  //properties:
  float x, y;
  float radius;
  color lineCol, fillCol;
  float alph;
  float xmove, ymove; //Give each circle movement factore in x and y directions -- steps to move every frame

  //Constructor:
  Circle() {
    x = random(width);
    y = random(height);
    radius = random(100)+10;
    lineCol = color(random(255), random(255), random(255), 0); //setting alpha to 0 prevents initial circle visibility
    fillCol = color(random(255), random(255), random(255), 0);
    alph = random(255);
    xmove = random(10) - 5;  //random step
    ymove = random(10) - 5;
  }
  //object method 
  void drawMe() {
    noStroke();
    fill(fillCol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(lineCol, 150);
    noFill();
    ellipse(x, y, 10, 10);
  }

  void updateMe() { //move every frame
  
  /*
  Interaction Patterns
  
  The tricky bit is caulcating the midpoint between two circles that could be anywhere on (or off) screen
  Need to ensure all bases covered.  If the x pos. of the current circle is greater than the y.pox of the intersecting circle
  the midpoint x is x+(otherCirc.x-x)/2.  
  If it's less, the midpoint is otherCirc.x+(x-otherCirc.x)/2
  
  A neater way to do it in one lineof code -- the average of the two x values will give us the midpoint between them, 
  you can calculate this by adding them together and dividing them by 2: (x+otherCirc.x)/2.  Also applies for the y direction
  */
    x += xmove;
    y += ymove;
    if (x > (width+radius)) { 
      x = 0 - radius;
    }
    if (x < (0-radius)) { 
      x = width+radius;
    }
    if (y > (height+radius)) { 
      y = 0 - radius;
    }
    if (y < (0-radius)) { 
      y = height+radius;
    }
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius; //calculates overlap
        if (overlap < 0) { //negative overlap = touching
          float midx, midy;
          midx = (x + otherCirc.x)/2; //calculates midpoint
          midy = (y + otherCirc.y)/2; 
          stroke(random(255), random(255), random(255));
          noFill();
          overlap *= -1; 
          //4
            ellipse(midx, midy, overlap, overlap); //draws a circle at the mid point where the overlap takes place
         // 5
        }
      }
    }
   // drawMe(); commenting this out will get rid of the original circles.  They're still there, but you're not drawing them to the screen
  }
}

/*
Class is a definition for a collection of objects.
 
 E.x: If we define a class 80s English Indie band, it describes a number of objects with shared characteristics
 (guitars, backcombed hair, etc.)
 
 We can make instance of that class called The Smiths, and a second instance called Echo and The Bunnymen
 Both are independant of each other but can share common functionality; recordAlbum(), splitAcrimoniously(), etc.
 The class is a template; defines only parameters these objects share, functions they can perform, and logic for
 how an object can be construcuted.
 
 A class becomes an object when you make an instance of it
 
 */
