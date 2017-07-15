public class Enemy extends DynamicBlock {
  
  public float speed = 2; // The horizontal speed of the enemy
  float ySpeed = 0;
  float yacc=0;
  public boolean statikus = false;
  
  public Enemy(float x, float y,Level level) {
    super(x, y, 80, 150,level);
  }
  
  public Enemy(float x, float y, float w, float h, Level level) {
    super(x, y, w, h,level);
  }
  
  public void addFrames(String name) {
    frame1 = loadImage("GFX/" + name + "_1.png");
    frame1.resize((int)w, (int)h);
    
    frame2 = loadImage("GFX/" + name + "_2.png");
    frame2.resize((int)w, (int)h);
    
    thisFrame = frame1; 
  }
  
  public void update() {
    if (statikus) return;
    
    // Follow player
    int direction = sgn(level.player.x - x);
    updateAnimation(direction);
    x += direction * speed;
    if (isStaticCollision() || isDynamicCollision()){
      x-= speed * direction;
    }
    
    moving = direction !=  0;
    if      (direction ==  1) faceRight = true;
    else if (direction == -1) faceRight = false;
    
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
    if (thisFrame == null) rect(x, y, w, h);
    drawAnimation();
  }
}