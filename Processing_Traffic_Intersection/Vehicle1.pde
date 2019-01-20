class Vehicle1 extends Vehicle {
  // init
  Vehicle1(int _direction, int _x, int _y, int _lane) {
    super(_direction, _x, _y, _lane);
    direction = _direction;
    pos = new PVector(_x, _y);
    lane = _lane;
    defaultVel = random(1, 1.5);
  }

  // show the car
  void show() {
    pushMatrix();
    rotate(radians(direction));
    rectMode(CENTER);
    fill(#323EFA);
    noStroke();
    rect(pos.x, pos.y, 20, 40);
    fill(#FA3232);
    //rect(pos.x, pos.y + 4, 14, 20);
    //fill(0);
    //ellipse(pos.x - 2, pos.y + 6, 4, 4);
    //fill(#006400);
    rect(pos.x, pos.y - 30, 18, 15);
    rectMode(CORNER);
    popMatrix();
  }
}

