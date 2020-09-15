import processing.sound.*;
/*
 GameSystem klassen indeholder alle spil objekter
 og holder styr på selve spil systemet
 (point, liv)
*/

class GameSystem {
  Dino dino;
  Heart heart;
  Timer timer;
	int score;

  SoundFile ding;

  ArrayList<Egg> eggs;
  ArrayList<Meteor> meteorer;

  GameSystem(PApplet ding_) {
    ding = new SoundFile(ding_,"../Ressources/Ding.mp3");
    this.eggs = new ArrayList<Egg>();
    this.meteorer = new ArrayList<Meteor>();

    this.dino = new Dino();
    this.timer = new Timer(width/2, 0, 10);
    this.heart = new Heart(0, 0, (height+width) * 0.05, dino.liv);
  }

	void incrementScore() {
		score++;
	}

  void update() {
    println(score);
    dino.update(eggs);
    heart.display();
    timer.update();
    fill(0);
    textSize(24);
    text("Score: " + score ,width*0.75,height*0.0725);

    for (Egg egg : (ArrayList<Egg>) eggs.clone()) {
      egg.run();
      if (egg.loc.y > height) 
				eggs.remove(egg);
    	}

    //for (Meteor meteor : (ArrayList<Meteor>) meteorer.clone()) {
      //meteor.run();
      //if (meteor.loc.y > height) {
        //meteorer.remove(meteor);
      //}
    //}
  }
}
