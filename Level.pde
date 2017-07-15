public class Level {
  ArrayList<StaticBlock> staticBlocks;
  ArrayList<Enemy> enemies;
  Player player;
  
  public Level(){
      player = new Player(0,200, this);
  }
  
  public void addEnemy(Enemy enemy){
    enemies.add(enemy);
  }
  
  public void addstaticBlock(StaticBlock block){
     staticBlocks.add(block);
  }
  
  public void update(){
     player.update();
    for (Enemy enemy:  enemies){
     enemy.update(); 
   }
  }
  

  
}