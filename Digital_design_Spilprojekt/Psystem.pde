class Psystem {
  int total;
  ArrayList <Particle> particles;
  PVector start;

  Psystem(PVector loc) {
    total = 100;
    start = loc.copy();
    particles = new ArrayList<Particle>();
  }

  void ad() {
    particles.add(new Particle(start));
 
  }
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.gone()) {
        particles.remove(i);
      }
    }
  }
}
