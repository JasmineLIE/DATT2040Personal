void reset() {
  paintObj = new Painting((int)random(2), "img/exhibit1.png", "img/exhibit1Inspec.png", "txt/painting.txt", "img/cursed1.png");
  sculpObj = new Sculpture( (int)random(2), "img/exhibit2.png", "img/exhibit2Inspec.png", "txt/sculpture.txt", "img/cursed.png");
  pottObj = new Pottery((int)random(2), "img/exhibit3.png", "img/exhibit3Inspec.png", "txt/pottery.txt", "img/cursed.png");

  docClicked = false;
  isPrinting = true;
  paperPrinted = false;
  acc = new PVector (1, 0);
  printerPos = new PVector(475, 160);
  paperPos = new PVector(475, 200);

  correctCount = 0;
  falseCount = 0;
  printTrigger = 0;
  endReveal = false;
  tintOp = 0;

  songTrigger = 0;
  gameState = 0;
  buttonVisibility = true;

  artState = "painting";

  isPressed = true;
  counter = 0;

  introState = 0;
  imgCount = 0;

  col = 15;
  row = 15;

  decrement = 0;
}
