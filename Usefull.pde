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
}

public class DynamicBlock extends Rect {
  public DynamicBlock(float x, float y, float w, float h) {
    super(x, y, w, h);
  }
}