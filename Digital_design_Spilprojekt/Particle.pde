class Particle extends Default {
  float lifespan; 

  Particle(PVector one) {
    acc = new PVector(0, 0.05);
    vel = new PVector(random(-1,1),random(-2,0));
    loc = one.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    lifespan -= 4.0;
  }

  void display() {
    //noStroke();
    fill(35, 137, 218, lifespan);
    ellipse(loc.x, loc.y, 10, 10);
  }

  boolean gone () {
    if (lifespan < 0.0 ) {
      return true;
    } else {
      return false;
    }
  }
}
