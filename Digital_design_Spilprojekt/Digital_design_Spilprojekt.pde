GameSystem gameSystem;
Background b;

void setup() {
  frameRate(60);
  size(800, 800);
  gameSystem = new GameSystem();
  b = new Background();
}

void draw() {
  background(200);
  gameSystem.update();
  b.display();
}

void mousePressed () {
  //gameSystem.eggs.add(new Egg(mouseX,mouseY));
   gameSystem.eggs.add(new Egg(random(0,width), 0));
  
   //gameSystem.meteorer.add(new Meteor(random(width), 0));
  //gameSystem.meteorer.add(new Meteor(mouseX,mouseY));
 
}

void keyPressed() {
  if (key == 'r' || key == 'R' ) {
    println("Reset");
    frameCount = -1;
  }
}
