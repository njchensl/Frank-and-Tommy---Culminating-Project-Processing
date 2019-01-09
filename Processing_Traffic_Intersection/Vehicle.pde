class Vehicle {
  // declaration
  int direction;
  PVector pos;
  float vel = 0.4;

  // init
  Vehicle(int _direction, int _x, int _y) {
    direction = _direction;
    pos = new PVector(_x, _y);
  }

  // update
  void update() {
      pos.add(new PVector(0, -vel));



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

