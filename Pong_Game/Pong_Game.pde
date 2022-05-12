/*
Zi Qing Xiong
2-1
April 12, 2022
Pong Game

Please Note: Freeplay mode is for two players only - will not work for one player, thank you!
*/

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode = 0;
final int INTRO = 1;
final int SETTING = 2;
final int SELECTION = 3;
final int MODES = 4;
final int GAME = 5;
final int PAUSE = 6;
final int GAMEOVER = 7;

//colours ------------------------------------------------------------------------------
color buttonColour = #555E71;
color buttonFilled = #D3DAEA;
color transparent1 = color(255, 255, 255, 150);
color transparent2 = color(255, 255, 255, 200);
int[] player1Colours = new int[7];
int[] player2Colours = new int[7];
color paddleColour1;
color paddleColour2;
color ballColour = 200;

//animations and photos ----------------------------------------------------------------
PImage introDuck1, introDuck2, introDuck3, introDuck4;
PImage pauseDuck;
PImage ballDuck;
PImage easyMode, normalMode, hardMode;
PImage noSound, maxSound;
PImage[] loseDucks = new PImage[7];
PImage[] winDucksR = new PImage[7];
PImage[] winDucksL = new PImage[7];

//music --------------------------------------------------------------------------------
Minim minim;
AudioPlayer main;
AudioPlayer[] soundEffects = new AudioPlayer[3];
float volume = -10;
float volume2 = 0;

//paddles & ball -----------------------------------------------------------------------
float leftx = 0;
float lefty = 200;
float paddled = 150;

float rightx = 700;
float righty = 200;

float ballx = 350;
float bally = 200;
float balld = 75;

float ballvx = random(-3, 3);
float ballvy = random(-3, 3);

//keyboard -----------------------------------------------------------------------------
boolean akey = false;
boolean skey = false;
boolean wkey = false;
boolean dkey = false;

boolean leftkey = false;
boolean upkey = false;
boolean downkey = false;
boolean rightkey = false;

//other --------------------------------------------------------------------------------
int count = 0;
int count2 = 0;
int timer = 100;
int[] buttons = new int[3];
int scoreLeft = 0;
int scoreRight = 0;
int players = 1;
int winner = 1;
float ballSpin = 0;
float a = 1;
boolean freeplay = false;
int selectedPaddleLeft = 0;
int selectedPaddleRight = 5;
int selectedBall = 1;
boolean AI = true;
float sliderX1 = 372.5;
float sliderX2 = 372.5;

void setup() {
  size(700, 400); //halfway mark = (350, 200)
  
  //sound
  minim = new Minim(this);
  main = minim.loadFile("lozmain.mp3");
  soundEffects[0] = minim.loadFile("selection.mp3");
  soundEffects[1] = minim.loadFile("choices.mp3");
  soundEffects[2] = minim.loadFile("bump.mp3");
  
  //buttons
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = -1;
  }
  buttons[1] = 1;
  
  //images
  introDuck1 = loadImage("IntroDuck1.PNG");
  introDuck2 = loadImage("IntroDuck2.PNG");
  introDuck3 = loadImage("IntroDuck3.PNG");
  introDuck4 = loadImage("IntroDuck4.PNG");
  
  pauseDuck = loadImage("PauseDuck.PNG");
  
  ballDuck = loadImage("BallDuck.PNG");
  
  easyMode = loadImage("EasyMode.PNG");
  normalMode = loadImage("NormalMode.PNG");
  hardMode = loadImage("HardMode.PNG");
  
  noSound = loadImage("NoSound.PNG");
  maxSound = loadImage("MaxSound.PNG");
  
  loseDucks[0] = loadImage("LoseDuck1.PNG");
  loseDucks[1] = loadImage("LoseDuck2.PNG");
  loseDucks[2] = loadImage("LoseDuck3.PNG");
  loseDucks[3] = loadImage("LoseDuck4.PNG");
  loseDucks[4] = loadImage("LoseDuck5.PNG");
  loseDucks[5] = loadImage("LoseDuck6.PNG");
  loseDucks[6] = loadImage("LoseDuck7.PNG");
  
  winDucksR[0] = loadImage("WinDuck1R.PNG");
  winDucksR[1] = loadImage("WinDuck2R.PNG");
  winDucksR[2] = loadImage("WinDuck3R.PNG");
  winDucksR[3] = loadImage("WinDuck4R.PNG");
  winDucksR[4] = loadImage("WinDuck5R.PNG");
  winDucksR[5] = loadImage("WinDuck6R.PNG");
  winDucksR[6] = loadImage("WinDuck7R.PNG");
  
  winDucksL[0] = loadImage("WinDuck1L.PNG");
  winDucksL[1] = loadImage("WinDuck2L.PNG");
  winDucksL[2] = loadImage("WinDuck3L.PNG");
  winDucksL[3] = loadImage("WinDuck4L.PNG");
  winDucksL[4] = loadImage("WinDuck5L.PNG");
  winDucksL[5] = loadImage("WinDuck6L.PNG");
  winDucksL[6] = loadImage("WinDuck7L.PNG");
  
  //colours
  player1Colours[0] = #90B6FF;
  player1Colours[1] = #FFF690;
  player1Colours[2] = #FFCA90;
  player1Colours[3] = #B8FF90;
  player1Colours[4] = #FFB9D8;
  player1Colours[5] = color(255, 144, 144);
  player1Colours[6] = #D1A7FF;
  
  player2Colours[0] = #90B6FF;
  player2Colours[1] = #FFF690;
  player2Colours[2] = #FFCA90;
  player2Colours[3] = #B8FF90;
  player2Colours[4] = #FFB9D8;
  player2Colours[5] = color(255, 144, 144);
  player2Colours[6] = #D1A7FF;
  
  paddleColour1 = player1Colours[0];
  paddleColour2 = player2Colours[5];
  
  //other
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  mode = SETTING;
  main.setGain(volume);
  main.loop();
}

void draw() { 
  if (mode == INTRO) 
    intro();
  else if (mode == SETTING) 
    setting();
  else if (mode == SELECTION) 
    selection();
  else if (mode == MODES)
    modes();
  else if (mode == GAME) 
    game();
  else if (mode == PAUSE) 
    pause();
  else if (mode == GAMEOVER) 
    gameover();
  else 
    println("Error: Mode = " + mode);
}

//tactile rectangular buttons ----------------------------------------------------------
void tactileRect(int x, double y, int w, int h) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    strokeWeight(3);
    stroke(buttonColour);
    fill(buttonFilled);
  }
}

//tactile rectangular buttons ----------------------------------------------------------
void tactileRect2(int x, double y, int w, int h) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    stroke(#9DB2DB);
    fill(#EDF2FA);
  }
}
