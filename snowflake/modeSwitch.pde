int selection = 0;
int autoX, autoY;
int drawX, drawY;
int resetX, resetY;
int buttonH = 40;
int buttonW = 120;

String autoTxt = "AUTO";
String drawTxt = "DRAW";
String resetTxt = "RESET";

boolean autoOver = false;
boolean drawOver = false;
boolean resetOver = false;

int modeSwitch() {
  
  textSize(20);
  strokeWeight(1);
  
  autoX = width/2-140;
  autoY = 12;
  drawX = width/2;
  drawY = 12;
  resetX = 35;
  resetY = 12;
  
  update(mouseX, mouseY);
  noFill();
  stroke(255);
  
  if (drawOver) {
    stroke(165,195,255);
  } else {
    stroke(255);
  }
 
  rect(drawX, drawY, buttonW, buttonH);
  text(drawTxt, drawX+35, drawY+27);
  
  if (autoOver) {
    stroke(165,195,255);
  } else {
    stroke(255);
  }
  
  rect(autoX, autoY, buttonW, buttonH);
  text(autoTxt, autoX+37, autoY+27);
  
  if (resetOver) {
    stroke(165,195,255);
  } else {
    stroke(255);
  }
  
  rect(resetX, resetY, buttonW, buttonH);
  text(resetTxt, resetX+34, resetY+27);
 
  return selection;
}

void update(int x, int y) {
  if ( overAuto(autoX, autoY, buttonW, buttonH) ) {
    autoOver = true;
    drawOver = false;
    resetOver = false;
  } else if ( overDraw(drawX, drawY, buttonW, buttonH) ) {
    drawOver = true;
    autoOver = false;
    resetOver = false;
  } else if ( overReset(resetX, resetY, buttonW, buttonH) ) {
    drawOver = false;
    autoOver = false;
    resetOver = true;
  } else {
    autoOver = drawOver = resetOver = false;
  }
}

void mousePressed() {
  if (autoOver) {
    selection = 1;
  }
  if (drawOver) {
    selection = 2;
  }
  if (resetOver) {
    selection = 0;
  }
}

  boolean overAuto(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

  boolean overDraw(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

  boolean overReset(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
