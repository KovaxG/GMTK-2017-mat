public class Player extends DynamicBlock {
  
  public float speed = 5; // Horizontal speed of the player
  private Level level;
  private float jumpSpeed = defaultJumpSpeed;
  private float ySpeed = 0;
  private float yacc = 0;
  boolean isJumping=false;
  
  public Player(float x, float y, Level level) {
    super(x, y, 50, 100,level);
    this.level = level;
  }
  
  public void update(int direction, boolean jump) {
    // Input
    x += speed * direction;
    checkDie();
    if (isStaticCollision()){
      x-= speed * direction;
    }
    
    
    // Gravity
    ySpeed += gravity - yacc;
    if (yacc>0){
      yacc -= gravity;
    }
    
    y += ySpeed;
    checkDie();
    if (isStaticCollision()){
      y -= ySpeed;
      ySpeed=0;
      isJumping = false;
    }
    
    if (jump && !isJumping){
       //y -= jumpSpeed;
       yacc = jumpSpeed/20;
       isJumping = true;
    }
    checkDie();
    
    
    
    
  }
  
  public void draw() {
    strokeWeight(1);
    stroke(0);
    fill(0, 100, 0);
    rect(x, y, w, h);
  }
  
  public void checkDie(){
  if (isDynamicCollision())
    {
      //System.out.println("You died");
      ///TODO implement die
    }
  }
  

}