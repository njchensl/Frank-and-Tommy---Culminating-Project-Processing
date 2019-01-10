class TrafficLight {
  // declaration
  int direction;
  PVector pos;
  int[] status = new int[2];
  int countdown;
  /**
   Note for direction:
   0 for up
   90 for right
   180 for down
   270 for left
   **/


  /**
   note:
   status value and light
   0: red
   1: yellow
   2: green
   3: reserved for future use (potentially advanced green)
   **/


  // init
  TrafficLight(int _direction, int _x, int _y) {
    direction = _direction;
    pos = new PVector(_x, _y);
    status[0] = 2;
    status[1] = 1;
  }

  // update the lights
  void update() {
    // based on timing
  }


  // draw the traffic light
  void show() {
    pushMatrix();
    rotate(radians(direction));
    translate(pos.x, pos.y);
    stroke(0);
    fill(255);
    line(0, 0, -15, -40);
    line(-15, -40, -70, -40);
    rect(-68, -40, 15, 15);
    rect(-35, -40, 15, 15);
    switch(status[0]) {
    case 0:
      fill(#FF0000);
      break;
    case 1:
      fill(#FFFF00);
      break;
    case 2:
      fill(#00FF00);
      break;
    }
    ellipse(-60, -32, 7, 7);
    switch(status[1]) {
    case 0:
      fill(#FF0000);
      break;
    case 1:
      fill(#FFFF00);
      break;
    case 2:
      fill(#00FF00);
      break;
    }
    ellipse(-27, -32, 7, 7);
    popMatrix();
  }
}

