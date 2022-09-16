int _num = 10;
Circle[] _circleArr = {}; //An array to store all circles
void setup() {
  size(500, 300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
  //background(255);
  for (int i=0; i<_circleArr.length; i++) {
   Circle thisCirc = _circleArr[i];
   thisCirc.updateMe(); //called every frame by the draw loop
  }
}
  void mouseReleased() {
    drawCircles();
    println(_circleArr.length); //trace current number of circles to console window
  }
void drawCircles() {
  for (int i = 0; i<_num; i++) {
    Circle thisCirc = new Circle(); //create them conceptually in the memory
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }


}

/*
Using Arrays
An array is a list of objects of a certain type, can specify what those items are using braces syntax;
i.e: int[] numberArray = {1,2,3,4,5};
Can also add new items to each position
e.x: numberArray[2]=3;
An empty array with no item is defined as follows: int[]NumberArray={};
To add an extra slot to an array and place data in that slot you use append.  Note; need to cast the new array returned by this command to the correct tyoem such as int[]
e.x: numberArray=(int[])append(numberArray,6);

Notice how when you click to add more circles, the previous circles stay onscreen unchanged.  You're still clearing
the canvas each frame, but because the objects remain in memory they don;t go anywhere so you can redraw them whenever
you need them.
*/

/*
This ia  clustering pattern, made up of nothing but circles, isn't a product of intention.
The pattern is a byproduct of itneractions between behaviours programmed, not the behaviours itself
To take it further:
• Leaving traces—Don’t clear the screen between frames. Draw a transparent rectangle over
everything instead (as described in 2.4.2).

• Reducing the alpha and stroke weight—Make the lines more subtle to turn hard edges into
an organic blur (see figure 6.7).

• Plotting more complex paths—You’ve already seen in previous chapters how there are far
more interesting routes to take between two points than a straight line. How about plotting
movement along a curve, for example?

• Drawing more interesting shapes—Draw something more exciting than a simple circle. You
can even import images to be the visual representations of objects
*/
