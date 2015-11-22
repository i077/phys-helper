public class Warp {
  public PVector position;
  public boolean succ;
  public float radius, effect, accel;
  public float[] xcoords, ycoords;
  
  public Warp(float x, float y) {
    position.x = x;
    position.y = y;
    radius = 15;
    
    xcoords = new float[4];
    ycoords = new float[4];
    for (int i = 0; i < 4; i++) {
      xcoords[i] = radius*cos(QUARTER_PI*i);
      ycoords[i] = radius*sin(QUARTER_PI*i);
    }
  }
  
  public void draw(boolean paused) {
    noFill();
    strokeWeight(2);
    strokeCap(ROUND);
    if (succ) {
      stroke(0, 0, 63);
    } else {
      stroke(63, 0, 0);
    }
    
    for (int i = 0; i < 4; i++) {
      line(xcoords[i], ycoords[i], -xcoords[i], -ycoords[i]);
    }
  }
  
  public void update(boolean paused) {
    
  }
}