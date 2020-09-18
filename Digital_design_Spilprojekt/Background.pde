
class Background {
  PVector vandloc;
  PVector soloc;


  Psystem ps;

  Background() {
    vandloc = new PVector(-width/width, height/1.9);
    soloc = new PVector (width*0.125, height/1.40);
    ps = new Psystem(new PVector(width*0.075, height*0.7075), new PVector(width*0.5625, height/2.68));
  }

  void display() {
    stroke(0);
    strokeWeight(0);
    line(vandloc.x, vandloc.y+150, width, vandloc.y+150);

     //himmel
    fill(135, 206, 235);
    noStroke();
    rectMode(CORNER);
    rect(0, 0, width, height*0.5);

    //tree
    int t = 50;
    while (t <=width) {
      pushMatrix();
      translate(100+t, height*0.6875);
      fill(118, 92, 72);
      rectMode(CENTER);
      rect(t, 0, width*0.03125, height*0.0625);
      fill(58, 95, 11);
      ellipse(t, -width*0.05, height*0.05625, height*0.05);
      t+=width*0.0375;
      popMatrix();
    } 

    //planet med måne i omkreds
    fill(100);
    pushMatrix();
    translate(width*0.875, height*0.0625);
    rotate(frameCount*0.1);
    ellipse(0, 0, width*0.05, height*0.05);
    ellipse(width*0.03125, height*0.03125, width*0.025, height*0.025);
    popMatrix();

    //bakken til vandfaldet
    stroke(0);
    strokeWeight(0);
    fill(139, 69, 19, 200);
    rect(vandloc.x + width*0.01875, vandloc.y + height*0.0925, width*0.0375, height*0.1875);  

    //sø
    fill(35, 137, 255);
    ellipse(soloc.x, soloc.y, width*0.1875, height*0.0375);

   //bjerge
    int b = 0;
    while (b <=width) {
      pushMatrix();
      stroke(139,69,19);
      fill(139,69,19);
      translate(width*0.00375+b, height*0.5);
      triangle(b, 0, width*0.05+b, -height*0.0625, width*0.1+b, 0); 
      b+=width*0.0375;
      popMatrix();
    }

    //vulkan
    noFill();
    pushMatrix();
    stroke(155, 118, 83);
    strokeWeight((height+width)*0.003125);
    noFill();
    translate(width/2, height/2.68);
    curve(0, -height*0.125, 0, 0, width*0.125, 0, width*0.125, -height*0.125);
    curve(-width*0.25, 0, 0, 0, -width*0.125, height*0.125, -width*0.5, height*0.125);
    curve(width*0.25, 0, width*0.125, 0, width*0.25, height*0.125, width*0.5, height*0.125);
    fill(155, 118, 83);
    beginShape();
    vertex(-width*0.1125, height*0.125);
    vertex(-width*0.05625, height*0.09375);
    vertex(0, 0);
    vertex(width*0.0225, height*0.01625);
    vertex(width*0.11375, height*0.015);
    vertex(width*0.125, 0);
    vertex(width*0.16875, height*0.075);
    vertex(width*0.25, height*0.125);
    endShape();
    popMatrix();

   

    //vandfaldet
    noFill();
    stroke(0, 191, 255);
    strokeWeight((height+width)*0.01875);
    bezier(vandloc.x, vandloc.y-height*0.01875, width*0.075, vandloc.y-height*0.0375, width*0.05, height*0.625, vandloc.x+width*0.05, vandloc.y+height*0.175);


    //Partikel system
    ps.run();
  }
}
