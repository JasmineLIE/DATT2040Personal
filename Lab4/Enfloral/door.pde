boolean hasKey = false;

void mouseReleased() {
  if (hasKey && gameMode == "Door" && itemDragged) {
    gameMode = "End";
    doorOpen.play();
  }
}
