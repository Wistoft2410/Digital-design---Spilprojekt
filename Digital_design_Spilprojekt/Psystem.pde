class Psystem {
  int total;
  ArrayList <Particle> particles;
  PVector vandstart;
  PVector lavastart;

  Psystem(PVector vandloc, PVector lavaloc) {
    total = 100;
    vandstart = vandloc.copy();
    lavastart = lavaloc.copy();
    particles = new ArrayList<Particle>();
  }

  void add() {
    particles.add(new Particle(vandstart,lavastart));
  }
  
  void run() {
    add();
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.gone()) {
        particles.remove(i);
      }
    }
  }
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
}
