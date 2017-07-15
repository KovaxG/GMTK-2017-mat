public class DynamicBlock extends Rect {
  Level level;
  
  boolean faceRight = true;
  boolean moving    = false;
  int frame = 0;
  
  PImage frame1;
  PImage frame2;
  
  PImage thisFrame;
  
  public DynamicBlock(float x, float y, float w, float h, Level level) {
    super(x, y, w, h);
    this.level = level;
  }
  
  public void updateAnimation(int direction) {
    moving = direction !=  0;
    if      (direction ==  1) faceRight = true;
    else if (direction == -1) faceRight = false;
  }

  public void drawAnimation() {
    
    if (frame1 == null || frame2 == null) return;
    
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