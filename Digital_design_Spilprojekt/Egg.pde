class Egg extends Default {
  // Vi bruger ikke billedet til noget !!!
  PImage img; 

  float lifespan;

  boolean swallowed;
  boolean touchGround;

  float sizeX = scl;
  float sizeY = scl;

  Egg (float loc_x, float loc_y) {
    lifespan = 255;

    sizeX = width/50;
    sizeY = height/30;
    touchGround = false;

    loc = new PVector(loc_x, loc_y);
    vel = new PVector(0, 0);
    acc = new PVector(0, height*0.000020);
  }

  void display () {
    // Fjerner alpha'en så det ser ud som om den forsvinder lidt efter lidt.
    // Dette sker kun når swallow() metoden er blevet kaldt
    if (swallowed) lifespan -= 6;
    noStroke();
    fill(255, 223, 0, lifespan);
    ellipse(loc.x, loc.y, sizeX, sizeY);
  }

  void update () {
    vel.add(acc);
    loc.add(vel);
  }

  void run() {
    update();
    display();
  }

  void setSwallow(boolean swallowed) {
    this.swallowed = swallowed;
  }
}
