void modes() {
  background(buttonColour);
  modesBase();
  modesButtons();
  modesText();
  modeSwitch();
}

//base ---------------------------------------------------------------------------------
void modesBase() {
  strokeWeight(3);
  stroke(0);
  fill(transparent1);
  rect(350, 65, 500, 75); // sign layer 1
  fill(transparent2);
  rect(350, 65, 500, 75); // sign layer 2
  fill(255);
  if (buttons[0] == 1)
    stroke(#9DB2DB);
  else 
    stroke(0);
  tactileRect2(135, 250, 200, 250);
  fill(255);
  rect(135, 250, 200, 250); // easy
  if (buttons[1] == 1)
    stroke(#9DB2DB);
  else
    stroke(0);
  tactileRect2(350, 250, 200, 250);
  fill(255);
  rect(350, 250, 200, 250); // normal
  if (buttons[2] == 1)
    stroke(#9DB2DB);
  else 
    stroke(0);
  tactileRect2(565, 250, 200, 250);
  fill(255);
  rect(565, 250, 200, 250); // hard
  
  //difficulty signs
  noStroke();
  fill(0, 0, 0, 120);
  rect(135.5, 346.5, 197, 55);
  rect(350.5, 346.5, 197, 55);
  rect(565.5, 346.5, 197, 55);
}

//buttons ------------------------------------------------------------------------------
void modesButtons() {
  //back button
  strokeWeight(3);
  stroke(0);
  fill(transparent2);
  tactileRect2(50, 65, 50, 50);
  square(50, 65, 50);
}

//text ---------------------------------------------------------------------------------
void modesText() {
  fill(0);
  textSize(50);
  text("Select a Difficulty Level", 350, 55);
  textSize(20);
  text("Back", 50, 62);
  textSize(45);
  if (buttons[0] == 1)
    fill(255);
  else
    fill(0);
  text("Easy", 135, 337);
  if (buttons[1] == 1)
    fill(255);
  else
    fill(0);
  text("Normal", 350, 337);
  if (buttons[2] == 1)
    fill(255);
  else
    fill(0);
  text("Hard", 565, 337);
}

//modes switch -------------------------------------------------------------------------
void modeSwitch() {
  if (buttons[0] == 1) {
    paddled = 200;
    balld = 100;
  }
  if (buttons[1] == 1) {
    paddled = 150;
    balld = 75;
  }
  if (buttons[2] == 1) {
    paddled = 100;
    balld = 50;
  }
}

//buttons switch -----------------------------------------------------------------------
void buttonSwitch(int n) {
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = -1;
  }
  buttons[n] = 1;
}

//clicks -------------------------------------------------------------------------------
void modesClicks() {
  //buttons
  if (mouseX >= 35 && mouseX <= 235 && mouseY >= 125 && mouseY <= 375)
    buttonSwitch(0);
  if (mouseX >= 250 && mouseX <= 450 && mouseY >= 125 && mouseY <= 375)
    buttonSwitch(1);
  if (mouseX >= 465 && mouseX <= 665 && mouseY >= 125 && mouseY <= 375)
    buttonSwitch(2);
  
  if (mouseX >= 25 && mouseX <= 75 && mouseY >= 40 && mouseY <= 90)
    mode = INTRO;
}
