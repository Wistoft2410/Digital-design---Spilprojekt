import processing.sound.*;
GameSystem gameSystem;
Background b;


void setup() {
  frameRate(60);
  size(1600, 800);
  gameSystem = new GameSystem(this);
  b = new Background();
}

void draw() {
  background(200);

<<<<<<< HEAD
  b.display();
  gameSystem.update();

=======



<<<<<<< HEAD

  b.display();
  gameSystem.run();
>>>>>>> fd83284b591ea72b1eb9a49cf8aeee87a7ab1d53
=======



  b.display();
  gameSystem.run();
>>>>>>> fd83284b591ea72b1eb9a49cf8aeee87a7ab1d53
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
