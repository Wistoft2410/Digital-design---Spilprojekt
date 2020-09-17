class Timer {

  float startSek;
  float sek;

  PVector loc;

  float timerSize;
  float a = frameRate;

  boolean deathMode;

  Timer () {
    timerSize = (width + height) * 0.1;
    loc = new PVector(0, 0);
    startSek = 10;
    sek = 10;
    deathMode = false;
  }

  Timer (float sek_) {
    timerSize = (width + height) * 0.1;
    loc = new PVector(0, 0);
    startSek = sek_;
    sek = sek_;
    deathMode = false;
  }

  Timer (float loc_x, float loc_y, float sek_) { 
    timerSize = (width + height) * 0.1;
    loc = new PVector(loc_x, loc_y + timerSize);
    startSek = sek_;
    sek = sek_;
    deathMode = false;
  }

  void update () {
    countDown();
  }

  void display () {
    textAlign(CENTER);
    textSize(timerSize);


    // Hvis vi IKKE er i death mode så skal vi tilføje æg!
    if (!deathMode) { 

      fill(0, 200, 0);
      gameSystem.projectiles.add(new Egg(random(0, width) * frameRate, 0));
    }


    // Hvis vi ER i death mode så skal vi tilføje meteorer!
    if (deathMode) {
      fill(200, 0, 0);
      gameSystem.projectiles.add(new Meteor(random(0, width) * frameRate/2, 0));

    }

    text((int) sek, loc.x, loc.y);
  }

  void run() {
    update();
    display();
  }

  void countDown() {
    sek -= 0.0167;

    /*
     a--;
     if (a < 0) {
       a = frameRate;
       sek -= 1;
     }
    */
    if (sek <= 0) {

      sek = startSek;
      deathMode = !deathMode;
    } 
  }
}
