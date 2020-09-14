class GameSystem {

  ArrayList<Egg> egg;
  ArrayList<Meteor> meteor;
  Dino dino;
  Heart heart;
  Timer timer;

  GameSystem() {
    egg = new ArrayList<Egg>();
    meteor = new ArrayList<Meteor>();
    dino = new Dino();
    timer = new Timer(width/2, 0, 10);
    heart = new Heart(0, 0, (height+width) * 0.05, dino.liv);
  }



  void update() {
    dino.update();
    heart.display();
    timer.update();
    for (int i = 0; i < meteor.size(); i++) {
      meteor.get(i).update();
      if (meteor.get(i).loc.y > height) {
        meteor.remove(i);
      }
    }
    for (int i = 0; i < egg.size(); i++) {
      egg.get(i).update();
      if (egg.get(i).loc.y > height) {
        egg.remove(i);
      }
    }
  }
}
