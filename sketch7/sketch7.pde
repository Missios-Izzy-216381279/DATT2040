PImage img;
int r1, r2;
int xOrig, yOrig;
int xCopy, yCopy;

void setup() {

  //imageMode(CENTER);
  size(400, 500);
  background(0);
  img = loadImage("ghost.jpg");
  image(img, 0, 0);
  loadPixels();
  img.loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x+y*width;
      float b = brightness(img.pixels[loc]);
      pixels[loc] = img.pixels[loc]*5;
      if (loc % 6 == 0) {
        pixels[loc] = color(255,80,0);
      }
      if (loc % 20 == 0) {
        pixels[loc] = color(255);
      }
      if (loc % 4 == 0) {
        pixels[loc] = color(0);
      }
      if (b < 50) { //50 is more glitchy but ~120 is cooler :)
        pixels[loc] = color(0);
      }
    }
  }

  for (int i = 0; i < 1500; i++) {
    r1 = int(random(0, (width*height)-width/2));
    r2 = int(random(0, (width*height)-width/2));
    pixels[r1] = pixels[r2];
    pixels[r2] = pixels[r1];
  }
  
  updatePixels();
  loadPixels();
  
  for (int i = 0; i < 20; i++) {
    xOrig = int(random(0, width-41));
    yOrig = int(random(0, height-41));
    if (xOrig > 315) {
      xCopy = xOrig - 40;
    }
    else {
      xCopy = xOrig + 40;
    }
    if (yOrig > 415) {
      yCopy = yOrig - 40;
    }
    else {
      yCopy = yOrig + 40;
    }
    copy(xOrig, yOrig, 40, 40, xCopy, yCopy, 40, 40);
    stroke(255,0,100);
    noFill();
    rect(xOrig,yOrig,40,40);
  }
}

void draw() {
}
