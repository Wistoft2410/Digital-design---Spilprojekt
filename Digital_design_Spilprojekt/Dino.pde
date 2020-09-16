class Dino extends Default {
  int liv;

  ArrayList<Egg> eggs;

  PVector loc;
  PVector vel;
  PVector acc;

  boolean touchGround, isLeft, isRight, isUp;

  float speed;
  float scl;

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

    dinoMundRight = loadImage("../Ressources/dinoMundRight.png");
    dinoMundRightDance = loadImage("../Ressources/dinoMundRightDance.png");
    dinoMundLeft = loadImage("../Ressources/dinoMundLeft.png");
    dinoMundLeftDance = loadImage("../Ressources/dinoMundLeftDance.png");
    dinoBack = loadImage("../Ressources/dinoBack.png");
    dinoBackDance = loadImage("../Ressources/dinoBackDance.png");
    
    loc = new PVector(width/3, height/3);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0.3);

    scl = (height + width)/10;

    touchGround = isLeft = isRight = isUp  = false;

    speed = 3;
  }

  void collisionWithEggs(ArrayList<Egg> eggs) {
    for (Egg egg : eggs) {
      // Jeg tager gennemsnittet af x længden og y længden af ægget, da ægget er en ellipse og ikke en cirkel.
      // Vi må lige finde ud af hvordan det kan gøres bedre!
      // Grunden til at der divideres med 3 er fordi vi gerne vil have fat i selve "radius"
      float minimumDist = (egg.eggSizeX + egg.eggSizeY) / 4 + scl / 3;
      float actualDist  = dist(egg.loc.x, egg.loc.y, loc.x, loc.y);

      // Af en eller anden grund så kolliderer ægget to gange så derfor tjekker vi boolean variablen swallowed
      // for at se om Dino'en har ramt ægget eller ej!
      boolean hitAlready = !egg.swallowed;

      if (actualDist < minimumDist && hitAlready) {
        //Ægget står stille når man får point
        egg.acc.mult(0);
        egg.vel.mult(0);
        // Vi skal huske at sørge for at ægget forsvinder og vi "incrementer" scoren!
        egg.swallow();
        gameSystem.incrementScore();
        gameSystem.ding.play();
      }
    }
  }

  void display() {
    stroke(0);
    strokeWeight(0);
    fill(0);

    stroke(0);
    strokeWeight(0);

    //Dino billede
    imageMode(CENTER);
    if (keyCode == RIGHT && picTimer.deathMode) image(dinoMundRight ,loc.x,loc.y,scl,scl);
    else if (keyCode == RIGHT && !picTimer.deathMode) image(dinoMundRightDance ,loc.x,loc.y,scl,scl);
    else if (keyCode == LEFT && picTimer.deathMode) image(dinoMundLeft ,loc.x,loc.y,scl,scl);
    else if (keyCode == LEFT && !picTimer.deathMode) image(dinoMundLeftDance ,loc.x,loc.y,scl,scl);
    else if (picTimer.deathMode) image(dinoBack ,loc.x,loc.y,scl*0.6,scl);
    else if (!picTimer.deathMode) image(dinoBackDance ,loc.x,loc.y,scl*0.6,scl);
    else image(dinoBack ,loc.x,loc.y,scl*0.6,scl);

    imageMode(CORNER);
  }

  void update() {
    movePlayer();

    vel.add(acc);
    loc.add(vel);

    hitGround();
    collisionWithEggs(eggs);

    // Der skal være en maksimum fart hen af x-aksen, som lige nu er på de 3
    if (abs(vel.x) > 3) vel.x = vel.x > 0 ? 3 : -3;

    picTimer.update();

  }

  void run(ArrayList<Egg> eggs) {
    // Jeg bliver nødt til at bruge "this." her, da jeg gerne vil referere til "eggs"
    // variablen i det globale scope, håber i forstår ellers spørg i bare!
    this.eggs = eggs;

    update();
    display();
  }

  void hitGround() {
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
