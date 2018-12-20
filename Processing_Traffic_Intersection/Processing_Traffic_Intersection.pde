// Frank Chen and Tommy Ma
// Traffic Intersection Simulation


void setup() {
  size(600, 600);
}


void draw() {
    // translate the whole grid to (300, 300)
    translate(300, 300);
    // background green
    background(#00D63E);
    
    // draw roads
    drawRoads();
    
    
}

// draw the roads
void drawRoads() {
  rectMode(CENTER);
  noStroke();
  fill(#C9C9C9);
  rect(0, 0, 600, 175);
  rect(0, 0, 175, 600);
  rectMode(CORNER);
}
