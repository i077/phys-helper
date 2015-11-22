public class Warp extends SimObject {
  public PVector position;
  public boolean succ;
  public float radius, effect, accel;
  public float[] xcoords, ycoords;
  
  public Warp(float x, float y) {
    position = new PVector(x, y);
    radius = 10;
    
    succ = true;
    effect = 100;
    accel = 0.25;
    
    xcoords = new float[4];
    ycoords = new float[4];
    for (int i = 0; i < 4; i++) {
      xcoords[i] = radius*cos(QUARTER_PI*i);
      ycoords[i] = radius*sin(QUARTER_PI*i);
    }
  }
  
  public void draw() {
    noFill();
    strokeWeight(1);
    strokeCap(ROUND);
    if (succ) {
      stroke(0, 0, 127);
    } else {
      stroke(127, 0, 0);
    }
    
    for (int i = 0; i < 4; i++) {
      line(position.x + xcoords[i], position.y + ycoords[i], position.x - xcoords[i], position.y - ycoords[i]);
    }
  }
  
  public void update() {
    
  }
}