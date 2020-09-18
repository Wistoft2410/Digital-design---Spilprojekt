class Dino extends Default {
  int liv;

  ArrayList<Default> projectiles;
  ArrayList<Tile> tiles;

  boolean touchGround, isLeft, isRight, isUp;

  float speed;

  float sizeX;
  float sizeY;

  PImage dinoMundRight;
  PImage dinoMundRightDance;
  PImage dinoMundLeft;
  PImage dinoMundLeftDance;
  PImage dinoBack;
  PImage dinoBackDance;

  Timer picTimer;

  Dino() {
    super();
    liv = 3;

    picTimer = new Timer(0.33);

    dinoMundRight      = loadImage("../Ressources/dinoMundRight.png");
    dinoMundRightDance = loadImage("../Ressources/dinoMundRightDance.png");
    dinoMundLeft       = loadImage("../Ressources/dinoMundLeft.png");
    dinoMundLeftDance  = loadImage("../Ressources/dinoMundLeftDance.png");
    dinoBack           = loadImage("../Ressources/dinoBack.png");
    dinoBackDance      = loadImage("../Ressources/dinoBackDance.png");

    loc = new PVector(width/3, height/3);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0.3);

    float scl = (height + width)/10;
    sizeX = scl;
    sizeY = scl;

    touchGround = isLeft = isRight = isUp  = false;

    speed = 3;
  }

  void collisionWithObjects() {
    for (Default projectile : projectiles) {
      float actualDist  = dist(projectile.loc.x, projectile.loc.y, loc.x, loc.y);

      if (projectile instanceof Egg) {
        Egg egg = (Egg) projectile;
        // Jeg tager gennemsnittet af x længden og y længden af ægget, da ægget er en ellipse og ikke en cirkel.
        // Vi må lige finde ud af hvordan det kan gøres bedre!
        float minimumDist = (egg.sizeX + egg.sizeY) / 4 + (sizeX + sizeY) / 5;

        // Af en eller anden grund så kolliderer ægget to gange så derfor tjekker vi boolean variablen swallowed
        // for at se om Dino'en har spist ægget eller ej!
        boolean hitAlready = egg.swallowed;

        if (actualDist < minimumDist && !hitAlready) {
          //Ægget står stille når man får point
          egg.acc.mult(0);
          egg.vel.mult(0);

          // Vi skal huske at sørge for at ægget forsvinder og vi "incrementer" scoren!
          egg.setSwallow(true);
          gameSystem.incrementScore();
          gameSystem.ding.play(1,0.07);
        }

      } else if (projectile instanceof Meteor) {
        Meteor meteor = (Meteor) projectile;

        float minimumDist = meteor.size / 2 + (sizeX + sizeY) / 5;
        // Af en eller anden grund så kolliderer ægget to gange så derfor tjekker vi boolean variablen hit
        // for at se om Dino'en har ramt en meteor eller ej!
        boolean hitAlready = meteor.hit;
        
        if (actualDist < minimumDist && !hitAlready) {
          //Ægget står stille når man får point
          meteor.acc.mult(0);
          meteor.vel.mult(0);
          
          //afspildning af lyd når man mister liv
          gameSystem.moan.play(1,0.3);
          
          // Vi skal selvfølgelig også miste liv og sørge for at meteoren forsvinder!
          meteor.setHit(true);
          gameSystem.heart.liv--;
          liv--;
        }
      }
    }

    for (Tile tile : tiles) {
      float leftTop   = loc.x;
      float rightTop  = loc.y;
      float leftBot   = loc.x + sizeX;
      float rightBot  = loc.y + sizeY;

      float leftTopTile   = tile.loc.x;
      float rightTopTile  = tile.loc.y;
      float leftBotTile   = tile.loc.x + tile.sizeX;
      float rightBotTile  = tile.loc.y + tile.sizeY;

      // TODO: Det er her der skal skabes kollision med tiles'ne!!!
  
    }
  }

  void display() {
    stroke(0);
    strokeWeight(0);
    fill(0);

    stroke(0);
    strokeWeight(0);
    displayDino();
  }

  void displayDino() {
    //Dino billede
    imageMode(CENTER);
    PImage tempPic;

    if (keyCode == RIGHT && picTimer.deathMode) {
      sizeX = scl;
      tempPic = dinoMundRight;

    } else if (keyCode == RIGHT && !picTimer.deathMode) {
      sizeX = scl;
      tempPic = dinoMundRightDance;

    } else if (keyCode == LEFT && picTimer.deathMode) {
      sizeX = scl;
      tempPic = dinoMundLeft;

    } else if (keyCode == LEFT && !picTimer.deathMode) {
      sizeX = scl;
      tempPic = dinoMundLeftDance;

    } else if (!picTimer.deathMode) {
      sizeX = scl * 0.6;
      tempPic = dinoBackDance;

    } else {
      sizeX = scl * 0.6;
      tempPic = dinoBack;
    }

    image(tempPic, loc.x, loc.y, sizeX, sizeY);
    imageMode(CORNER);
  }

  void update() {
    movePlayer();

    vel.add(acc);
    loc.add(vel);

    hitGround();
    collisionWithObjects();

    // Der skal være en maksimum fart hen af x-aksen, som lige nu er på de 3
    if (abs(vel.x) > 3) vel.x = vel.x > 0 ? 3 : -3;

    picTimer.update();
  }

  void run(ArrayList<Default> projectiles, ArrayList<Tile> tiles) {
    // Jeg bliver nødt til at bruge "this." her, da jeg gerne vil referere til "projectiles"
    // variablen i det globale scope, håber i forstår ellers spørg i bare!
    this.projectiles = projectiles;
    this.tiles = tiles;

    update();
    display();
  }

  void hitGround() {
    
    if (loc.x < 0) {
      loc.x = width;
    }
    
        if (loc.x > width) {
      loc.x = 0;
    }
    
    if (loc.y > height - scl / 2) {
      touchGround = true;
      loc.y = height - scl / 2;
    } else touchGround = false;
  }

  boolean isDead () {
    return liv <= 0;
  }

  // Bliver nødt til at have denne funktion da processing's "key input" system ikke virker så godt
  // (Processing kan åbenbart ikke optage flere en knap adgangen ser det ud til)
	void recordKeys(int keyNum, boolean b) {
    switch (keyNum) {
      case LEFT:
        isLeft = b;
        break;
      case RIGHT:
        isRight = b;
        break;
      case UP:
        isUp = b;
        break;
      // Der er ikke et "default" statement i denne switch.
      // Da jeg ikke ved hvad jeg skal i det statement
    }
	}

  void movePlayer() {
    if (isLeft) vel.add(new PVector(-speed, 0));
    else if (isRight) vel.add(new PVector(speed, 0));
    else vel.x = 0;

    if (isUp && touchGround) {
      vel.mult(0);
      vel.add(new PVector(0, -speed * 3.0));
    }
  }
}
