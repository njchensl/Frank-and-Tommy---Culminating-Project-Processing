class Vehicle {
  // declaration
  int direction;
  PVector pos;
  float vel = 0;

  // init
  Vehicle(int _direction, int _x, int _y) {
    direction = _direction;
    pos = new PVector(_x, _y);
  }

  // update
  void update() {
    switch(direction) {
    case 0:




      break;

    case 90:
      // car driving logic
      vel = 0.1;

      // add the velocity to the position
      pos.add(new PVector(vel, 0));
      break;

    case 180:




      break;

    case 270:





      break;
    }
  }

  // show the car
  void show() {
    switch(direction) {
    case 0:
    
    
      break;
      
    case 90:
    
    
      break;
      
    case 180:
    
    
      break;
      
    case 270:
    
    
      break;
      
    }
  }
}

