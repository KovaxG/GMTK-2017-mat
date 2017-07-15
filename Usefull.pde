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
  public DynamicBlock(float x, float y, float w, float h) {
    super(x, y, w, h);
  }
}