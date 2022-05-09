void setting() {
  background(buttonColour);
  settingBase();
  settingButtons();
  settingText();
}

//base ---------------------------------------------------------------------------------
void settingBase() {
  strokeWeight(3);
  stroke(0);
  fill(transparent1);
  rect(350, 65, 500, 75); // sign layer 1
  fill(transparent2);
  rect(350, 65, 500, 75); // sign layer 2
  
  noStroke();
  fill(transparent1);
  rect(350, 215, 600, 185, 30);
  fill(transparent2);
  
  //details of sliders
  fill(transparent2);
  rect(380, 155, 500, 50, 15);
  rect(380, 250, 500, 50, 15);
  
  strokeWeight(3);
  stroke(buttonColour);
  line(180, 155, 580, 155);
  line(180, 250, 580, 250);
  
  strokeWeight(5);
  stroke(buttonColour);
  line(60, 215, 640, 215);
  
  //1 player
  noStroke();
  fill(transparent1);
  rect(125, 350, 175, 50);
  if (players == 1) {
    strokeWeight(3);
    stroke(#9DB2DB);
    fill(#EDF2FA);
  }
  else 
    fill(transparent2);
  tactileRect2(125, 350, 175, 50);
  rect(125, 350, 175, 50);
  
  noStroke();
  fill(transparent1);
  rect(575, 350, 175, 50);
  if (players == 2) {
    strokeWeight(3);
    stroke(#9DB2DB);
    fill(#EDF2FA);
  }
  else 
    fill(transparent2);
  tactileRect2(575, 350, 175, 50);
  rect(575, 350, 175, 50);
  
  //freeplay
  noStroke();
  if (freeplay == true && players == 2) {
    strokeWeight(3);
    stroke(#9DB2DB);
    fill(#EDF2FA);
  }
  else if (freeplay == false || players == 1)
    fill(transparent2);
  tactileRect2(350, 350, 175, 50);
  rect(350, 350, 175, 50);
}

//buttons ------------------------------------------------------------------------------
void settingButtons() {
  //back
  strokeWeight(3);
  stroke(0);
  fill(transparent2);
  tactileRect2(50, 65, 50, 50);
  square(50, 65, 50);
}

//text ---------------------------------------------------------------------------------
void settingText() {
  fill(0);
 
  textSize(20);
  text("Back", 50, 62);
  
  textSize(50);
  text("Settings", 350, 55);
  
  textSize(40);
  if (players == 1)
    fill(#9DB2DB); 
  else 
    fill(0);
  text("1 Player", 125, 342);
  if (players == 2)
    fill(#9DB2DB);
  else 
    fill(0);
  text("2 Players", 575, 342);
  
  textSize(40);
  if (freeplay == true && players == 2)
    fill(#9DB2DB);
  else if (freeplay == false || players == 1)
    fill(0);
  text("Freeplay", 350, 342);
  
  fill(0);
  textSize(30);
  text("BGM", 90, 152);
  text("SFX", 85, 247);
 
  textSize(25);
  text("Adjusts the volume of the music", 230, 192);
  text("Adjusts the volume of the sound effects", 270, 287);
}

//clicks -------------------------------------------------------------------------------
void settingsClicks() {
  if (mouseX >= 25 && mouseX <= 75 && mouseY >= 40 && mouseY <= 90)
    mode = INTRO;
    
  if (mouseX >= 37.5 && mouseX <= 212.5 && mouseY >= 325 && mouseY <= 375) {
    players = 1;
    AI = true;
  }
  if (mouseX >= 487.5 && mouseX <= 662.5 && mouseY >= 325 && mouseY <= 375) {
    players = 2;
    AI = false;
  }
    
  if (mouseX >= 262.5 && mouseX <= 437.5 && mouseY >= 325 && mouseY <= 375 && players == 2) 
    freeplay = true;
  else if (mouseX >= 262.5 && mouseX <= 437.5 && mouseY >= 325 && mouseY <= 375 || players == 1)
    freeplay = false;
}
