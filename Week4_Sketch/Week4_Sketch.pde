int rows = 3;
int cols = 3;
int stepx;
int stepy;

PVector mouse;
PVector size;
PVector acc;
PVector targ;

float targetMax = 120.0;
float targetMin = 4.0;
float target;
int tweight;

int seed;
boolean change = false;
boolean success = false;
int sCount = 0;

int score = 0;
float timer = 5.00;
String time;
String counter;

boolean win = false;

/**
  *
  * INSTRUCTIONS *
  *
  * your cursor location controls a circle's location
  * your mouse button helps you control the size of the circle
  * use both to line your circle up with the yellow target circles to gain points
  * you win after 10 points, or you lose when time runs out (5 seconds per new target)
  *
  *
**/

void setup() {
  fill(0);
  strokeWeight(2);
  background(255);
  stroke(255);
  textSize(20);

  size(800, 800);
  stepx = (width / cols);
  stepy = (height / rows);

  //create grid for the first time
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {

      rect(x * stepx, y * stepy, stepx, stepy);
    }
  }
  
  size = new PVector(10,10);
  acc = new PVector(1,1);
  
  //define target values
  seed = int(random(0,9));
  target = random(targetMin, targetMax);
  tweight = int(random(1,6));
  
}

void draw() {  
  
  stroke(255);
  strokeWeight(2);
  
  //grid drawing
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      rect(x * stepx, y * stepy, stepx, stepy);
    }
  }
  
  mouse = new PVector(mouseX, mouseY);
  
  //defines new values whenever a point is received
  if (change == true) {
    target = random(targetMin, targetMax);
    seed = int(random(0,9));
    tweight = int(random(1,4));
    change = false;
    score = score + 1;
    timer = 5.00;
  }
  
  //text in top left to track info
  fill(255);
  time = "timer: " + timer;
  counter = "score: " + score;
  text(time,20,30);
  text(counter,20,50);
  fill(0);
  
  //draws the target somewhere on the grid, determined by the randomized seed
   strokeWeight(tweight);
   stroke(255,255,0);
    switch(seed) {
      case 0:
        ellipse((stepx/2),(stepy/2),target,target);
        targ = new PVector((stepx/2),(stepy/2));
        break;
      case 1:
        ellipse((stepx/2)+(stepx),(stepy/2),target,target);
        targ = new PVector((stepx/2)+(stepx),(stepy/2));
        break;
      case 2:
        ellipse((stepx/2)+(2*stepx),(stepy/2),target,target);
        targ = new PVector((stepx/2)+(2*stepx),(stepy/2));
        break;
      case 3:
        ellipse((stepx/2),(stepy/2)+(stepy),target,target);
        targ = new PVector((stepx/2),(stepy/2)+(stepy));
        break;
      case 4:
        ellipse((stepx/2)+(stepx),(stepy/2)+(stepy),target,target);
        targ = new PVector((stepx/2)+(stepx),(stepy/2)+(stepy));
        break;
      case 5:
        ellipse((stepx/2)+(2*stepx),(stepy/2)+(stepy),target,target);
        targ = new PVector((stepx/2)+(2*stepx),(stepy/2)+(stepy));
        break;
      case 6:
        ellipse((stepx/2),(stepy/2)+(2*stepy),target,target);
        targ = new PVector((stepx/2),(stepy/2)+(2*stepy));
        break;
      case 7:
        ellipse((stepx/2)+(stepx),(stepy/2)+(2*stepy),target,target);
        targ = new PVector((stepx/2)+(stepx),(stepy/2)+(2*stepy));
        break;
      case 8:
        ellipse((stepx/2)+(2*stepx),(stepy/2)+(2*stepy),target,target);
        targ = new PVector((stepx/2)+(2*stepx),(stepy/2)+(2*stepy));
        break;
    }
    
  strokeWeight(2);
  
  //determines if two circles are (roughly) matched up
  if ((mouse.x <= targ.x + tweight) && (mouse.x >= targ.x - tweight) && (mouse.y <= targ.y + tweight) && (mouse.y >= targ.y - tweight) && (size.x <= target + tweight) && (size.x >= target - tweight)) {
    success = true;
    change = true;
  }
  
  //change circle colour if the player gets a point
  if (success == true) {
    stroke(0,255,0);
    sCount++;
  }
  else {
    stroke(255,0,0);
    sCount = 0;
  }
  
  //slows down the transition from green to red to make it apparent that the player got a point
  if (sCount == 11) {
    success = false;
  }
  
  ellipse(mouse.x, mouse.y, size.x, size.x);
  point(mouse.x, mouse.y);
  
  //shrink movable circle when mouse button is held down
  if (mousePressed) {
    size.sub(acc);
  }
  else {
    //grow movable circle when no input
    size.add(acc);
  }
  
  //this timer is probably inaccurate depending on computer performance but it's very close to a second for me
  timer = timer - 0.017;
  
  //end game with a losing message when timer runs out
  if (timer <= 0) {
    textSize(40);
    fill(255,0,0);
    text("time's up! better luck next time.", 15, 100);
    noLoop();
  }
  
  
  //end game with a winning message when score is 10
  if (score >= 10) {
    textSize(40);
    fill(0,255,0);
    text("you won!", 20, 80);
    noLoop();
  }
  
}
