void selection() {
  background(buttonColour);
  selectionBase();
  coverups();
  selectionButtons();
  selectionText();
}

//base ---------------------------------------------------------------------------------
void selectionBase() {
  strokeWeight(3);
  stroke(0);
  //mini game display
  fill(#707B8E);
  rect(350, 100, 275, 125);
  strokeWeight(2);
  stroke(buttonColour);
  line(350, 37.5, 350, 162.5);
  
  strokeWeight(3);
  stroke(0);
  fill(paddleColour1);
  circle(212.5, 100, 75); // left
  fill(paddleColour2);
  circle(487.5, 100, 75); // right
  fill(ballColour);
  circle(350, 100, 40); // ball
  
  //selection
  fill(paddleColour1);
  circle(125, 240, 125); // left
  fill(paddleColour2);
  circle(575, 240, 125); // right
  fill(ballColour);
  circle(350, 285, 100); // ball
  
  strokeWeight(1);
  fill(#707B8E);
  
  circleSelection1(0);
  circle(95, 312, 7); // left
  
  circleSelection1(1);
  circle(105, 312, 7);
  
  circleSelection1(2);
  circle(115, 312, 7);
  
  circleSelection1(3);
  circle(125, 312, 7);
  
  circleSelection1(4);
  circle(135, 312, 7);
  
  circleSelection1(5);
  circle(145, 312, 7);
  
  circleSelection1(6);
  circle(155, 312, 7);
  
  circleSelection2(0);
  circle(545, 312, 7); // right
  
  circleSelection2(1);
  circle(555, 312, 7);
  
  circleSelection2(2);
  circle(565, 312, 7);
  
  circleSelection2(3);
  circle(575, 312, 7);
  
  circleSelection2(4);
  circle(585, 312, 7);
  
  circleSelection2(5);
  circle(595, 312, 7);
  
  circleSelection2(6);
  circle(605, 312, 7);
}

//circle selection stuff ---------------------------------------------------------------
void circleSelection1(int i) {
  if (player1Colours[i] == paddleColour1)
    stroke(255);
  else 
    stroke(0);
}

//circle selection stuff ---------------------------------------------------------------
void circleSelection2(int i) {
  if (player2Colours[i] == paddleColour2)
    stroke(255);
  else 
    stroke(0);
}

//buttons ------------------------------------------------------------------------------
void selectionButtons() {
  //back
  strokeWeight(3);
  stroke(0);
  fill(transparent2);
  tactileRect2(50, 65, 50, 50);
  square(50, 65, 50);
  
  //arrow buttons things left to right
  noStroke();
  fill(transparent1);
  tactileRect2(40, 240, 25, 50);
  rect(40, 240, 25, 50);
  fill(transparent2);
  triangle(35, 240, 45, 230, 45, 250);
  
  noStroke();
  fill(transparent1);
  tactileRect2(210, 240, 25, 50);
  rect(210, 240, 25, 50);
  fill(transparent2);
  triangle(215, 240, 205, 230, 205, 250);
  
  noStroke();
  fill(transparent1);
  tactileRect2(280, 285, 25, 50);
  rect(280, 285, 25, 50);
  fill(transparent2);
  triangle(275, 285, 285, 275, 285, 295);
  
  noStroke();
  fill(transparent1);
  tactileRect2(420, 285, 25, 50);
  rect(420, 285, 25, 50);
  fill(transparent2);
  triangle(425, 285, 415, 275, 415, 295);
  
  noStroke();
  fill(transparent1);
  tactileRect2(490, 240, 25, 50);
  rect(490, 240, 25, 50);
  fill(transparent2);
  triangle(485, 240, 495, 230, 495, 250);
  
  noStroke();
  fill(transparent1);
  tactileRect2(660, 240, 25, 50);
  rect(660, 240, 25, 50);
  fill(transparent2);
  triangle(665, 240, 655, 230, 655, 250);
}

//text ---------------------------------------------------------------------------------
void selectionText() {
  fill(0);
  textSize(20);
  text("Back", 50, 62);
  
  fill(0);
  textSize(30);
  text("Player 1", 125, 235);
  text("Player 2", 575, 235);
  textSize(30);
  text("Ball", 350, 282);
}

void coverups() {
  noStroke();
  fill(buttonColour);
  rect(188, 100, 50, 100);
  rect(512, 100, 50, 100);
  strokeWeight(3);
  stroke(0);
  noFill();
  rect(350, 100, 275, 125);
}

//clicks -------------------------------------------------------------------------------
void selectionClicks() {
  if (mouseX >= 25 && mouseX <= 75 && mouseY >= 40 && mouseY <= 90)
    mode = INTRO;
    
  //arrow buttons left to right
  if (mouseX >= 27.5 && mouseX <= 52.5 && mouseY >= 215 && mouseY <= 265) {
    if (player1Colours[0] != paddleColour1) {
      paddleColour1 = player1Colours[selectedPaddleLeft - 1];
      selectedPaddleLeft--;
    }
    else
      paddleColour1 = player1Colours[0];
  }
    
  if (mouseX >= 197.5 && mouseX <= 222.5 && mouseY >= 215 && mouseY <= 265) {
    if (player1Colours[6] != paddleColour1) {
      paddleColour1 = player1Colours[selectedPaddleLeft + 1];
      selectedPaddleLeft++;
    }
    else
      paddleColour1 = player1Colours[6];
  }
  
  if (mouseX >= 267.5 && mouseX <= 292.5 && mouseY >= 255 && mouseY <= 310) {
  }
  
  if (mouseX >= 407.5 && mouseX <= 432.5 && mouseY >= 255 && mouseY <= 310) {
  }
  
  if (mouseX >= 477.5 && mouseX <= 502.5 && mouseY >= 215 && mouseY <= 265) {
    if (player2Colours[0] != paddleColour2) {
      paddleColour2 = player2Colours[selectedPaddleRight - 1];
      selectedPaddleRight--;
    }
    else
      paddleColour2 = player2Colours[0];
  }
  
  if (mouseX >= 647.5 && mouseX <= 672.5 && mouseY >= 215 && mouseY <= 265) {
    if (player2Colours[6] != paddleColour2) {
      paddleColour2 = player2Colours[selectedPaddleRight + 1];
      selectedPaddleRight++;
    }
    else
      paddleColour2 = player2Colours[6];
  }
}
