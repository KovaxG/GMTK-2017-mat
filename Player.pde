public class Player extends DynamicBlock {
  
  public float speed = 5; // Horizontal speed of the player
  private float jumpSpeed = defaultJumpSpeed;
  private float ySpeed = 0;
  private float yacc = 0;
  boolean isJumping=false;
  

  
  public Player(float x, float y, Level level) {
    super(x, y, 80, 150,level);
    this.level = level;
    
    
    
    frame1 = loadImage("GFX/hero_1.png");
    frame1.resize((int)w, (int)h);
    
    frame2 = loadImage("GFX/hero_2.png");
    frame2.resize((int)w, (int)h);
    
    thisFrame = frame1;
  }
  
  public void update(int direction, boolean jump) {
    // Input
    updateAnimation(direction);
    x += speed * direction;
    
    if (isStaticCollision()){
      x-= speed * direction;
    }
    
      // Check if is inside door
    if (jump) {
      float playerHorizontalMidPoint = (x + x + w)/2;
      float playerVerticalMidPoint = (y + y + h)/2;
      
      if (    level.door.x <= playerHorizontalMidPoint && playerHorizontalMidPoint <= level.door.x + level.door.w
           && level.door.y <= playerVerticalMidPoint   && playerVerticalMidPoint   <= level.door.y + level.door.h) {
        levelNr++;
        
        currentLevel = loadLevel(levelNr);
        if (currentLevel == null){
          levelNr=0;
          currentLevel=loadLevel(0);
        }
      }
    }
    
    
    // Gravity
    ySpeed += gravity - yacc;
    if (yacc>0){
      yacc -= gravity;
    }
    
    y += ySpeed;
    if (ySpeed>0 && isStaticCollision()){ 
      isJumping = false;
    }
    if (isStaticCollision()){
      y -= ySpeed;
      ySpeed=0;
    }
    
    if (jump && !isJumping){
       //y -= jumpSpeed;
       yacc = jumpSpeed/20;
       isJumping = true;
    }
    if (!jump){
      yacc=0;
    }
    checkDie();  
  }
  
  public void draw() {
    strokeWeight(1);
    stroke(0);
    fill(0, 100, 0);
    drawAnimation();
  }
  
  public void checkDie(){
  //System.out.println(this.y);
  //System.out.println(-level.dimension.y+level.dimension.h);
  if (isDynamicCollision() || (this.y>-level.dimension.y+level.dimension.h))
    {

      ded.rewind();
      ded.play();
      
      currentLevel = loadLevel(levelNr);
    }
  }
  

}