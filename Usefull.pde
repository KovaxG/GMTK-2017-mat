public class Rect {
  public float x;
  public float y;
  public float w;
  public float h;
  
  public Rect(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public boolean isCollide(Rect rect){
    if (rect.y >=this.y + this.h)
        return false;
    if (rect.x >= this.x + this.w)
        return false;
    if (rect.y + rect.h <= this.y)
        return false;
    if (rect.x + rect.w <=this.x)
        return false;
    return true;
  }
}

public class DynamicBlock extends Rect {
  Level level;
  public DynamicBlock(float x, float y, float w, float h, Level level) {
    super(x, y, w, h);
    this.level = level;
  }
  
  public boolean isAnyCollision(){
    boolean isCollision=false;
    if (level.mouseBlock != null) {
      if (this.isCollide(level.mouseBlock)) {
        isCollision = true;
      }
    }
    for (Rect rect:level.getStaticBlocks()){
      if (this.isCollide(rect)){
        isCollision = true;
      }
    }
    for (Enemy enemy:level.getEnemies()){
      if (this.isCollide(enemy) && !this.equals(enemy)){
        isCollision = true;
      }
    }
    return isCollision;
  
  }
  
  public boolean isStaticCollision(){
    boolean isCollision=false;
    if (level.mouseBlock != null) {
      if (this.isCollide(level.mouseBlock)) {
        isCollision = true;
      }
    }
    for (Rect rect:level.getStaticBlocks()){
      if (this.isCollide(rect)){
        isCollision = true;
      }
    }
    return isCollision;
    
  }
  
  public boolean isDynamicCollision(){
    boolean isCollision=false;
    for (DynamicBlock dblock:level.getEnemies()){
      if (this.isCollide(dblock) && !this.equals(dblock)){
        isCollision = true;
      }
    }
    return isCollision;
  }
  
  
}