int lives = 1;
int score = 0;
int highscore = 0;
float textS = 10;
int fiftyChance = (int) random(0, 2);
boolean match = false;
int position = 250;
int move = -1;


void game() {
  //matching code
  if (fiftyChance == 1) {
    randomWord = randomColor;
  }

  while (fiftyChance == 0 && randomWord == randomColor) {
    randomWord = (int) random(0, 6);
    randomColor = (int) random(0, 6);
  }


  //Background
  background(255);
  fill(0);
  rect(0, 0, width/2, height);

  //Timer and expanding text
  fill(colors[randomColor]);
  textSize(textS);
  textS++;
  if (textS > 100) {
    lives--;
    textS = 10;
    randoms();
  }
  text(words[randomWord], width/2, position);

  //Movement code
  position = position + move;
  if (position < 225) move = move * -1;
  if (position > 275) move = move * -1;

  //Static Text
  texts("Matching", 130, 150, 40, white);
  texts("Not Matching", 370, 150, 40, black);
  texts("Score " + score, 450, 20, 20, black);


  //Matchign Code (Boolean)
  if (randomColor == randomWord) {
    match = true;
  } else {
    match = false;
  }

  //Dying
  if (lives == 0) {
    mode = GAMEOVER;
  }

  //Highscore
  if (score > highscore) {
    highscore = score;
  }
}

void gameClicks() {

  textS = 10;
  randoms();
  matchingButtons(0, width/2, 0, height, true, false);
  matchingButtons(width/2, width, 0, height, false, true);
}

void keyPressed() {
  textS = 10;
  randoms();
  if (keyCode == LEFT && mode == GAME) {
    if (match == true) {
      score++;
      success.rewind();
      success.play();
    } else {
      lives--;
    }
  }
  if (keyCode == RIGHT && mode == GAME) {
    if(match == false) {
      score++;
      success.rewind();
      success.play();
    } else {
      lives--;
    }
  }
}

void matchingButtons(int x1, int x2, int y1, int y2, boolean yes, boolean no) {
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2 && match == yes) {
    score++;
    success.rewind();
    success.play();
  } else if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2 && match == no) {
    lives--;
  }
}
//Randomization function for colours
void randoms() {
  fiftyChance = (int) random(0, 2); //This gives either 0 or 1, if it's 1, the colour will match the name
  randomWord = (int) random (0, 6);
  randomColor = (int) random (0, 6);
}


//Text function
void texts(String t, int x, int y, int s, int f) {
  pushStyle();
  fill(f);
  textSize(s);
  text(t, x, y);
  popStyle();
}
