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
  ArrayList<Map> m;



  GameSystem(PApplet ding_) {
    b = new Background();
    ding = new SoundFile(ding_, "../Ressources/Ding.mp3");

    score = 0;

    this.m = new ArrayList<Map>();
    this.eggs = new ArrayList<Egg>();
    this.meteorer = new ArrayList<Meteor>();
    this.dino = new Dino();
    this.timer = new Timer(width/2, 0, 11);
    this.heart = new Heart(0, 0, (height+width) * 0.05, dino.liv);

    String[] list = loadStrings("highscore.txt");
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
    textSize(30);
    text("Score: "+ score, width*0.75, height*0.0725);


    for (Egg egg : (ArrayList<Egg>) eggs.clone()) {
      if (egg.loc.y > height) eggs.remove(egg);
      egg.run();

      if (egg.loc.y > height) 
        eggs.remove(egg);
    }


    for (Meteor meteor : (ArrayList<Meteor>) meteorer.clone()) {
      meteor.run();
      if (meteor.loc.y > height) {
        meteorer.remove(meteor);
      }
    }

    for (Map m : (ArrayList<Map>) m.clone()) {
      m.run();
    }

    String highscore = String.valueOf(score);
    String[] list = split(highscore, ' ');
    println(highscore);
    saveStrings("highscore.txt", list);
    list = reverse( sort(list));
    

    println("highscore " + list[0]);
  }
  boolean gameOver () {
    if ( dino.liv <= 0 ) return true;
    else return false;
  }
}
