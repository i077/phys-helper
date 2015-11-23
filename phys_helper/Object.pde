class Object extends SimObject {
  public PVector position, velocity, dircoords;
  public float radius, mass, momentum, direction, force_in, dir_in;
  
  public Object(float x, float y, float rad) {
    position = new PVector(x, y);
    radius = max(rad, 25);
    mass = 10; // in kg
    
    velocity = new PVector(0, 0);
    momentum = 0;
    direction = 0; // Always should be in radians
    dircoords = new PVector(0, 0);
    
    force_in = 0;
    dir_in = 0; // Always should be in radians
  }
  
  public void draw(boolean paused) {
    fill(102, 102, 0);
    noStroke();
    ellipse(position.x, position.y, radius, radius);
    
    if (paused) {
      
    }
  }
  
  public void update(boolean paused) {
    if (!paused && force_in != 0) {
      momentum += force_in;
      velocity = PVector.fromAngle(direction).setMag(momentum/mass);
      force_in = 0;
    }
    
    position.add(velocity);
  }
}