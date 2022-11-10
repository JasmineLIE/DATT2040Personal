Painting paintObj;
Sculpture sculpObj;
Pottery pottObj;

PImage painting, sculpture, pottery;

void setup() {
  size(1000, 800);
paintObj = new Painting(new PVector(10,10), painting, (int)random(2), "painting.png");
sculpObj = new Sculpture(new PVector(10,10), sculpture, (int)random(2), "sculpture.png");
pottObj = new Pottery(new PVector(10,10), pottery, (int)random(2), "pottery.png");

}

void draw() {
 
 println("Is the painting haunted? " + paintObj.isHaunted);
 println("Is the sculpture haunted? " + sculpObj.isHaunted);
 println("Is the pottery haunted? " + pottObj.isHaunted);
 
 paintObj.verification(true);
 sculpObj.verification(false);
 pottObj.verification(true);
 
 println("# Times correct: " + correctCount + "\n" + "# Times incorrect: " + falseCount);
noLoop();
}
