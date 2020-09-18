class Gameover {


  Timer gameovertid;
  Psystem[] ps = new Psystem[10];

  Gameover() {
    gameovertid = new Timer(2);
    for (int i = 0; i < ps.length; i++) {
      ps[i] = new Psystem(new PVector(random(width), random(height)), new PVector(random(width), random(height)));
    }
  }


  void update() {
    background(0);
    text("Game Over", width/2, height/2);
    gameover.gameovertid.sek -= 0.0167;
    display();
  }

  void display() {
    for (int i = 0; i < ps.length; i++) {
      ps[i].run();
    }
  }
}
