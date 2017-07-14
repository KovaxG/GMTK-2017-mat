public class StaticBlock extends Rect {
  public StaticBlock(float x, float y, float w, float h) {
    super(x, y, w, h);
  }
  
  public void draw() {
    fill(255);
    rect(x, y, w, h);
  }
}