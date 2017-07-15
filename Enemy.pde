public class Enemy extends DynamicBlock {
  
  public float speed = 2; // The horizontal speed of the enemy
  float ySpeed = 0;
  float yacc=0;
  public boolean statikus = false;
  
  Rect footSense1;
  Rect footSense2;
  
  public Enemy(float x, float y,Level level) {
    super(x, y, 80, 150,level);
    
    footSense1 = new Rect(x, y + h, 40, 20);
    footSense2 = new Rect(x, y + h, 40, 20);
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
    
    // Update invisible floor sense
    footSense1.x = x - 20;
    footSense1.y = y + h;
    footSense2.x = x + w - 20;
    footSense2.y = y + h;
    
    // Check if sense collides
    boolean sense1 = false;
    boolean sense2 = false;
    for (StaticBlock sb : level.staticBlocks) {
      sense1 = sense1 || footSense1.isCollide(sb);
      sense2 = sense2 || footSense2.isCollide(sb);
    }
    if (level.mouseBlock != null) {
      sense1 = sense1 || footSense1.isCollide(level.mouseBlock);
      sense2 = sense2 || footSense2.isCollide(level.mouseBlock);
    }
    
    // Follow player
    int direction = sgn(level.player.x - x);
    updateAnimation(direction);
    
    float xo = x;
    x += direction * speed;
    
    if (isStaticCollision() || isDynamicCollision()){
      x-= speed * direction;
    } else {
      if (!sense1 && x < xo) {
        x -= direction * speed;
        direction = 0;
      }
      if (!sense2 && x > xo) {
        x -= direction * speed;
        direction = 0;
      }
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
    
    if (footSense1 != null && footSense2 != null && false) {
      footSense1.draw();
      footSense2.draw();
    }
  }
}