public class Door extends Rect {
  PImage doorPic;
  
  public Door(float x, float y) {
    super(x, y, 120, 120 * 4/3);
    
    doorPic = loadImage("GFX/door.png");
    doorPic.resize((int)w, (int)h);
  }
  
  public void draw() {
    strokeWeight(8);
    stroke(68, 81, 65);
    fill(66, 244, 104);
    //rect(x, y, w, h);
    image(doorPic, x, y);
  }
}