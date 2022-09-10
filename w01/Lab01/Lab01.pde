/* Lab 1 -- Grid Music
 * @author Jasmine Ly
 * Music: Lux by The Surrealist.  YouTube link: https://www.youtube.com/watch?v=MxBzJxGS-hQ
 * This sketch utilizes a sound library which converts music into data.  Here, it converts the song's beat and amplitude into data to be used with the grid shapes
 */
import processing.sound.*;

//----Sound library initialization----
SoundFile song;
BeatDetector beatDetector;
Amplitude rms; 
//----Sound library initialization----

//----global variables initialization----
float smoothingFactor = 0.25; //for peak amplitutde
float sum; //for peak amplitutde

int col = 10; //for grid shaping
int row = 10; //for grid shaping
int stepx, stepy; //for grid shaping
//----global variables initialization----

void setup() {
  size(500, 500);
  background(0);
  
  //----Sound File set up----
  song = new SoundFile(this, "Lux.mp3");
  song.play();
  //----Sound File set up----
  
  //-----beat detector set up-----
  beatDetector = new BeatDetector(this);
  beatDetector.input(song);
  beatDetector.sensitivity(200);
  //-----beat detector set up-----
  
  //----Peak amplitude set up-----
  rms = new Amplitude(this);
  rms.input(song);
  //----Peak amplitude set up-----
  
  //define step sizes
  stepx = width/col; //for grid shaping
  stepy = height/row; //for grid shaping
  rectMode(CENTER);
}

void draw() {

  sum += (rms.analyze() - sum) * smoothingFactor;  //smooth the rms data, retrieved by rms.analyze(), whic returns a value between 0 and 1 based on song amplitude
  float rms_scaled = sum * (height/2) * 15; //scaled by height of sketch
  
  double[] energyBuffer = beatDetector.getEnergyBuffer(); //retrieves data from beatDetector
  int cursor = beatDetector.getEnergyCursor(); //length between beats converted into int
  float last = (float) energyBuffer[cursor] / 100 * height; //usinvg cursor and energybuffer, turn each beat detected into data



  strokeWeight(0.01*last);
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      //variables for our x and y positions
      float x = i*stepx;
      float y = j*stepy;

      //variable for our linesize

      stroke(0.4*last);
      fill(0);
      if (rms_scaled > 1800) {
        stroke(random(255), random(255), random(255)); 
      } else {
        stroke(0);
      }
      rect(x, y, 0.01*rms_scaled, 0.01*rms_scaled); //rect size based on peak amplitude data
    }
  }

  drawLines(stepx*(random(col)), stepy*(random(row)), last, stepy*(random(row))); 
 
}
