public class Enemy extends DynamicBlock {
  
  public float speed = 2; // The horizontal speed of the enemy
  float ySpeed = 0;
  float yacc=0;
  public boolean statikus = false;
  
  boolean faceRight = false;
  boolean moving = false;
  int frame = 0;
  
  PImage frame1;
  PImage frame2;
  
  PImage thisFrame;
  
  public Enemy(float x, float y,Level level) {
    super(x, y, 50, 100,level);
  }
  
  public Enemy(float x, float y, float w, float h, Level level) {
    super(x, y, w, h,level);
  }
  
  
  
  public void update() {
    if (statikus) return;
    
    // Follow player
    float direction = sgn(level.player.x - x);
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
    rect(x, y, w, h);
    /*
    if (moving) {
      frame = frame + 1;
      if (frame == 10) {
        frame = 0;
        
        if (thisFrame.equals(frame1)) thisFrame = frame2;
        else                          thisFrame = frame1;
      }
    }
    else {
      thisFrame = frame1;
    }
    
    if (faceRight) {
      image(thisFrame, x, y);
    }
    else {
      scale(-1, 1);
      image(thisFrame, -x - w, y);
      scale(-1, 1);
    }
    */
  }
}