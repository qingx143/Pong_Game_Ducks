/*
Zi Qing Xiong
2-1
April 12, 2022
Pong Game

Planning:
- Ducks in Space?
- Mikrokosmos...?

To Do:
- intro
  - play button
  - modes button
  - selection button
  - settings button
- settings
  - music volume
  - sound effects volume
- selection
  - changes size of target
  - changes target
  - changes colour of paddle
- modes
  - don't touch the target?
  - hit the target with something else?
  - check out different possible modes
- game
  - 
- pause
  - animation?
- gameover
  - winner
  - animation?

Other:
  - draw background photo
  - find target photos 
  - decide on theme
  - find music for game (LoZ, Mario?)
  
Problems:
  - Player Two Left Button - Selection
  - Freeplay - Two Player Mode Malfuctions
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
int[] ballDesign = new int[3];
color paddleColour1;
color paddleColour2;
color ballColour = 200;

//animations and photos ----------------------------------------------------------------
PImage introDuck1, introDuck2, introDuck3, introDuck4;

//music --------------------------------------------------------------------------------
Minim minim;
AudioPlayer main;

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
int timer = 100;
int[] buttons = new int[3];
int scoreLeft = 0;
int scoreRight = 0;
int players = 1;
int winner = 0;
float ballSpin = 0;
float a = 1;
boolean freeplay = false;
int selectedPaddleLeft = 0;
int selectedPaddleRight = 0;
int selectedBall = 0;
boolean AI = true;

void setup() {
  size(700, 400); //halfway mark = (350, 200)
  
  //sound
  minim = new Minim(this);
  
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
  mode = PAUSE;
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

//tactile circle buttons ---------------------------------------------------------------
