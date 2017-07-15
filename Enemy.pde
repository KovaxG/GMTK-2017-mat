public class Enemy extends DynamicBlock {
  
  public float speed = 5; // The horizontal speed of the enemy
  public Level level;
  
  public Enemy(float x, float y,Level level) {
    super(x, y, 50, 100,level);
  }
  
  public void update() {
    // TODO follow player
    // x += speed if player is to the right, -speed if the player is to the left
    
    // Gravitational Collision
    y += gravity;
    if (isAnyCollision()){
       y -= gravity; 
    }
    
    
    
  }
  

  
  public void draw() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
}