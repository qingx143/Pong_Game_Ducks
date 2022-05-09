void gameover() {
  background(buttonColour);
  gameoverBase();
  gameoverButtons();
  gameoverText();
}

//base ---------------------------------------------------------------------------------
void gameoverBase() {
  strokeWeight(3);
  stroke(0);
  fill(transparent2);
  rect(350, 65, 500, 75); // sign layer 2
}

//buttons ------------------------------------------------------------------------------
void gameoverButtons() {
  strokeWeight(3);
  stroke(0);
  fill(transparent1);
  tactileRect2(150, 325, 175, 50);
  rect(150, 325, 175, 50);
  fill(transparent1);
  stroke(0);
  tactileRect2(550, 325, 175, 50);
  rect(550, 325, 175, 50);
}

//text ---------------------------------------------------------------------------------
void gameoverText() {
  textSize(50);
  if (winner == 1) {
    fill(paddleColour1);
    text("Player 1 Wins!", 350, 55);
  }
  else if (winner == 2) {
    fill(paddleColour2);
    text("Player 2 Wins!", 350, 55);
  }
  
  textSize(40);
  fill(0);
  text("Retry", 150, 320);
  text("Exit", 550, 320);
}

//clicks -------------------------------------------------------------------------------
void gameoverClicks() {
  if (mouseX >= 62.5 && mouseX <= 237.5 && mouseY >= 300 && mouseY <= 350) {
    mode = INTRO;
    scoreRight = 0;
    scoreLeft = 0;
    lefty = 200;
    righty = 200;
    rightx = 700;
    leftx = 0;
    ballx = 350;
    bally = 200;
    timer = 100;
  }
  if (mouseX >= 462.5 && mouseX <= 637.5 && mouseY >= 300 && mouseY <= 350) 
    exit();
}
