class GameSystem {
  Timer timer;
  
  GameSystem() {
    timer = new Timer(width/2, 0, 10);
  }
  
  void update() {
    timer.update();
  }
}
