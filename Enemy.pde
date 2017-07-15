public class Enemy extends DynamicBlock {
  
  public float speed = 5; // The horizontal speed of the enemy
  public Level level;
  
  public Enemy(float x, float y) {
    super(x, y, 50, 100);
  }
  
  public void update() {
    // TODO follow player
    // x += speed if player is to the right, -speed if the player is to the left
    
    // Gravity
    y += 1;
    boolean isCollision=false;
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