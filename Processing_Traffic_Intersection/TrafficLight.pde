class TrafficLight {
  // declaration
  int direction;
  PVector pos;
  int status = 0;
  
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
  }
  
  // update the lights
  void update() {
    // based on timing
  }
  
  
  // draw the traffic light
  void show() {
    // vertical or horizontal?
    
  }
}
