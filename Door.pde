public class Door extends Rect {
  public Door(float x, float y) {
    super(x, y, 80, 120);
  }
  
  public void draw() {
    strokeWeight(8);
    stroke(68, 81, 65);
    fill(66, 244, 104);
    rect(x, y, w, h);
  }
}