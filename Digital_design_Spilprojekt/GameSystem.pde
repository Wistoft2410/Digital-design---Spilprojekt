import processing.sound.*;
/*
 GameSystem klassen indeholder alle spil objekter
 
 og holder styr på selve spil systemet
 (point, liv)
 */


class GameSystem {
  Dino dino;
  Heart heart;
  Timer timer;

  Background b;
  Psystem ps;
  SoundFile ding;
  int score;

  ArrayList<Egg> eggs;
  ArrayList<Meteor> meteorer;

  GameSystem(PApplet ding_) {
    b = new Background();
    ding = new SoundFile(ding_, "../Ressources/Ding.mp3");
    score = 0;
    this.eggs = new ArrayList<Egg>();
    // Bliver ikke brugt endnu
    this.meteorer = new ArrayList<Meteor>();
    this.dino = new Dino();
    this.timer = new Timer(width/2, 0, 11);
    this.heart = new Heart(0, 0, (height+width) * 0.05, dino.liv);
  }

  void incrementScore() {
    score++;
  }

  void run() {
    update();
  }


  void update() {
    b.display();
    dino.run(eggs);
    heart.display();
    timer.run();


    fill(0);
    textSize(24);
    text("Score: " + score, width*0.75, height*0.0725);


    for (Egg egg : (ArrayList<Egg>) eggs.clone()) {
      if (egg.loc.y > height) eggs.remove(egg);
      egg.run();

      if (egg.loc.y > height) 
        eggs.remove(egg);
    }

    //for (Meteor meteor : (ArrayList<Meteor>) meteorer.clone()) {
    //meteor.run();
    //if (meteor.loc.y > height) {
    //meteorer.remove(meteor);
    //}
    //}
  }
  boolean gameOver () {
    if ( dino.liv <= 0 ) return true;
    else return false;
  }
}
