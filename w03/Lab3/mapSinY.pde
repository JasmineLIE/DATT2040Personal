void mapSinY() { //three circles connected by a line that make a yo-yo, Kaleidoscope effect
  
  blendMode(DIFFERENCE); 
  frameRate(60); //revert back to 60, useful for if having proceeded circlePulse();
  stroke(255);

//---- Iner loop---
  fill(150, 210, 123);
  pushMatrix() ;
  translate(height/2, width/2);
  float y = map(sin(angle), -1, 1, -200, 200); //visualize the wave pattern by moving the circle up and down, depicting the peaks of the angle
  float x = map(cos(angle), -1, 1, -200, 200); //visualize the wave pattern by moving the circle up and down, depicting the peaks of the angle1
  strokeWeight(2);
  line(0, 0, x, y);
  circle(x, y, 32);
  popMatrix();
//---

//--- Second inner loop---
  fill(random(255), random(255), random(255));
  pushMatrix() ;
  translate(height/2, width/2);
  float y2 = map(cos(angle), -1, 1, -300, 300); //visualize the wave pattern by moving the circle up and down, depicting the peaks of the angle
  float x2 = map(sin(angle), -1, 1, -300, 300);  //visualize the wave pattern by moving the circle up and down, depicting the peaks of the angle1
  strokeWeight(2);
  line(0, 0, x2, y2);
  circle(x2, y2, 32);
  popMatrix();
// ---

//--- Outer loop---
  fill(random(255), random(255), random(255));
  pushMatrix() ;
  translate(height/2, width/2);
  float y3 = map(cos(angle), -1, 1, -400, 400); //visualize the wave pattern by moving the circle up and down, depicting the peaks of the angle
  float x3 = map(sin(angle), -1, 1, -400, 400);  //visualize the wave pattern by moving the circle up and down, depicting the peaks of the angle1
  strokeWeight(2);
  line(0, 0, x3, y3);
  circle(x3, y3, 32);
  popMatrix();
 //---
  angle += angleV;
}
