class GameSystem {
  Dino dino;
  Heart heart;
  Timer timer;
  ArrayList<Egg> eggs;

  GameSystem() {
    this.eggs = new ArrayList<Egg>();
    this.dino = new Dino(eggs);
    this.timer = new Timer(width/2, 0, 10);
    this.heart = new Heart(0, 0, (height+width) * 0.05, dino.liv);
    
  }



  void update() {
    dino.update();
    heart.display();
    timer.update();
    for (int i = 0; i < eggs.size(); i++) {
      eggs.get(i).update();
      if (eggs.get(i).loc.y > height) {
        eggs.remove(i);
      }
    }
  }
}
