//inspired by week_1/2_diceroll
//click to roll

//column and row count
int cols = 5;
int rows = 5;

//spacing variables
int stepx, stepy;

//setup the size of my canvas
void setup() {
  size(500, 500);
  
  //set background
  background(200);

  //value of stepsizes
  stepx = (width / cols);
  stepy = (height / rows);
}

//drawing loop -- keeps the sketch running in realtime
void draw() {
}

//click to roll dice
void mouseReleased() {
  diceroll();
}


//variables for column and row position
int col = -1;
int row = 0;

//diceroll function
void diceroll() {

  //each time we call our function col will add 1 to itself
  col++; 

  //if col is bigger than the the number of cols in our grid we return to 0
  //we add 1 to our row position value
  if (col >= cols) {
    col = 0;
    row++;
  }

  //a variable to hold our dice roll -- 
  //we create a random operation to generate random values between 0 - 3

  int dice = int(random(4));
  println(dice);


  //variables for our x and y positions
  float x = col*stepx;
  float y = row*stepy;

  //variables for rectangle width and height, randomly generated to be
  //between 0 and the values for the x and y positions, respectively
  float rwidth = random(x);
  float rheight = random(y);

  //draw an ellipse 5*5 pixels wide at each xy coordinate.
  //this helps keep the grid intact with other randomness
  ellipse(x, y, 5, 5);

  //if the dice rolls a 0 we select "case 0", if it rolls a 1 "case 1" etc...
  //rolls generate different colour and (relative) size rectangles
  switch(dice) {
  case 0: 
    rect(x,y,rwidth,stepy);
    fill(0);
    break;
  case 1: 
    rect(x,y,stepx,rheight);
    fill(50,50,150);
    break;
  case 2: 
    rect(x,y,rwidth,rheight);
    fill(150,50,50);
    break;
  case 3: 
    rect(x, y, stepx, stepy);
    fill(50,150,50);
    break;
  }
}
