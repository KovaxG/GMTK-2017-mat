public class Player extends DynamicBlock {
  
  public Player(float x, float y, float w, float h) {
    super(x, y, w, h);
  }
  
  public void update() {
    y += 1;
  }
  
  public void draw() {
    rect(x, y, w, h);
  }
}