import processing.sound.*;
GameSystem gameSystem;
Menu menu;


void setup() {
  frameRate(60);
  size(800, 800);
  gameSystem = new GameSystem(this);
  menu = new Menu();
}

void draw() {
  background(200); 
  game();
}

void mousePressed () {
  gameSystem.eggs.add(new Egg(random(0, width), 0));
  println(mouseX, mouseY);
}

void keyPressed() {
  restart();
}



void restart () {
  if (key == 'r' || key == 'R' ) {
    println("Reset");
    frameCount = -1;
  }
}


void game() {
  if (menu.startKnap.on) {
    menu.update();
  } else if ( !menu.startKnap.on ) {
    gameSystem.run();
  }
}
