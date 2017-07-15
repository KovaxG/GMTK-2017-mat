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
    return isStaticCollision() || isDynamicCollision();
  
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
    for (DynamicBlock dblock:level.enemies){
      if (this.isCollide(dblock) && !this.equals(dblock)){
        isCollision = true;
      }
    }
    return isCollision;
  }
}

float sgn(float x) {
  if (x > 0) return 1;
  else if (x < 0) return -1;
  else return 0;
}

float saturate(float x, float min, float max) {
  if (min>max){
     float c=min;
      min=max;
      max=c;
  }
  if (x > max) return max;
  else if (x < min) return min;
  else return x;
}

public abstract class Background {
  public abstract void draw();
}