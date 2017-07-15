public class Level {
  private ArrayList<StaticBlock> staticBlocks;
  private ArrayList<Enemy> enemies;
  Player player;
  StaticBlock mouseBlock;
  
  public Level(){
    staticBlocks = new ArrayList<StaticBlock>();
    enemies =  new ArrayList<Enemy>();
    
    player = new Player(0,200, this);
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
  
  public ArrayList<Enemy> getEnemies(){
     return enemies; 
  }
  
  
  public void update(int direction, boolean jump){
    player.update(direction, jump);
    for (Enemy enemy:  enemies){
     enemy.update(); 
   }
  }
  
  public void draw() {
    player.draw();
    for (Enemy enemy : enemies) enemy.draw();
    for (StaticBlock block : staticBlocks) block.draw();
    
    if (mouseBlock != null) mouseBlock.draw();
  }
  
}