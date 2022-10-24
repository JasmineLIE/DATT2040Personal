/*
* To apply the Loch rules and principles of recursion, going to use method of storing two generations of changes; cuurent and next
 
 * Upon finishing computing the next generation, next becomes current and then we compute a new generation
 
 * Will use ArrayList to keep track of current set of kochLine objects (at the start of program, we have one)
 
 * We will use another ArrayList to place all new KochLine objects that are generated from applying Koch rules
 
 * For every KochLine object in current ArrayList, four new KochLine objects are added to the next ArrayList
 
 * When we're done, the next ArrayList becomes the current one
 */

ArrayList<KochLine> lines; //declare object array list-- this will keep track of our objects which we will add to continously

int kochCount = 1;
void setup() {
  size(600, 300);

  lines = new ArrayList<KochLine>(); //create the array list

  PVector start = new PVector(0, 200); //left side of window
  PVector end = new PVector(width, 200); //right side of window

  lines.add(new KochLine(start, end)); //the first KochLine object

}

void draw() {

  background(0); 
  for (KochLine l : lines) { //run the KochLine methods for all KochLine objects with this loop
    l.display();
  }
  delay(1000); // Learnt via Processing Ref: https://processing.org/reference/delay_.html
}

void generate() {
  //by calling this function repeatedly we can recursively apply Koch curve rules to the existing set of KochLine objects
  //The KochLine object will have five functions, each of which return a PVector according to the Koch Rules
  ArrayList next = new ArrayList<KochLine>();
  for (KochLine l : lines) {
    PVector a = l.kochA();
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();

    next.add(new KochLine(a, b));
    next.add(new KochLine(b, c));
    next.add(new KochLine(c, d));
    next.add(new KochLine(d, e));
  }  
  lines = next; //set the ArrayList declared before at the beginning of the sketch to the 'next' ArrayList
}

void mousePressed() { //click to add more lines, 
 
 if (kochCount < 3) {
 kochCount++; 
   for (int i = 0; i <kochCount; i++) {
    generate();
  }
 }
}
