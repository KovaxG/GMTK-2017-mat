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
    
    if (isDie())
    {
      ///TODO implement die
    }
    
    if (!Level.isCollide()){
        switch(direction)
    }
    
  }
  
  public void draw() {
    fill(0, 100, 0);
    rect(x, y, w, h);
  }
  
    public void isDie(){
    for (Enemy enemy:enemies){
      if (enemy.collide(player)){
        return true;
      }
    }
    return false;
  }
}