class Timer {

  int sek;
  PVector loc;
  float timerSize;
  float a = frameRate;
  boolean deathMode;

  Timer () {
    timerSize = (width + height) * 0.1;
    loc = new PVector(0, 0);
    sek = 10;
    deathMode = false;
  }

  Timer (float loc_x, float loc_y, int a) { 
    timerSize = (width + height) * 0.1;
    loc = new PVector(loc_x, loc_y + timerSize);
    sek = a;
    deathMode = false;
  }

  void update () {
    countDown();
    display();
  }

  void display () {
    textAlign(CENTER);
    textSize(timerSize);
    if ( deathMode ) { fill(200,0,0);  }
    if ( !deathMode ) { fill(0,200,0);  }
    text(sek, loc.x, loc.y);
  }

  void countDown() {
    a--;
    if (a < 0) {
      a = frameRate;
      sek -= 1;
    }

    if ( sek <= 0 && !deathMode ) {
      sek = 10;
      deathMode = true;
    } 
    if (sek <= 0 && deathMode) {
      sek = 10;
      deathMode = false;
    }
  }
}
