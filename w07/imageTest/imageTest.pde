//500 415

PImage img, filter;
  
void setup() {
filter = createImage(width, height, RGB);
   //default mode is top left hand corner
}

void settings() {

  img = loadImage("mountain.png");
size(img.width, img.height);//cant feed variables into size, need numbers in setup(), but settings() is fair game

  //img.pixels = sort(img.pixels); //sorts the pixels based on value from smallest to largest, can use keyword reverse to change the order
}


void draw() {
  
  filter.loadPixels();
  
  for (int i = 0; i < img.width * img.height; i++) {
    //img.pixels[i] = color(brightness(img.pixels[i])); //can look at different birghtness, saturation, etc. of each pixel, 
    if (hue(img.pixels[i]) >60) {
      filter.pixels[i] = img.pixels[i]; //can use this to specifiy what you want to see around a certain threshhold
    }

  }  
  filter.updatePixels();
  image(filter, 0, 0);//need this to be within the same function as loadPixels(); so the method knows what to draw from, can be placed anywhere
  //noLoop();//overtime it overrides the pixels, so noLoop() can lets you see saturation levels with just one loop
  
  //the method get() can grab a specific pixel or a range of pixels
}

void mousePressed() {
 filter = createImage(width, height, RGB); 
}
