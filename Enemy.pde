public class Enemy extends DynamicBlock {
  
  public float speed = 2; // The horizontal speed of the enemy
  public Level level;
  
  public Enemy(float x, float y) {
    super(x, y, 50, 100);
  }
  
  public void update() {
    // Follow player
    float direction = sgn(level.player.x - x);
    x += direction * speed;
    
    // Gravity
    y += 1;
    
    // Gravitational Collision
    boolean isCollision=false;
    if (level.mouseBlock != null) {
      if (this.isCollide(level.mouseBlock)) {
        isCollision = true;
      }
    }
    for (Rect rect:level.getStaticBlocks()){
      if (this.isCollide(rect)){
        isCollision = true;
      }
    }
    for (Enemy enemy:level.getEnemies()){
      if (this.isCollide(enemy) && !this.equals(enemy)){
        isCollision = true;
      }
    }
    if (isCollision){
      y -= 1;
    }
    
  }
  
  public void draw() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
}