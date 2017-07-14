public class Player extends DynamicBlock {
  
  public float speed = 5; // Horizontal speed of the player
  
  public Player(float x, float y) {
    super(x, y, 50, 100);
  }
  
  public void update() {
    // TODO Handle input here
    
    // Gravity
    y += 1;
  }
  
  public void draw() {
    fill(0, 100, 0);
    rect(x, y, w, h);
  }
}