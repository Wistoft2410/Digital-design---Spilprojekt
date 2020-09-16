import processing.sound.*;
GameSystem gameSystem;
Background b;


void setup() {
  frameRate(60);
  size(800, 800);
  gameSystem = new GameSystem(this);
  b = new Background();
}

void draw() {
  background(200);


  b.display();
  gameSystem.update();

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
