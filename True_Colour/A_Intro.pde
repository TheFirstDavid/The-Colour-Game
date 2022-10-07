int ts = 30;
int s = 2;
PImage[] gif;
int numberOfFrames;
int f;

void intro() {
  music.play();
  score = 0;
  //GIf
  image(gif[f], 0, 0, width, height);
  if (frameCount % 3 == 0) f++;
  if (f == numberOfFrames) f = 0;

  //Intro Text
  textFont(tombstone);
  texts("True Colour", width/2, height/2, ts, white);
  ts = ts + s;
  if (ts > 150) {
    s = s * -1;
  } else if (ts < 30) {
    s = s * -1;
  }
  
  //Button
  pushStyle();
  tactileButton(425, 425, 37.5);
  texts("Play!", 425, 425, 40, border);
  popStyle();
}

void introClicks() {
   clickableButton(425, 425, 37.5);
} 


//Function to make Intro code look neater
void clickableButton(int x, int y, float r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    mode = GAME;
  }
}


//Button function
void tactileButton(int x, int y, float r) {
  strokeWeight(5);
  fill(white);
  stroke(border);
  circle(x, y, 2*r);
  if(dist(x, y, mouseX, mouseY) < r) {
    border = orange;
  } else {
    border = black;
  }
}
