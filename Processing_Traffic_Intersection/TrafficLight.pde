class TrafficLight {
  // declaration
  int direction;
  PVector pos;
  int[] status = new int[2];
  int count = 0;
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
   1: green
   2: yellow
   3: reserved for future use (potentially advanced green)
   **/


  // init
  TrafficLight(int _direction, int _x, int _y) {
    direction = _direction;
    pos = new PVector(_x, _y);
  }

  // update the lights
  void update() {
    // check the direction
    if (direction == 0 || direction == 180) {
      // based on timing
      for (int i = 0; i < 2; i++) {
        if (timing / 1000 % 22 == 0) {
          status[i]= 0;
        } else if (timing / 1000 % 22 == 11) {
          status[i]= 1;
        } else if (timing / 1000 % 22 == 17) {
          status[i]= 2;
        }
      }
    } else {
      for (int i = 0; i < 2; i++) {
        if (timing / 1000 % 22 == 10) {
          status[i]= 0;
        } else if (timing / 1000 % 22 == 1) {
          status[i]= 1;
        } else if (timing / 1000 % 22 == 7) {
          status[i]= 2;
        }
      }
    }
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
      fill(#00FF00);
      break;
    case 2:
      fill(#FFFF00);
      break;
    }
    ellipse(-60, -32, 7, 7);
    switch(status[1]) {
    case 0:
      fill(#FF0000);
      break;
    case 1:
      fill(#00FF00);
      break;
    case 2:
      fill(#FFFF00);
      break;
    }
    ellipse(-27, -32, 7, 7);
    popMatrix();
  }
}

