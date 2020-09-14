/*
 GameSystem klassen indeholder alle spil objekter
 og holder styr på selve spil systemet
 (point, liv)
*/

class GameSystem {
  Dino dino;
  Heart heart;
  Timer timer;

  ArrayList<Egg> eggs;
  ArrayList<Meteor> meteorer;

  GameSystem() {
    this.eggs = new ArrayList<Egg>();
    this.meteorer = new ArrayList<Meteor>();

    this.dino = new Dino();
    this.timer = new Timer(width/2, 0, 10);
    this.heart = new Heart(0, 0, (height+width) * 0.05, dino.liv);
  }

  void update() {
    dino.update(eggs);
    heart.display();
    timer.update();

    for (Egg egg : (ArrayList<Egg>) eggs.clone()) {
      egg.update();
      if (egg.loc.y > height) 
	eggs.remove(egg);
    }

    //for (Meteor meteor : (ArrayList<Meteor>) meteorer.clone()) {
      //meteor.update();
      //if (meteor.loc.y > height) {
        //meteorer.remove(meteor);
      //}
    //}
  }
}
