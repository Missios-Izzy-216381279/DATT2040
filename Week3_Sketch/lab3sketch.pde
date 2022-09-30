float siny;
int i;

//set up colour values
int rgbpicker;
int r = 180;
int g = 180;
int b = 180;

void setup() {
  size(800, 800);
  frameRate(25);

  strokeWeight(4);
  
}

void draw() {
  background(0);
  stroke(200);
  fill(200);
  
  for (i = 0; i < width-100; i++) {
    
    //taken from addwaves_hack
    float wlen1 = 0.01;
    float w1 = sin(i*wlen1)*50;

    float wlen2 = 0.05;
    float w2 = 1+sin(frameCount*0.0002*i+wlen2)*10;

    float waveadd = (w1*w2)/2;
    siny = height/2+waveadd;
        
    //create the ellipses
    ellipse(i, 1.3*siny-20, i/4, i/4);
    
    //create a line to circles from bottom left corner
    line(1,height-1,i,1.3*siny);
    
    //decide which colour value to change
      rgbpicker = int(random(6));
      //r = 200;
      //g = 200;
      //b = 200;
  
    //change colour using switch
      switch(rgbpicker) {
        case 0: 
          r = r + 2;
          break;
        case 1: 
          r = r - 2;
          break;
        case 2: 
          g = g + 2;
          break;
        case 3: 
          g = g - 2;
          break;
        case 4: 
          b = b + 2;
          break;
        case 5: 
          b = b - 2;
          break;
      }
    
    //reset values if out of 0-255 range
    if (r > 255 || r < 0) {
      r = 180;
    }
    if (g > 255 || g < 0) {
      g = 180;
    }
    if (b > 255 || b < 0) {
      b = 180;
    }
    
    stroke(r,g,b,255);
    fill(r,g,b,255);

    //add googly eyes :)
    //they sometimes leave white marks on the background though & add lag
    //so it's commented out by default but should still work!
    
    /**
    //whites of eyes
    fill(255);
    stroke(0);
    ellipse(width-70,1.3*siny-25,40,40);
    ellipse(width-120,1.3*siny-25,40,40);
    //pupils
    fill(0);
    stroke(0);
    ellipse(width-70,1.3*siny-25,30,30);
    ellipse(width-120,1.3*siny-25,30,30);
    //reset colour to previous value
    stroke(r,g,b,255);
    fill(r,g,b,255);
    **/
    
  }
  
}
