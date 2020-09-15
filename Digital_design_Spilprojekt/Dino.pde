class Dino extends Default {
  int liv;

  ArrayList<Egg> eggs;
  
  PVector loc;
  PVector vel;
  PVector acc;

  boolean touchGround;

  float speed;
  float scl;


  Dino() {
    super();
    liv = 3;

    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, height*0.000167);

    scl = (height + width)/50;

    touchGround = false;
    speed = scl/8;
  }

  void collisionWithEggs(ArrayList<Egg> eggs) {
    for (Egg egg : eggs) {
      // Jeg tager gennemsnittet af x længden og y længden af ægget, da ægget er en ellipse og ikke en cirkel.
      // Vi må lige finde ud af hvordan det kan gøres bedre!
      // Grunden til at der divideres med 2 er fordi vi gerne vil have fat i selve "radius"
      float minimumDist = (egg.eggSizeX + egg.eggSizeY) / 4 + scl / 2;
      float actualDist  = dist(egg.loc.x, egg.loc.y, loc.x, loc.y);

      // Af en eller anden grund så kolliderer ægget to gange så derfor tjekker vi boolean variablen swallowed
      // for at se om Dino'en har ramt ægget eller ej!
      boolean hitAlready = !egg.swallowed;

      if (actualDist < minimumDist && hitAlready) {
        // Vi skal huske at sørge for at ægget forsvinder og vi "incrementer" scoren!
        egg.swallow();
        gameSystem.incrementScore();
      }
    }
  }

  void display() {
    stroke(0);
    strokeWeight(0);
    fill(0);

    stroke(0);
    strokeWeight(0);
    ellipse(loc.x, loc.y, scl, scl);

  }

  void update() {
    collisionWithEggs(eggs);

    vel.add(acc);
    loc.add(vel);

    move();

    hitGround();
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
		}
  }

  boolean isDead () {
    return liv <= 0;
  }

  void move() {
    if (keyPressed) {
      // Kan ikke helt fikse det her god damnit :(
      if (keyCode == RIGHT) loc.add(new PVector(speed, 0));
      if (keyCode == LEFT) loc.add(new PVector(-speed, 0));
      if (keyCode == UP && touchGround) {
				vel.y -= height * 0.009;
				touchGround = false;
			}
    }
  }
}
