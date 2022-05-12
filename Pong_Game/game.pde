void game() {
  background(buttonColour);
  gameBase();
  gameMovement();
  theActualGame();
  gameButtons();
  gameText();
}

//base ---------------------------------------------------------------------------------
void gameBase() {
  strokeWeight(3);
  stroke(0);
  fill(0);
  line(350, 0, 350, 8);
  line(350, 72, 350, 400);
  fill(255, 255, 255, 150);
  
  //paddles
  fill(paddleColour1);
  circle(leftx, lefty, paddled);
  fill(paddleColour2);
  circle(rightx, righty, paddled);
  
  //ball
  fill(ballColour);
  circle(ballx, bally, balld);
  if (selectedBall == 2)
    image(ballDuck, ballx, bally, balld, balld);
  
  //base
  noStroke();
  fill(transparent1);
  rect(350, 40, 200, 60);
  rect(50, 350, 60, 70);
  rect(650, 350, 60, 70);
  fill(transparent2);
  rect(50, 363, 50, 35);
  rect(650, 363, 50, 35);
}

//movement -----------------------------------------------------------------------------
void gameMovement() {
  //left paddle
  if (wkey == true) lefty -= 5;
  if (skey == true) lefty += 5;
  lefty = min(lefty, height); //bottom
  lefty = max(lefty, 0); //top
  
  if (freeplay == true) {
    if (dkey == true) leftx += 5;
    if (akey == true) leftx -= 5;
  }
  leftx = min(leftx, (350 - paddled)); //right
  leftx = max(leftx, 0); //left
  
  //right paddle
  if (AI == false) {
    if (upkey == true) righty -= 5;
    if (downkey == true) righty += 5;
  }
  else if (AI == true && buttons[0] == 1) {
    if (ballx >= 350) {
      if (bally < righty) righty -= 3;
      if (bally > righty) righty += 3;
    }
  }
  else if (AI == true && buttons[1] == 1) {
    if (ballx >= 350) {
      if (bally < righty) righty -= 4;
      if (bally > righty) righty += 4;
    }
  }
  else if (AI == true && buttons[2] == 1) {
    if (ballx >= 350) {
      if (bally < righty) righty -= 5;
      if (bally > righty) righty += 5;
    }
  }
  righty = min(righty, height); //bottom
  righty = max(righty, 0); //top
  
  if (freeplay == true) {
    if (leftkey == true) rightx -= 5;
    if (rightkey == true) rightx += 5;
  }
  rightx = min(rightx, 700); //right
  rightx = max(rightx, 350 + paddled); //left
}

//main game movement -------------------------------------------------------------------
void theActualGame() {
  //ball bounce
  timer--;
  if (timer < 0) {
    ballx += ballvx;
    bally += ballvy;
  }
    
  //left
  if (dist(leftx, lefty, ballx, bally) <= paddled/2 + balld/2) {
    soundEffects[2].rewind();
    soundEffects[2].play();
    ballvx = (ballx - leftx) / 10;
    ballvy = (bally - lefty) / 10;
  }
  //right
  if (dist(rightx, righty, ballx, bally) <= paddled/2 + balld/2) {
    soundEffects[2].rewind();
    soundEffects[2].play();
    ballvx = (ballx - rightx) / 15;
    ballvy = (bally - righty) / 15;
  }
  if (bally - balld/2 <= 0 || bally + balld/2 >= 400)
    ballvy *= -1;
    
  //scores and stuff
  if (ballx <= 0) {
    timer = 100;
    scoreRight++;
    ballx = 350;
    bally = 200;
    righty = 200; rightx = 700;
    lefty = 200; leftx = 0;
  }
  if (ballx >= 700) {
    timer = 100;
    scoreLeft++;
    ballx = 350;
    bally = 200;
    righty = 200; rightx = 700;
    lefty = 200; leftx = 0;
  }
  
  //gameover
  if (scoreLeft == 3) {
    winner = 1;
    mode = GAMEOVER;
  }
  if (scoreRight == 3) {
    winner = 2;
    mode = GAMEOVER;
  }
}

//buttons ------------------------------------------------------------------------------
void gameButtons() {
  noStroke();
  fill(transparent2);
  tactileRect(350, 40, 185, 45);
  rect(350, 40, 185, 45);
}

//text ---------------------------------------------------------------------------------
void gameText() {
  fill(0);
  textSize(40);
  text("Pause", 350, 35);
  textSize(20);
  text("Score:", 50, 330);
  text("Score:", 650, 330);
  textSize(30);
  text(scoreLeft, 50, 358);
  text(scoreRight, 650, 358);
}

//clicks -------------------------------------------------------------------------------
void gameClicks() {
  if (mouseX >= 212.5 && mouseX <= 397.5 && mouseY >= 17.5 && mouseY <= 62.5) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    mode = PAUSE;
  }
}
