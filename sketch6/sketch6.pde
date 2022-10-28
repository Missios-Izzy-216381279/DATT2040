int r = 255;
int g = 155;
int b = 45;

float theta;

float a = 0;
float x = 0;

void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  frameRate(30);
  stroke(r,g,b);
  strokeWeight(1);
  
  a = 100;
  
  theta = radians(50);
  translate((width/2),(height/2));
  //line(0,0,0,-height/8);
  branch(120);
  branch2(120);
}

void branch(float h) {
  
  h *= 0.66;
  if (h > 1){
    pushMatrix();    
    rotate(theta);   
    line(0, 0, 0, -h); 
    translate(0, -h); 
    branch(h);       
    popMatrix(); 
    
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }  
}

void branch2(float h) {
  
  h *= 0.66;
  if (h > 1){
    pushMatrix();    
    rotate(theta+3.14);   
    line(0, 0, 0, -h); 
    translate(0, -h); 
    branch(h);       
    popMatrix(); 
    
    pushMatrix();
    rotate(-theta+3.14);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }  
}
