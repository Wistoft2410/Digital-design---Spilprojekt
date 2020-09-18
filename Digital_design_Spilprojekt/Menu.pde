class Menu {

  Knap startKnap;
  Knap exitGame;
  
  PVector locTitel;
  String titel;

  Menu () {
    startKnap = new Knap(width*0.5, height*0.3, "Start", width*0.5, height*0.075);
    exitGame = new Knap(width*0.85, height*0.95, "Exit game", width*0.2, height*0.03);
    titel = "DINO";
    locTitel = new PVector(width/2, height*0.25);
  }

  void update() {
    startKnap.update();
    exitGame.update();
    display();
    leave();
  }

  void display() {
    fill(0);
    textAlign(CENTER);
    textSize((height+width)*0.09);
    text(titel, locTitel.x, locTitel.y, width*0.5, height*0.5);
  }

  void leave() {
    if ( !exitGame.on ) {
      exit();
    }
  }
}
