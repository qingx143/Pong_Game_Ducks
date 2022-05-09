void pause() {
  background(buttonColour);
  pauseBase();
  pauseButtons();
  pauseText();
}

//base ---------------------------------------------------------------------------------
void pauseBase() {
  strokeWeight(3);
  stroke(0);
  fill(transparent1);
  rect(350, 65, 500, 75); // sign layer 1
  fill(transparent2);
  rect(350, 65, 500, 75); // sign layer 2
}

//buttons ------------------------------------------------------------------------------
void pauseButtons() {
  strokeWeight(3);
  stroke(0);
  fill(255);
  tactileRect2(150, 325, 175, 50);
  rect(150, 325, 175, 50);
  fill(255);
  stroke(0);
  tactileRect2(550, 325, 175, 50);
  rect(550, 325, 175, 50);
}

//text ---------------------------------------------------------------------------------
void pauseText() {
  fill(0);
  textSize(50);
  text("Paused", 350, 55);
  
  textSize(27);
  text("Back to Game", 150, 320);
  text("Back to Menu", 550, 320);
}

//clicks -------------------------------------------------------------------------------
void pauseClicks() {
  if (mouseX >= 62.5 && mouseX <= 237.5 && mouseY >= 300 && mouseY <= 350) 
    mode = GAME;
    
  if (mouseX >= 462.5 && mouseX <= 637.5 && mouseY >= 300 && mouseY <= 350) {
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
}
