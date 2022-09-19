class Brush {
 
  PVector pos, acc;
  float radius;
  PImage paperCurrent, paperBud, paperBloom, paperFlower;
  
  boolean isTouched = false;
  int touchedMarkTime = 0;
  int touchedTimeout = 2500;
  float triggerDistance = 25;
  
  Brush() {
    radius = random(25);
  }
}
