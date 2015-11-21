class Circle {
  public PVector position, velocity, acceleration, input;
  public float radius, mass, force, direction, momentum;
  
  public Circle(float ecks, float why) {
    position.x = ecks;
    position.y = why;
    radius = 50; // IDK what length unit this is
    mass = 10; // in kg
    
    velocity = new PVector(0, 0); // in m/s
    acceleration = new PVector(0, 0); // in m/(s^2)
    force = 0; // in N
    momentum = 0; // in N*s
    direction = 0; // in radians
  }
  
  public void draw() {
    ellipse(position.x, position.y, radius, radius);
  }
  
  public void update() {
    
  }
}