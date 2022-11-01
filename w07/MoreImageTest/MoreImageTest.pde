PImage img, filler;

void setup() {
 filler = createImage(width, height, RGB);
  img = loadImage("AmgalanPFP.png");
  size(932,1070);
}


//idea of the algorithm is to convert the pixels from the image into an empty PIMage, and then send that PImage to Processing window
//Not the best to just manipulate the OG image pixels, you lose the original image -- this scenario saves the image and never changes it directly, while still translating the changes elsewhere
void draw() {
 //image(img, 0, 0);
 loadPixels();
 img.loadPixels(); //sometimes you don't need to do this
 for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
    // float d = dist(x,y,width/2, height/2);
     int loc = x+y*width;
     float b = brightness(img.pixels[loc]);
     if (b > mouseX) {
      pixels[loc] = color(255); 
     } else {
      pixels[loc] = color(0); 
     }
  
    // pixels[loc] = color(d);
    //float r = red(img.pixels[loc]);
    //float g = green(img.pixels[loc]);
    //float b = blue(img.pixels[loc]);
    //float d = dist(mouseX, mouseY, x, y);
    //float factor = map(d, 0, 200, 2, 0); //gives value of certain range and map it to another value
    //pixels[loc] = color(r*factor, g*factor, b*factor);
    }
   
 }
 updatePixels();
}
