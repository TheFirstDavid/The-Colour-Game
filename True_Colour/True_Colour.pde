import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer music;
AudioPlayer lose;
AudioPlayer success;
AudioPlayer No;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;

int randomWord = (int) random (0, 6);
int randomColor = (int) random (0, 6);

color white  = #ffffff;
color black  = #000000;
color red    = #fa003f;
color green  = #96e072;
color blue   = #3da5d9;
color yellow = #FAFF0A;
color orange = #FF790A;
color purple = #826aed;
color border = black;

//Arrays
String [] words = {"Red", "Green", "Blue", "Yellow", "Orange", "Purple"};
color[] colors = {red, green, blue, yellow, orange, purple};

PFont tombstone;

void setup() {
  minim = new Minim(this);
  lose = minim.loadFile("FAILURE.wav");
  success = minim.loadFile("SUCCESS.wav");
  music = minim.loadFile("music.wav");
  No = minim.loadFile("No.wav");
  size(500, 500);
  textAlign(CENTER, CENTER);
  textSize(100);
  mode = INTRO;
  
  //font
  tombstone = createFont("Tombstone.ttf", 1);
  
  //Image at Gameover
  ded = loadImage("ded.gif");
  
  //Intro Gif
  numberOfFrames = 33;
  gif = new PImage[numberOfFrames];
  int i = 0;
  while (i < numberOfFrames) {
    gif[i]= loadImage("frame_"+i+"_delay-0.05s.gif");
    i++;
  }
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode Error: Mode is " + mode);
  }
}
