class Pedestrian {
  // declaration
  int direction;
  PVector pos;

  // init
  Pedestrian(int _direction, int _x, int _y) {
    direction = _direction;
    pos = new PVector(_x, _y);
  }

  void update() {
    
  }

  // draw the pedestrians
  void show() {
    pushMatrix();
    rotate(radians(direction));
    noStroke();
    fill(#FF00FF);
    ellipse(pos.x + 7, pos.y, 4, 4);
    ellipse(pos.x - 7, pos.y, 4, 4);
    fill(#FFFF00);
    ellipse(pos.x, pos.y, 10, 10);
    fill(0);
    ellipse(pos.x, pos.y, 6, 6);
    popMatrix();
  }
}

