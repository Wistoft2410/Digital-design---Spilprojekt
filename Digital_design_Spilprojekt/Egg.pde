class Egg {
  
  PVector gravity;
  PVector loc;
  PVector vel;
  PVector acc;
  boolean touchGround;
  
  Egg () {
    touchGround = false;
    gravity = new PVector (0, height*0.000167);
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  Egg (float loc_x, float loc_y) {
    loc.x = loc_x;
    loc.y = loc_y;
  }
  
  void update () {
    display();
  }
  
  void display () {
  
  }
}
