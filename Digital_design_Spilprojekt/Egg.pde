class Egg extends Default {
  // Vi bruger ikke billedet til noget !!!
  PImage img; 

  float lifespan;

  boolean swallowed;
  boolean touchGround;

  float eggSizeX = scl;
  float eggSizeY = scl;

  Egg (float loc_x, float loc_y) {
    // Vi bruger ikke billedet til noget !!!
    //img = loadImage("../Ressources/Egg.png");
    lifespan = 255;
    swallowed = false;

    eggSizeX = width/50;
    eggSizeY = height/30;
    touchGround = false;

    loc = new PVector(loc_x, loc_y);
    vel = new PVector(0, 0);
    acc = new PVector(0, height*0.000167);
  }

  void display () {
    // Fjerner alpha'en så det ser ud som om den forsvinder lidt efter lidt.
    // Dette sker kun når swallow() metoden er blevet kaldt
    if (swallowed) lifespan -= 6;
    noStroke();
    fill(255, 223, 0, lifespan);
    ellipse(loc.x, loc.y, eggSizeX, eggSizeY);
  }

  void update () {
    vel.add(acc);
    loc.add(vel);
  }

  void run() {
    update();
    display();
  }

  void swallow() {
    swallowed = true;
  }
}
