int symmetry = 6;
float angle = radians(360 / symmetry);

int b = 255;
int rg = int(random(125,230));

int mode = 0;

int mx;
int my;
int pmx;
int pmy;

int i;
int h = 8;
int autoLoop = 1;

void setup() {
  size(800,800);
  background(210,235,255);
}

void draw() {
  mode = modeSwitch();
  if (mode == 0) {
    background(210,235,255);
    mode = modeSwitch();
  }
  else if (mode == 1) {
    
    translate(width / 2, height / 2);
    
    autoMode();
    //scale(1,-1);
    //autoMode();
    
    autoLoop = 0;
  }
  else {
    
    drawMode();
    
  }
  
}
