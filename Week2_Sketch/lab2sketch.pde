//position PVector array
PVector[] sp;

//acceleration PVector array
PVector[] acc;

//PVectors for when i use lerp and cross
PVector lerp;
PVector cr;

//dot variable
float dot;

//my default R value in RGB
float red = 150;

//array count
int count = 50;

void setup() {
  size(500,500);
  //frameRate(24);
  
  //create arrays with count number of PVectors
  sp = new PVector[count];
  acc = new PVector[count];
  
  //initiate vectors in array
  for(int i = 0; i < count; i++) {
    sp[i] = new PVector(random(width), random(height), random(5,70));
    acc[i] = new PVector(random(-2,2), random(-2,2),0);
  }
  
  noFill();
  strokeWeight(1);
  
}

void draw() {
 
  background(0);
  
  //randomize red value in steps (to minimize flashing) so fill moves smoothly
  //between shades of yellow and green
  red = red + random(-11,11);
  if (red>255 || red<0) {
   red = 150; 
  }
  fill(red,175,50,150);
  
  //creates ellipses using added PVectors
  for (int j = 0; j < count; j++) {
    sp[j].add(acc[j]);
    
    //once on the second ellipse, more values can be gathered
    if (j >= 1) {
      
    //cross product of new PVector and previous PVector in the array
    cr = sp[j].cross(sp[j-1]);
    
    //dot product of new PVector and previous PVector in the sp array
    dot = sp[j].dot(sp[j-1]);
    //reduced to compensate for large value
    dot = dot/1000000.;
    
    //linear interpolation between new PVector and previous PVector in acceleration array
    lerp = acc[j].lerp(acc[j-1],dot);
    
    //stroke colour change to a light yellow
    stroke(225,205,110,150);
    
    //create a line from the created lerp PVector to the created cross PVector
    line(lerp.x,lerp.y,cr.x,cr.y);
    }

    //deal with edge cases
    if ((sp[j].x > width) || (sp[j].x < 0)) {
      acc[j].x = acc[j].x * -1;
    }

    if ((sp[j].y > height) || (sp[j].y < 0)) {
      acc[j].y = acc[j].y * -1;
    }
    
    //create the ellipse
    ellipse(sp[j].x, sp[j].y, sp[j].z, sp[j].z);
  }
  
}

//recalculate random values with a mouse click
void mousePressed(){
  for(int i = 0; i < count; i++) {
    sp[i] = new PVector(random(width), random(height), random(5,70));
    acc[i] = new PVector(random(-2,2), random(-2,2),0);
  }
}
