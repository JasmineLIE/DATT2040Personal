size(500,500);
color myColor = color(200,100,120);

loadPixels();

for (int i = 0; i<width*height; i++){ //so long as i is less than the entire length of the canvas 
  pixels[i] = myColor;
  pixels[i] = color(map(i, 0 , width*height, 0, 255), 100, 20); //can use map to make a gradient
  pixels[i] = color(random(255)); //noise
}

updatePixels();
