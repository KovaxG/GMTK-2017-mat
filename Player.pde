public class Player extends DynamicBlock {
  
  public float speed = 5; // Horizontal speed of the player
  private Level level;
  private float jumpSpeed = defaultJumpSpeed;
  private float ySpeed = 0;
  private float yacc = 0;
  boolean isJumping=false;
  
  boolean faceRight = true;
  boolean moving = false;
  int frame = 0;
  
  PImage frame1;
  PImage frame2;
  
  PImage thisFrame;
  
  public Player(float x, float y, Level level) {
    super(x, y, 80, 150,level);
    this.level = level;
    
    frame1 = loadImage("GFX/hero_1_a.png");
    frame1.resize((int)w, (int)h);
    
    frame2 = loadImage("GFX/hero_2_a.png");
    frame2.resize((int)w, (int)h);
    
    thisFrame = frame1;
  }
  
  public void update(int direction, boolean jump) {
    // Input
    moving = direction != 0;
    
    if      (direction ==  1) faceRight = true;
    else if (direction == -1) faceRight = false;
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
    //rect(x, y, w, h);
    
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
    

    //image(frame2, x, y);
  }
  
  public void checkDie(){
  if (isDynamicCollision())
    {
      //System.out.println("You died");
      ///TODO implement die
    }
  }
  

}