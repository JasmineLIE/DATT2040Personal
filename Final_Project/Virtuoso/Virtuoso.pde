Painting paintObj;
Sculpture sculpObj;
Pottery pottObj;
PFont mono;

void setup() {
  size(1000, 800);
  mono=createFont("jupiterc.ttf", 24);
  textFont(mono);
  paintObj = new Painting(new PVector(10, 10), painting, (int)random(2), "painting.png", "painting.txt");
  sculpObj = new Sculpture(new PVector(10, 10), sculpture, (int)random(2), "sculpture.png", "sculpture.txt");
  pottObj = new Pottery(new PVector(10, 10), pottery, (int)random(2), "pottery.png", "pottery.txt");
}

void draw() {

  println("Is the painting haunted? " + paintObj.isHaunted);
  println("Is the sculpture haunted? " + sculpObj.isHaunted);
  println("Is the pottery haunted? " + pottObj.isHaunted);

  paintObj.verification(true);
  sculpObj.verification(false);
  pottObj.verification(true);

  paintObj.loadDocument();

  println("# Times correct: " + correctCount + "\n" + "# Times incorrect: " + falseCount);
  noLoop();
}
