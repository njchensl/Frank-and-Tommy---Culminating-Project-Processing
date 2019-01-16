class Vehicle {
  // declaration
  int direction;
  PVector pos;
  float vel = 1;
  float defaultVel;
  int lane;

  // init
  Vehicle(int _direction, int _x, int _y, int _lane) {
    direction = _direction;
    pos = new PVector(_x, _y);
    lane = _lane;
    defaultVel = random(0.7, 1.5);
  }

  // update
  void update() {
    // check traffic light
    switch(direction) {
    case 0:
      if (L1.status[lane] == 0 && pos.y > 100 && pos.y < 120) {
        vel = 0;
      } else {
        vel = defaultVel;
      }



      break;
    case 90:
      if (L2.status[lane] == 0 && pos.y > 100 && pos.y < 120) {
        vel = 0;
      } else {
        vel = defaultVel;
      }
      break;
    case 180:
      if (L3.status[lane] == 0 && pos.y > 100 && pos.y < 120) {
        vel = 0;
      } else {
        vel = defaultVel;
      }
      break;
    case 270:
      if (L4.status[lane] == 0 && pos.y > 100 && pos.y < 120) {
        vel = 0;
      } else {
        vel = defaultVel;
      }
      break;
    }

    pos.add(new PVector(0, -vel));
    if (pos.y < -400) {
      pos.y = 350;
    }
  }



  // show the car
  void show() {
    pushMatrix();
    rotate(radians(direction));
    rectMode(CENTER);
    fill(#00C908);
    noStroke();
    rect(pos.x, pos.y, 20, 40);
    fill(#009306);
    rect(pos.x, pos.y + 4, 14, 20);
    fill(0);
    ellipse(pos.x - 2, pos.y + 6, 4, 4);
    fill(#006400);
    rect(pos.x, pos.y - 17, 4, 25);
    rectMode(CORNER);
    popMatrix();
  }
}

