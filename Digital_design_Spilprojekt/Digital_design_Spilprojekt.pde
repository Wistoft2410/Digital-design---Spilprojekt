import processing.sound.*;
GameSystem gameSystem;



void setup() {
  frameRate(60);
  size(800, 800);
  gameSystem = new GameSystem(this);
}

void draw() {
  background(200);
  gameSystem.run();
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
