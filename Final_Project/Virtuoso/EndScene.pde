String [] edDialogue = {
  "The exhibition was a success!  Thank goodness all went smooth.",
  "Even Director Grey herself came out to congratulate me, alongside head curator Winters.",
  "Grey apologized for what she told just before my exhibit.  She figured how nervous her 'rumours' made me.",
  "I told her it was fine.  I didn't tell her about the part where I snuck into the museum.",
  "But it all worked out in the end, anyway.",
};
PImage [] edImages;
String goodED = "Things are finally looking up!";
String badED = "Yet... why do I still feel something off?";
boolean endReveal;
float tintOp;
void endManager() {
  background(0);
  tint(255, tintOp);
  if (!endReveal) {
    tintOp++;
    image(edImages[imgCount], width/2, height/2);
    if (tintOp >= 255) {
      typeWriter(edDialogue[imgCount], 5, #EAE295, 25, new PVector(width/2, 750));
      textSize(30);
      fill(#9D9D9D);
      text(s, width/2, 50);
    }
  } else {
    if (correctCount > falseCount) {
      typeWriter(goodED, 10, #21FF00, 40, new PVector(width/2, height/2));
    } else if (falseCount > correctCount) {
      typeWriter(badED, 15, #FF0D00, 40, new PVector(width/2, height/2));
    }
    textSize(30);
    fill(#9D9D9D);
    text("Thank you for playing!", width/2, 50);
    text("Click anywhere to restart!", width/2, 750);
  }
}
