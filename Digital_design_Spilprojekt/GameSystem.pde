class GameSystem {
  Dino dino;
  Heart heart;
  Timer timer;
  int liv;

  GameSystem() {
    dino = new Dino();
    liv = 3;
    timer = new Timer(width/2, 0, 10);
    heart = new Heart(0, 0, 20, liv);
  }
  
    boolean isDead () {
    if (liv <= 0) {
      liv = 0;
      return true;
    } else {
      return false;
    }
  }

  void update() {
    heart.display();
    timer.update();
  }
}
