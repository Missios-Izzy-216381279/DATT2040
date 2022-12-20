void drawMode() {
  
  translate(width / 2, height / 2);
 
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mx = mouseX - width / 2;
    my = mouseY - height / 2;
    pmx = pmouseX - width / 2;
    pmy = pmouseY - height / 2;
    
    if (mousePressed) {
      int rg = int(random(125,255));
      stroke(rg,rg+25,b);
      float angle = (360 / symmetry) * (PI/180);
      for (int i = 0; i < symmetry; i++) {
        rotate(angle);
        strokeWeight(3);
        line(mx, my, pmx, pmy);
        push();
        scale(1, -1);
        line(mx, my, pmx, pmy);
        pop();
      }
    }
  }
  
}
