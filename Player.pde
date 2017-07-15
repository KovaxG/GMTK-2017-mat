public class Player extends DynamicBlock {
  
  public float speed = 5; // Horizontal speed of the player
  private Level level;
  private float jumpSpeed = defaultJumpSpeed;
  private float ySpeed = 0;
  
  public Player(float x, float y, Level level) {
    super(x, y, 50, 100,level);
    this.level = level;
  }
  
  public void update(int direction, boolean jump) {
    // Input
    x += speed * direction;
    
    
    // Gravity
    ySpeed += gravity;
    y += ySpeed;
    checkDie();
    if (isAnyCollision()){
      y-= ySpeed;
      ySpeed=0;
    }
    
    if (jump){
       y -= jumpSpeed;
    }
    checkDie();
    if (isAnyCollision()){
      y += jumpSpeed;
    }
    
    
  }
  
  public void draw() {
    fill(0, 100, 0);
    rect(x, y, w, h);
  }
  
  public void checkDie(){
  if (isDynamicCollision()/*isDie()*/)
    {
      System.out.println("You died");
      ///TODO implement die
    }
  }
  

}