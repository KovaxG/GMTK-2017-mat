public class Level {
  private ArrayList<StaticBlock> staticBlocks;
  private ArrayList<Enemy> enemies;
  public Player player;
  public StaticBlock mouseBlock;
  public Rect ghostBlock;
  public Door door;
  public Rect dimension;
  
  public Background background;
  
  public Level(float playerX, float playerY, float doorX, float doorY, Rect dimensions, Background backg){
    staticBlocks = new ArrayList<StaticBlock>();
    enemies =  new ArrayList<Enemy>();
    
    player = new Player(playerX, playerY, this);
    door = new Door(doorX, doorY);
    
    this.dimension = dimensions;
    
    background = backg;
  }
  
  public void createMouseBlock(boolean horizontal, float x_pos, float y_pos) {
    
    StaticBlock temp;
    
    if (horizontal) temp = new StaticBlock(x_pos - 50, y_pos - 10, 100, 20);
    else            temp = new StaticBlock(x_pos - 10, y_pos - 50, 20, 100);
    
    ghostBlock = new Rect(temp.x, temp.y, temp.w, temp.h);

    // Collide with static blocks
    for (StaticBlock sb : staticBlocks) 
      if (temp.isCollide(sb)) {
        mouseBlock = null;
        whoops.rewind();
        whoops.play();
        return;
      }
    
    // Collide with enemies
    for (Enemy nme : enemies) 
      if (temp.isCollide(nme)) {
        mouseBlock = null;
        whoops.rewind();
        whoops.play();
        return;
      }
    
    // Collide with player
    if (temp.isCollide(player)) {
      mouseBlock = null;
        whoops.rewind();
        whoops.play();
      return;
    }

    mouseBlock = temp;
  }
  
  public void addEnemy(Enemy enemy){
    enemies.add(enemy);
    enemy.level = this;
  }
  
  public void setPlayer(Player player){
    this.player=player; 
  }
  
  public void addStaticBlock(StaticBlock block){
    staticBlocks.add(block);  
  }
  
  
  public void addstaticBlock(StaticBlock block){
     staticBlocks.add(block);
  }
  
  public ArrayList<StaticBlock> getStaticBlocks(){
  
    return staticBlocks;
  }
  
  public void update(int direction, boolean jump){
    player.update(direction, jump);
    for (Enemy enemy:  enemies){
     enemy.update(); 
   }
  }
  
  public void draw() {
    background.draw();
    door.draw();
    player.draw();
    for (Enemy enemy : enemies) enemy.draw();
    for (StaticBlock block : staticBlocks) block.draw();
    
    
    if      (mouseBlock != null) mouseBlock.draw();
    else if (ghostBlock != null) ghostBlock.draw();
  }
  
}