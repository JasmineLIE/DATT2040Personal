class Brush {

  PVector pos, acc;
  float radius;
  int speed = 5;
  PImage paperCurrent, paperBud, paperBloom, paperFlower;

  //---Lotus flower state variables---
  boolean isTouched = false;
  int touchedMarkTime = 0;
  int touchedTimeout = 2500;
  float triggerDistance = 100;
  boolean isFurling = false;
  //-----

  Brush() {
    pos = new PVector (mouseX, mouseY);
    acc = new PVector (random(-speed, speed), random(-speed, speed), 0);
    radius = random(50, 150);

    //---Resize the lotus flowers based on the size of their generated radius, each is different
    paperBud = loadImage("lotusBud.png");
    paperBud.resize(int(radius/2), int(radius));

    paperBloom = loadImage("lotusBloom.png");
    paperBloom.resize(int(radius), int(radius));

    paperFlower = loadImage("lotusFlower.png");
    paperFlower.resize(int(radius), int(radius));
    paperCurrent = paperBud;
    //-----
  }

  void drawMe() { //Draw the initial lotus flower
    noFill();
    noStroke();
    ellipseMode(CENTER);
    image(paperCurrent, pos.x, pos.y);
  }

  void update() { //Update lotus flower movement and keep track of interaction

    //---PVector Method #1: dis()---
    PVector mousePos = new PVector(mouseX, mouseY); //Create a new PVector which updates each frame, keeps track of cursor position
    isTouched = pos.dist(mousePos) < triggerDistance; //isTouched is true if the mouse intersects the trigger distance of  100 pixels innate in each lotus object
    println(isTouched); //debug
    if (isTouched) { //if the trigger distance is met, start counting milliseconds since the program was opened, and make the lotus bloom into a flower, checks isFurling to false
      touchedMarkTime = millis();
      isFurling = false;
      paperCurrent = paperFlower;
    } else { //otherwise, the lotus flower returns to a bloom state, setting isFurling to true
      isFurling = true;
      paperCurrent = paperBloom;
    }

    if (isFurling && millis() > touchedMarkTime + touchedTimeout) { //lotus returns back to bud state when after it has not been touched and a certain amount of time passes
      paperCurrent= paperBud;
    }
    //-----

    pos.add(acc); //Pvector Method #2: add() -- make lotus flower move by adding the acc value to its position
    if (keyPressed== true) {
      pos.lerp(mouseX, mouseY, 0.0, 0.01);  //PVector Method #3: lerp() -- the lotus gravitate towards where the cursor is, if any key on the keyboard is pressed
    }

    //---Rotates lotus as they move around campus without disturbing any other elements---
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(frameCount*0.01);
    image(paperCurrent, 0, 0);
    popMatrix();
    //-----

    noStroke(); //makes sure the circle the lotus is defined by and takes its coordinates by is not visible
    ellipse(pos.x, pos.y, radius, radius);

    //---Border check; if the lotus hits the edge of the canvas, acceleration is reversed and it bounces back
    if (pos.x>width-(pos.z/2) || pos.x<pos.z/2) {
      acc.x *= -1;
    }
    if (pos.y>height-(pos.z/2) || pos.y<pos.z/2) {
      acc.y *=-1;
    }
    //-----

    //---Drawing based on overlap---
    for (int i = 0; i<brushArr.length; i++) {
      Brush otherBrush = brushArr[i];
      if (otherBrush != this) { //checks two different lotuses, this state makes sure we are not comparing the lotus to itself
        float dis = PVector.dist(pos, otherBrush.pos); //calculate distance between lotus and the other lotuses
        float overlap = dis - radius - otherBrush.radius; //caluclate overlap each frame

        if (overlap < 0) { //checks if there is an overlap, and if so performs the following statements:
          float midX, midY;
          midX = (pos.x + otherBrush.pos.x)/2;
          midY = (pos.y + otherBrush.pos.y)/2;
          stroke(0, random(255), random(255)); //create a random coloured stroke in green-blue ranges
          noFill(); 
          strokeWeight(random(5));
          overlap *= -1; 
          ellipse(midX, midY, overlap, overlap); //draw a circle where overlaps occur
        }
      }
    }
  }
}
