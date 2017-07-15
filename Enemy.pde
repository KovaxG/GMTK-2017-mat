public class Enemy extends DynamicBlock {
  
  public float speed = 2; // The horizontal speed of the enemy
  public Level level;
  float ySpeed = 0;
  float yacc=0;
  
  public Enemy(float x, float y,Level level) {
    super(x, y, 50, 100,level);
  }
  
  public void update() {
    // Follow player
    float direction = sgn(level.player.x - x);
    x += direction * speed;
    if (isStaticCollision() || isDynamicCollision()){
      x-= speed * direction;
    }
    
    ySpeed += gravity - yacc;
    if (yacc>0){
      yacc -= gravity;
    }
     y += ySpeed;
     if (isStaticCollision()){
      y -= ySpeed;
      ySpeed=0;
    }
    
    // Gravitational Collision
    y += gravity;
    if (isAnyCollision()){
       y -= gravity; 
    }
    
    
    
  }
  

  
  public void draw() {
    strokeWeight(1);
    stroke(0);
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
}