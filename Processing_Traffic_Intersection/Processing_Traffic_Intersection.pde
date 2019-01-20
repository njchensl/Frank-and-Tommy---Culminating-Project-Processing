// Frank Chen and Tommy Ma
// Traffic Intersection Simulation

// deckaration
Vehicle car1, car2, car3, car4;
TrafficLight L1, L3, L4;
TrafficLightAdvanced L2;
Pedestrian P1;
int timing, additionalTime;
boolean walkButton = false;

void setup() {
  size(600, 600);
  // create vihecles
  car1 = new Vehicle1(90, 18, 500, 0);
  car2 = new Vehicle1(0, 50, 200, 1);
  car3 = new Vehicle(180, 50, 130, 1);
  car4 = new Vehicle(270, 50, 130, 1);
  // create new traffic lights
  L1 = new TrafficLight(0, 80, -80);
  L2 = new TrafficLightAdvanced(90, 80, -80);
  L3 = new TrafficLight(180, 80, -80);
  L4 = new TrafficLight(270, 80, -80);
  // create pedestrians
  P1 = new Pedestrian(0, 77, 270);
  
  noCursor();
}


void draw() {
  // translate the whole grid to (300, 300)
  translate(300, 300);
  // background green
  background(#00D63E);
  // timing
  timing = millis() + additionalTime;

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

    drawDecoration();
  }

  // update the cars
  car1.update();
  car2.update();
  car3.update();
  car4.update();
  // car turning
  // turn right
  if (car2.lane == 1 && car2.direction == 0 && car2.pos.y < 50) {
    car2.direction += 90;
    car2.pos.y -= 90;
  }
  // turn left
  if (car1.lane == 0 && car1.direction == 90 && car1.pos.y < 0) {
    car1.direction -= 90;
    car1.pos.y += 20;
  }

  // draw the cars
  car1.show();
  car2.show();
  car3.show();
  car4.show();

  // update the pedestrians
  P1.update();

  // draw the pedestrians
  P1.show();


  // draw the traffic lights
  L1.update();
  L2.update();
  L3.update();
  L4.update();
  L1.show();
  L2.show();
  L3.show();
  L4.show();


  // pedestrian lights
  pedLight();
  
  // custom cursor
  drawCursor();
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
  for (int i = -300; i < - 175/2; i+= 45) {
    line(175/4 - 8, i, 175/4 - 8, i + 22);
    line(-175/4 + 8, i, -175/4 + 8, i + 22);
  }
}

// decoration
void drawDecoration() {
  pushMatrix();
  translate(140, 140);
  noStroke();
  fill(#8E5801);
  rect(0, 0, 50, 10);
  fill(#02AA22);
  ellipse(60, 5, 40, 60);
  popMatrix();
}

// pedestrian lights
void pedLight() {
  // pedestrian lights
  fill(255);
  stroke(0);
  strokeWeight(1);
  // button
  rect(90, 90, 20, 20);
  if (walkButton) {
    fill(#FF0000);
  } else {
    fill(0);
  }
  ellipse(101, 100, 16, 16);
  // walk signal
  if (L1.status[0] == 1) {
    fill(#00FF00);
    // when the light is green, inhibit the button
    walkButton = false;
  } else {
    fill(#FF0000);
  }
  rect(90, -90, 20, -20);
}

// cursor
void drawCursor() {
  noFill();
  stroke(#C400AD);
  translate(-300, -300);
  ellipse(mouseX, mouseY, 10, 10);
  line(mouseX - 5, mouseY, mouseX - 20, mouseY);
  line(mouseX + 5, mouseY, mouseX + 20, mouseY);
  line(mouseX, mouseY - 5, mouseX, mouseY - 20);
  line(mouseX, mouseY + 5, mouseX, mouseY + 20);
}

// mouse pressed
void mousePressed() {
  // if in the button area
  if (dist(400, 400, mouseX, mouseY) < 9) {
    // check the status of the lights
    if (L1.status[0] == 0 && !walkButton) {
      // advance the time by 2 seconds
      additionalTime += 2000;
      walkButton = true;
    }
  }
}
