class GameSystem {
  ArrayList<Egg> egg;
  Dino dino;
  Heart heart;
  Timer timer;
  int liv;

  GameSystem() {
    egg = new ArrayList<Egg>();
    dino = new Dino();
    liv = 3;
    timer = new Timer(width/2, 0, 10);
    heart = new Heart(0, 0, (height+width) * 0.05, liv);
  }



  void update() {
    dino.update();
    heart.display();
    timer.update();
  }
}
