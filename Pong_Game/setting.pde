void setting() {
  background(buttonColour);
  settingBase();
  settingButtons();
  settingText();
}

//base ---------------------------------------------------------------------------------
void settingBase() {
  main.setGain(volume);
  for (int j = 0; j < soundEffects.length; j++) {
    soundEffects[j].setGain(volume2);
  }
  
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
  line(175, 155, 570, 155);
  line(175, 250, 570, 250);
  volume = map(sliderX1, 175, 570, -35, 35);
  volume2 = map(sliderX2, 175, 570, -35, 35);
  
  fill(255);
  stroke(0);
  tactileSlider(sliderX1, 140, 170);
  circle(sliderX1, 155, 30);
  fill(255);
  stroke(0);
  tactileSlider(sliderX2, 235, 265);
  circle(sliderX2, 250, 30);
  
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
  
  image(noSound, 150, 155, 20, 20);
  image(maxSound, 610, 155, 30, 30);
  image(noSound, 150, 250, 20, 20);
  image(maxSound, 610, 250, 30, 30);
}

void tactileSlider(float sliderX, int top, int bottom) {
  if (mouseX >= sliderX - 15 && mouseX <= sliderX + 15 && mouseY >= top && mouseY <= bottom) {
    strokeWeight(3);
    stroke(buttonColour);
    fill(buttonFilled);
  }
}

//buttons ------------------------------------------------------------------------------
void settingButtons() {
  //back
  strokeWeight(3);
  stroke(0);
  fill(transparent2);
  tactileRect2(50, 65, 50, 50);
  square(50, 65, 50);
  
  //mute sound buttons
  fill(transparent2);
  noStroke();
  tactileRect(600, 195, 15, 15);
  if (main.isMuted())
    fill(buttonColour);
  square(600, 195, 15);
  fill(transparent2);
  noStroke();
  tactileRect(600, 290, 15, 15);
  if (soundEffects[0].isMuted())
    fill(buttonColour);
  square(600, 290, 15);
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
  //sliders
  if (mouseX >= 175 && mouseX <= 570 && mouseY >= 140 && mouseY <= 170) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    sliderX1 = mouseX;
  }
  if (mouseX >= 175 && mouseX <= 570 && mouseY >= 235 && mouseY <= 265) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    sliderX2 = mouseX;
  }
  
  //mute
  if (mouseX >= 592.5 && mouseX <= 607.5 && mouseY >= 178.5 && mouseY <= 202.5) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    if (main.isMuted()) 
      main.unmute();
    else
      main.mute();
  }
  if (mouseX >= 592.5 && mouseX <= 607.5 && mouseY >= 282.5 && mouseY <= 297.5) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    if (soundEffects[0].isMuted()) {
      for (int j = 0; j < soundEffects.length; j++) {
        soundEffects[j].unmute();
      }
    }
    else {
      for (int j = 0; j < soundEffects.length; j++) {
        soundEffects[j].mute();
      }
    }
  }
  
  //others
  if (mouseX >= 25 && mouseX <= 75 && mouseY >= 40 && mouseY <= 90) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    mode = INTRO;
  }
    
  if (mouseX >= 37.5 && mouseX <= 212.5 && mouseY >= 325 && mouseY <= 375) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    players = 1;
    AI = true;
  }
  if (mouseX >= 487.5 && mouseX <= 662.5 && mouseY >= 325 && mouseY <= 375) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    players = 2;
    AI = false;
  }
    
  if (mouseX >= 262.5 && mouseX <= 437.5 && mouseY >= 325 && mouseY <= 375 && players == 2) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    freeplay = true;
  }
  else if (mouseX >= 262.5 && mouseX <= 437.5 && mouseY >= 325 && mouseY <= 375 || players == 1) {
    if (mouseX >= 262.5 && mouseX <= 437.5 && mouseY >= 325 && mouseY <= 375) {
      soundEffects[0].rewind();
      soundEffects[0].play();
    }
    freeplay = false;
  }
}

void settingsClicksDrag() {
  if (mouseX >= 175 && mouseX <= 570 && mouseY >= 140 && mouseY <= 170) {
    sliderX1 = mouseX;
  }
  if (mouseX >= 175 && mouseX <= 570 && mouseY >= 235 && mouseY <= 265) {
    sliderX2 = mouseX;
  }
}
