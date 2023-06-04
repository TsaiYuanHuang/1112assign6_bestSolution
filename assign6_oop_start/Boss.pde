class Boss extends Enemy {
  
  Boss(float x, float y) {
    super(x, y); // Call the superclass constructor
    
    // Set the boss-specific properties
    this.hp = 5;
    this.damage = -20;
    this.xSpeed = 2;
  }
  
}
