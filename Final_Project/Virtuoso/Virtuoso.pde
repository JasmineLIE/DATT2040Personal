Painting paintObj;
Sculpture sculpObj;
Pottery pottObj;
PFont mono;

void setup() {
  imageMode(CENTER);
  size(1000, 800);
  mono=createFont("jupiterc.ttf", 24);
  textAlign(CENTER);
  textFont(mono);
  paintObj = new Painting(new PVector(10, 10), painting, paintInspec, (int)random(2), "img/exhibit1.png", "img/exhibit1.png", "txt/painting.txt");
  sculpObj = new Sculpture(new PVector(10, 10), sculpture, sculpInspec, (int)random(2), "img/exhibit2.png", "img/exhibit2.png", "txt/sculpture.txt");
  pottObj = new Pottery(new PVector(10, 10), pottery, pottInspec, (int)random(2), "img/exhibit3.png", "img/exhibit3.png", "txt/pottery.txt");
  office = loadImage("img/officeDesk.png");
  ovilus = loadImage("img/ovilus.png");

  stepx = width/col; //for grid shaping
  stepy = height/row; //for grid shaping
}

void draw() {
  background(0);
  if (key == '0') {
    location = "Exibit";
    gameStateManager(0);
  } else if (key == '1') {
    location = "Office";
    gameStateManager(1);
  } else if (key=='2') {
    location = "Ovilus";
    gameStateManager(2);
  }
}
