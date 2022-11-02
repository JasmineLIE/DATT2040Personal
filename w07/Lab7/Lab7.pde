import processing.video.*;
import java.awt.Rectangle;
import gab.opencv.*;



Capture video;
OpenCV opencv;
PImage filter;

void setup() {
  size(640, 480);
  video = new Capture(this, "pipeline:autovideosrc");
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  filter = createImage(width, height, RGB);
  video.start();
  background(0);
}

void draw() {

  opencv.loadImage(video);
  filter.loadPixels();
//generate filter by extracting the pixels from the video feed
  for (int i = 0; i < width*height; i++) {
    if (red(video.pixels[i]) > 100) {
      filter.pixels[i] = video.pixels[i];
    }
  }


  filter.updatePixels();


  noFill();
  noStroke();
  Rectangle[] faces = opencv.detect();
  if (mousePressed == true) { //hold the mouse to draw the faces captured by openCV face detection onto the screen
    for (int i = 0; i < faces.length; i++) {

      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
      slitdraw(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }
  }
}


void slitdraw(int x, int y, int w, int h) { //take in parameters from face detection to capture and draw only the faces


  copy(filter, x, y, w, h, x, y, w, h); //while using parameters from video, it will copy the pixels from filter
}
void captureEvent(Capture c) {
  c.read();
}
