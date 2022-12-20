void autoMode() {
  
  //this snowflake kind of sucks
  
  //you can click (anywhere except buttons) to generate another
  
  if (autoLoop != 0) {
    
    strokeWeight(4);
    stroke(245,252,255);
    
    line(0,0,width/3,height/3);  
    scale(1,-1);
    line(0,0,width/3,height/3);  
    scale(-1,1);
    line(0,0,width/3,height/3);  
    scale(1,-1);
    line(0,0,width/3,height/3); 
    
    rotate(PI/4);
    
    line(0,0,width/3,height/3);  
    scale(1,-1);
    line(0,0,width/3,height/3);  
    scale(-1,1);
    line(0,0,width/3,height/3);  
    scale(1,-1);
    line(0,0,width/3,height/3); 
    
  }
  
  branch(h);
  
}

void branch(int branchSize) {
 
  if (autoLoop != 0) {
    if (branchSize < 80) {
      branchSize *= 1.4;
  
      int rg = int(random(125, 255));
      stroke(rg, rg+25, b);
      strokeWeight(3);
  
      //float angle = radians((360 / symmetry)*2);
      //for (int i = 1; i <= symmetry/2; i++) {
        //float rAngle = random(.6, .95);  
        float rAngle = (HALF_PI)/int(random(1,3));
        
        pushMatrix();
        rotate(-rAngle);
        line(0, 0, 0, -branchSize);
        translate(0, -branchSize);
        branch(branchSize);
        popMatrix();
        
        pushMatrix();
        rotate(rAngle);
        line(0, 0, 0, -branchSize);
        translate(0, -branchSize);
        branch(branchSize);
        popMatrix();
        
        //translate(0, -branchSize);
      //}
    }
    else {
      //autoLoop = 0;
    }
  }
  
}

void mouseClicked() {
  background(210,235,255);
  h = 8;
  autoLoop = 1;
}
