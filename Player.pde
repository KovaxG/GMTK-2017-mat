public class Player extends DynamicBlock {
  public float x;
  public float y;
  
  public float width;
  public float height;
  
  public Player(int iksz, int ipsz) {
    x = iksz;
    y = ipsz;
  }
  
  public void update() {
    y += 1;
  }
  
  public void draw() {
    rect(x, y, width, height);
  }
}