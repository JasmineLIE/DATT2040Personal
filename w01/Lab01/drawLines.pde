void drawLines(float tempX, float tempY, float tempVal, float lineVal) {
//x coordinate parameter, y coordinate parameter, value for beat, value for a point on the grid
  if (tempVal > 200) { 
    int dice=int(random(7));
  strokeWeight(0.02*tempVal);

    switch(dice) {
    case 0:
      //line goes right
      stroke(random(tempVal), random(tempVal), random(tempVal));
      line(tempX, tempY, tempX+lineVal, tempY);
      break;
    case 1:
      //line goes down
      stroke(random(tempVal), random(tempVal), random(tempVal));
      line(tempX, tempY, tempX, tempY+lineVal);
      break;
    case 2:
      //line goes left
      stroke(random(tempVal), random(tempVal), random(tempVal));
      line(tempX, tempY, tempX-lineVal, tempY);
      break;
    case 3:
      //line goes up
      //color = yellow
      stroke(random(tempVal), random(tempVal), random(tempVal));
      line(tempX, tempY, tempX, tempY-lineVal);
      break;
    case 4:
      //line goes diagonally right upwards
      stroke(random(tempVal), random(tempVal), random(tempVal));
      line(tempX, tempY, tempX+lineVal, tempY-lineVal);
      break;
    case 5:
      //line goes diagonally left upwards
      stroke(random(tempVal), random(tempVal), random(tempVal));
      line(tempX, tempY, tempX-lineVal, tempY-lineVal);
      break;
    case 6:
      //line goes diagonally right downwards;
      stroke(random(tempVal), random(tempVal), random(tempVal));
      line(tempX, tempY, tempX+lineVal, tempY+lineVal);
      break;
    case 7:
      //line goes diagonally left downwards
      stroke(random(tempVal), random(tempVal), random(tempVal));
      line(tempX, tempY, tempX-lineVal, tempY+lineVal);
      break;
    }
  }
}
