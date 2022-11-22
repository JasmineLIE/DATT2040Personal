void endManager() {
  float fadeIn = lerp(0, 255, 0.1);
  background(255-fadeIn);
  if (fadeIn == 255) {
    if (correctCount > falseCount) {
    } else if (falseCount > correctCount) {
    }
  }
}
