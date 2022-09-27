void circlePulse() { //This function will draw a circle changing colour each frame while it oscillates between 200 radius and -200 using sin() at 30 FPS
  blendMode(NORMAL);

 
  frameRate(30); //let's avoid flashing too many colours at people on the screen, make the circle animate slower
  fill(random(150), random(255), random(255));
  float r = map(sin(angle), -1, 1, 0, 200); //oscillating between 200 and -200, smoother

  circle(height/2, width/2, r*2);

  angle += m; //increment angle by seconds each frame, as the seconds increment each frame, too, gives circle varied radius as it changes the oscillation rate
  println(m); 
}
