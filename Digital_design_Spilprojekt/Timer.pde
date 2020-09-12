class Timer {

  int sek;
  PVector loc;
  float timerSize;
  float a = frameRate;

  Timer () {
    timerSize = (width + height) * 0.1;
    loc = new PVector(0,0);
    sek = 10;
  }

  Timer (float loc_x, float loc_y, int a) { 
    timerSize = (width + height) * 0.1;
    loc = new PVector(loc_x , loc_y + timerSize);
    sek = a;
  }

  void update () {
    countDown();
    display();
  }

  void display () {
    textAlign(CENTER);
    textSize(timerSize);
    fill(255);
    text(sek,loc.x,loc.y);
  }

  void countDown() {
    a--;
    if (a < 0){
      a = frameRate;
      sek -= 1;
    }
  }
}
