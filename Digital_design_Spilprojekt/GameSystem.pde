class GameSystem {
  
  ArrayList<Egg> egg;
  Dino dino;
  Heart heart;
  Timer timer;

  GameSystem() {
    egg = new ArrayList<Egg>();
    dino = new Dino();
    timer = new Timer(width/2, 0, 10);
    heart = new Heart(0, 0, (height+width) * 0.05, dino.liv);
  }



  void update() {
    dino.update();
    heart.display();
    timer.update();
    for (int i = 0; i < egg.size(); i++) {
      egg.get(i).update();
      if (egg.get(i).loc.y > height) {
        egg.remove(i);
      }
    }
  }
}
