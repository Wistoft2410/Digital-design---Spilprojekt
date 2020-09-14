class Meteor {

  PImage muneb = loadImage("Muneb.png");
  PVector gravity;
  PVector loc;
  PVector vel;
  PVector acc;
  boolean touchGround;
  float meteorSize;

  Meteor (float loc_x, float loc_y) {
    meteorSize = width/20;
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
    fill(220);
    image(muneb,loc.x, loc.y, meteorSize, meteorSize);
  }
}
