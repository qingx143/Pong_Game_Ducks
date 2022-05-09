void intro() {
  background(#555E71);
  introBase();
  introAnimations();
  introDucks();
  introButtons();
  introText();
}

//base ---------------------------------------------------------------------------------
void introBase() {
  noStroke();
  fill(transparent1);
  rect(350, 270, 300, 220); // button base
}

//buttons ------------------------------------------------------------------------------
void introButtons() {
  strokeWeight(3);
  stroke(255, 255, 255, 0);
  fill(transparent2);
  tactileRect(350, 202.5, 250, 35);
  rect(350, 202.5, 250, 35); // play
  stroke(255, 255, 255, 0);
  fill(transparent2);
  tactileRect(350, 247.5, 250, 35);
  rect(350, 247.5, 250, 35); // difficulty
  stroke(255, 255, 255, 0);
  fill(transparent2);
  tactileRect(350, 292.5, 250, 35);
  rect(350, 292.5, 250, 35); // selection
  stroke(255, 255, 255, 0);
  fill(transparent2);
  tactileRect(350, 337.5, 250, 35);
  rect(350, 337.5, 250, 35); // settings
}

//text ---------------------------------------------------------------------------------
void introText() {
  fill(#A6B4D1);
  textSize(100);
  text("Pong!", 350, 70);
  fill(0);
  textSize(25);
  text("play", 350, 198.5);
  text("difficulty", 350, 243.5);
  text("selection", 350, 288.5);
  text("settings", 350, 333.5);
}

void introDucks() { //340 per round
  count++;
  if (count < 20) // duck 1
    image(introDuck2, 55, 340, 90, 90);
  else if (count < 280) 
    image(introDuck1, 55, 340, 90, 90);
  else 
    image(introDuck2, 55, 340, 90, 90);
    
  if (count < 138) // duck 2
    image(introDuck3, 645, 340, 90, 90);
  else if (count < 163)
    image(introDuck4, 645, 340, 90, 90);
  else 
    image(introDuck3, 645, 340, 90, 90);
  
  if (count == 285)
    count = 0;
}

void introAnimations() {
  pushMatrix();
  translate(350, 400);
  strokeWeight(3);
  stroke(0);
  fill(255);
  rotate(radians(ballSpin));
  ballSpin += a;
  if (ballSpin >= 142) 
    a = -1;
  if (ballSpin <= 0)
    a = 1;
  circle(-275, -100, 30);
  popMatrix();
}

//clicks -------------------------------------------------------------------------------
void introClicks() {
  if (mouseX >= 225 && mouseX <= 475 && mouseY >= 185 && mouseY <= 220)
    mode = GAME;
  if (mouseX >= 225 && mouseX <= 475 && mouseY >= 230 && mouseY <= 265)
    mode = MODES;
  if (mouseX >= 225 && mouseX <= 475 && mouseY >= 275 && mouseY <= 310)
    mode = SELECTION;
  if (mouseX >= 225 && mouseX <= 475 && mouseY >= 320 && mouseY <= 355)
    mode = SETTING;
}
