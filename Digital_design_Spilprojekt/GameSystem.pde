/*
 GameSystem klassen indeholder alle spil objekter
 og holder styr på selve spil systemet (point, liv, osv.)
*/

class GameSystem {
  Dino dino;
  Heart heart;
  Timer timer;

  ArrayList<Egg> eggs;
  ArrayList<Meteor> meteorer;

	int score;


  GameSystem() {
    this.eggs = new ArrayList<Egg>();
		// Bliver ikke brugt endnu
    this.meteorer = new ArrayList<Meteor>();

    this.dino = new Dino();
    this.timer = new Timer(width/2, 0, 10);
    this.heart = new Heart(0, 0, (height+width) * 0.05, dino.liv);
  }

	void incrementScore() {
		score++;
	}

  void run() {
		//println(score);
    dino.run(eggs);
    timer.run();
    heart.display();

		fill(0);
		textSize(24);
		text("Score: " + score, width * 0.75, height * 0.0725);

    for (Egg egg : (ArrayList<Egg>) eggs.clone()) {
      if (egg.loc.y > height) eggs.remove(egg);
      egg.run();
		}
  }
}
