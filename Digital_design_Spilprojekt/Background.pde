
class Background {
  PVector vandloc;
  PVector soloc;


  Psystem ps;

  Background() {
    vandloc = new PVector(-1, height/1.9);
    soloc = new PVector (100, height/1.40);
    ps = new Psystem(new PVector(60, 566), new PVector(width/2+50, height/2.68));
    
    
  }

  void display() {
    stroke(0);
    strokeWeight(0);
    line(vandloc.x, vandloc.y+150, width, vandloc.y+150);
    
    //tree
    int t = 50;
    while(t <=width) {
      
    pushMatrix();
    fill(118, 92, 72);
    rectMode(CENTER);
    translate(220+t, 550);
    rect(0+t, 0, 25, 50);
    fill(58, 95, 11);
    ellipse(0+t, -40, 45, 40);
    t+=30;
    popMatrix();
    } 
       
    //planet med måne i omkreds
    fill(100);
    pushMatrix();
    translate(width-100, 50);
    rotate(frameCount*0.1);
    ellipse(0, 0, 40, 40);
    ellipse(25, 25, 20, 20);
    popMatrix();

    //bakken til vandfaldet
    stroke(0);
    strokeWeight(0);
    fill(139, 69, 19, 200);
    rect(vandloc.x+15, vandloc.y+74, 30, 150, 0, 100, 0, 0);  

    //sø
    fill(35, 137, 255);
    ellipse(soloc.x, soloc.y, 150, 30);

    //vandfaldet
    noFill();
    stroke(0,191,255);
    strokeWeight(30);
    bezier(vandloc.x, vandloc.y-15, 60, vandloc.y-30, 40, 500, vandloc.x+40, vandloc.y+140);

    //vulkan
    noFill();
    pushMatrix();
    stroke(155, 118, 83);
    strokeWeight(5);
    noFill();
    translate(width/2, height/2.68);
    curve(0, -100, 0, 0, 100, 0, 100, -100);
    curve(0, -100, 0, 0, -100, 100, -400, 100);
    curve(200, 0, 100, 0, 200, 100, 400, 100);
    fill(155, 118, 83);
    beginShape();
    vertex(-90, 100);
    vertex(-45, 75);
    vertex(0, 0);
    vertex(18, 13);
    vertex(91, 12);
    vertex(100, 0);
    vertex(135, 60);
    vertex(200, 100);
    endShape();
    popMatrix();
    
    //Partikel system
    ps.run();

  }
  void tree () {
   
  }
}
