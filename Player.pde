public class Player extends DynamicBlock {
  
  public float speed = 5; // Horizontal speed of the player
  private Level level;
  
  public Player(float x, float y, Level level) {
    super(x, y, 50, 100);
    this.level=level;
  }
  
  public void update(char direction) {
    //asdw
    // TODO Handle input here
    
    // Gravity
    y += 1;
    checkDie();
    boolean isCollision =false;
    for (StaticBlock block:level.staticBlocks){
      if (block.isCollide(this)){
        isCollision=true;
      }
      if (isCollision){
        y-= 1;   
      }
    }
    
  }
  
  public void draw() {
    fill(0, 100, 0);
    rect(x, y, w, h);
  }
  
  public void checkDie(){
  if (isDie())
    {
      System.out.println("You died");
      ///TODO implement die
    }
  }
  
  public boolean isDie(){
    for (Enemy enemy:level.getEnemies()){
      if (enemy.isCollide(this)){
        return true;
      }
    }
    return false;
  }
}