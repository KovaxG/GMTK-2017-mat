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
  
  public void draw() {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    rect(x, y, w, h);
    stroke(0);
    fill(255);
  }
}

int sgn(float x) {
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