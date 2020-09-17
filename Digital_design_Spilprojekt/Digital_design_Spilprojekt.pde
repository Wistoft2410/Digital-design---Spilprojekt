import processing.sound.*;
GameSystem gameSystem;
Menu menu;

void setup() {
  frameRate(60);
  size(800, 800);
  gameSystem = new GameSystem(this,this);
  menu = new Menu();     
}

void draw() {
  background(161, 204, 204, 100); 
  game();
}

void keyPressed() {
  gameSystem.dino.recordKeys(keyCode, true);
  restart();
}

// Det her er for Dino klasen så den kan bevæge sig bedre!
void keyReleased() {
  gameSystem.dino.recordKeys(keyCode, false);
}

void restart () {
  if (key == 'r' || key == 'R' ) {
    println("Reset");
    frameCount = -1;
  }
}

void game() {
  if (menu.startKnap.on) menu.update();
  else if (!menu.startKnap.on) gameSystem.run();

  if (gameSystem.gameOver()) {
    gameSystem = new GameSystem(this,this);
    menu.startKnap.on = true;
  }
}
