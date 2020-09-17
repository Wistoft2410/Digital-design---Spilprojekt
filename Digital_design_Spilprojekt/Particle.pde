class Particle extends Default {
  float lifespan; 
  float lavaspan;

  Particle(PVector one, PVector two) {
    acc = new PVector(0, 0.05);
    vel = new PVector(random(-2,2),random(-2,0));
    vel2 = new PVector(random(-2,2),random(-10,0));
    loc = one.copy();
    loc2 = two.copy();
    
    lifespan = 255.0;
    lavaspan = 1;
  }

  void run() {
    update();
    display();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    loc2.add(vel2);
    lifespan -= 3.0;
    lavaspan += 10;
  }

  void display() {
    noStroke();
    fill(35, 137, 218, lifespan);
    ellipse(loc.x, loc.y, 4, 4);
    fill(207,16,32, lavaspan);
    ellipse(loc2.x, loc2.y, 10, 10);
  }

  boolean gone () {
    if (lifespan < 0.0 ) {
      return true;
    } else {
      return false;
    }
  }
}
