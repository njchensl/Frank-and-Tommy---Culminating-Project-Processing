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

  // rotate through every direction
  for (int i = 0; i < 4; i++) {
    rotate(radians(90));

    drawSidewalks();

    drawCrosswalks();
    
    drawCenterline();
    
    drawStopLine();
    
    drawLanes();
  }
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

// draw the sidewalks
void drawSidewalks() {
  // fill gray
  // loop through every direction
  noStroke();
  fill(#818181);
  rotate(radians(90));
  rect(175/2 - 20, -300, 20, 300 - 175 / 2 + 20);
  rect(-175/2, -300, 20, 300 - 175/2 + 20);
}

// draw the crosswalks
void drawCrosswalks() {
  // fill white
  fill(255);
  noStroke();
  rotate(radians(90));
  for (int j = - 175/2 + 20; j < 175/2 - 20; j += 14) {
    rect(j, -175/2, 8, 20);
  }
}

// draw the centerline
void drawCenterline() {
  stroke(#FFB700);
  strokeWeight(3);
  line(-300, 0, -175/2 - 10, 0);
}

// draw the stop line
void drawStopLine() {
  stroke(255);
  line(-175/2 + 22, -175/2 - 6, 175/2 - 22, -175/2 - 6);
}

// draw the lanes
void drawLanes() {
  for (int i = -300;  i < - 175/2; i+= 45) {
    line(175/4 - 8, i, 175/4 - 8, i + 22);
    line(-175/4 + 8, i, -175/4 + 8, i + 22);
  }
}
