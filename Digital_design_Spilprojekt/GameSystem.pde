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

  Gameover gameover; 

  SoundFile ding;
  SoundFile moan;
  SoundFile music;

  int score; //score
  int hs; //highscore
  int total; //antal platforme i alt


  ArrayList<Default> projectiles;
  ArrayList<Tile> tiles;
  String[] savedScore;

  GameSystem(PApplet ding_, PApplet moan_, PApplet music_, PApplet gameover_) {
    gameover = new Gameover(gameover_);
    b = new Background();
    ding = new SoundFile(ding_, "../Ressources/Ding.mp3");
    moan = new SoundFile(moan_, "../Ressources/Moan.wav");
    music = new SoundFile(music_, "../Ressources/Musik.wav");

    score = 0;

    tiles = new ArrayList<Tile>();
    projectiles = new ArrayList<Default>();
    this.dino = new Dino();
    this.timer = new Timer(width/2, 0, 11);
    this.heart = new Heart(0, 0, (height+width) * 0.05, dino.liv);

    savedScore = loadStrings("highscore.xml");
  }


  void incrementScore() {
    score++;
  }


  void slutPrut () {
    if ( gameOver() && gameover.gameovertid.sek > 0 ) {
      music.stop();
      gameover.update();
    } else if (gameOver() && gameover.gameovertid.sek < 0) {
      frameCount = -1;
    }
  }

  void run() {
    update();
  }

  void update() {


    changeTime();
    b.display();
    heart.display();
    timer.run();
    dino.run(projectiles, tiles);

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

    // Hvis der ikke er nogle tiles
    // Eller
    // Hvis den seneste tile kommer helt ind på banen
    // så bliver der lavet en nu tile
    if (tiles.size() <= 0) {
      tiles.add(new Tile());
    } else if (tiles.get(tiles.size()-1).loc.x + tiles.get(tiles.size()-1).sizeX/2 < width) {
      tiles.add(new Tile());
    }

    for (int i = tiles.size() - 1; i >= 0; i--) {
      Tile t = tiles.get(i);
      t.run();

      if (t.out()) {
        tiles.remove(i);
      }
    }

    if (savedScore.length > 0) {
      int latestScore = int (savedScore[0]); //Man kan ændre strings

      String highscore = String.valueOf(score);
      String[] list = split(highscore, ' ');

      if (latestScore < score) {
        saveStrings("highscore.xml", list);
      }

      list = reverse( sort(list));
      hs = int(highscore);

      if (hs <= score) { 
        println("highscore " + hs);
      }
    }
    
     slutPrut();
  }


  boolean gameOver () {
    return dino.liv <= 0;
  }

  void changeTime() {
    if ( timer.deathMode ) {
      timer.startSek = 11 - score/10;
      if (timer.startSek < 3) {
        timer.startSek = 3;
      }
    }
    if ( !timer.deathMode ) {
      timer.startSek =  11 + score/10;
      if (timer.startSek > 26) {
        timer.startSek = 26;
      }
    }
  }
}
