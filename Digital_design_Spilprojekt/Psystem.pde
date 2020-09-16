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
}
