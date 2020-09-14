class Egg {

  PVector gravity;
  PVector loc;
  PVector vel;
  PVector acc;
  boolean touchGround;
  float eggSizeX;
  float eggSizeY;

  Egg () {
    eggSizeX = width/50;
    eggSizeY = height/30;
    touchGround = false;
    gravity = new PVector (0, height*0.000167);
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  Egg (float loc_x, float loc_y) {
    eggSizeX = width/50;
    eggSizeY = height/30;
    touchGround = false;
    gravity = new PVector (0, height*0.000167);
    loc = new PVector(loc_x, loc_y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void update () {
    applyForce(gravity);
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    display();
  }

  void applyForce( PVector force ) {
    acc.add(force);
  }

  void display () {
    noStroke();
    fill(255, 223, 0);
    ellipse(loc.x, loc.y, eggSizeX, eggSizeY);
  }
}
