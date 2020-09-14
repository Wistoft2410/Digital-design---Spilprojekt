PImage img; 

class Egg {
  PVector gravity;
  PVector loc;
  PVector vel;
  PVector acc;

  boolean touchGround;

  float eggSizeX;
  float eggSizeY;

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
    img = loadImage("Egg.png");
    noStroke();
    fill(255, 223, 0);
    image(img, loc.x, loc.y, eggSizeX, eggSizeY);
    
  }
}
