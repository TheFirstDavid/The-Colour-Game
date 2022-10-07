PImage ded;

void gameover() {
  music.pause();
  No.play();
  image(ded, 0, 0, width, height);
  
  lose.play();
  texts("High Score: " + highscore, 245, height/2 - 20, 50, black);
  texts("High Score: " + highscore, width/2, height/2 - 20, 50, white);
  texts("Score: " + score, 245, 270, 50, black);
  texts("Score: " + score, width/2, 270, 50, white);
  
  pushStyle();
  tactileButton(425, 425, 37.5);
  texts("Again", 425, 420, 40, border);
  popStyle();
}

void gameoverClicks() {
  No.pause();
  No.rewind();
  lives = 1;
  lose.pause();
  lose.rewind();
  music.rewind();
  clickableButton2(425, 425, 37.5);
}


//Neatening function for Gameover
void clickableButton2(int x, int y, float r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    mode = INTRO;
  }
}
