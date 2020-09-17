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
  SoundFile moan;
  SoundFile music;

  int score;
  int hs;

  ArrayList<Default> projectiles;
  ArrayList<Map> m;


  GameSystem(PApplet ding_, PApplet moan_, PApplet music_) {
    b = new Background();
    ding = new SoundFile(ding_, "../Ressources/Ding.mp3");
    moan = new SoundFile(moan_, "../Ressources/Moan.wav");
    music = new SoundFile(music_,"../Ressources/Musik.wav");
    
    score = 0;

    this.m = new ArrayList<Map>();
    projectiles = new ArrayList<Default>();
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
    changeTime();
    b.display();
    heart.display();
    timer.run();
    dino.run(projectiles);

    fill(0);
    textSize(30);
    text("Score: "+ score, width*0.75, height*0.0725);


    for (Default projectile : (ArrayList<Default>) projectiles.clone()) {
      if (projectile instanceof Egg) {
        Egg egg = (Egg) projectile;
        // Vi skal også huske at fjerne æggene når de forsvinder!
        if (egg.lifespan <= 0.0) projectiles.remove(egg);
      }

      if (projectile instanceof Meteor) {
        Meteor meteor = (Meteor) projectile;
        // Vi skal også huske at fjerne meteoerne når de forsvinder!
        if (meteor.hit) projectiles.remove(meteor);
      }

      if (projectile.loc.y > height) projectiles.remove(projectile);
      projectile.run();
    }

    for (Map m : (ArrayList<Map>) m.clone()) m.run();

    String highscore = String.valueOf(score);
    String[] list = split(highscore, ' ');
    //println(highscore);
    saveStrings("highscore.txt", list);
    list = reverse( sort(list));
    hs = int(highscore);

    if (hs <= score) {
      println("highscore " + hs);
    }
  }

  boolean gameOver () {
    return dino.liv <= 0;
  }

  void changeTime() {
    if ( timer.deathMode ) {
      timer.startSek = 11 - score/10;
    }
    if ( !timer.deathMode ) {
      timer.startSek =  11 + score/10;
    }
  }
}
