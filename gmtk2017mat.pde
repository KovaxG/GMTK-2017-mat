Enemy enemy;
StaticBlock floor;

StaticBlock mouseHor;
StaticBlock mouseVer;
Level  level;

void setup() {
  size(800, 600);
  frameRate(60); //<>//
   //<>//
  level=new Level();
  enemy = new Enemy(400, 100);
  floor = new StaticBlock(0, 500, 800, 20);
 
  level.addEnemy(enemy);
  level.addStaticBlock(floor);
  
  
  enemy = new Enemy(400, 250);
  level.addEnemy(enemy); //<>//
}
 //<>//
void draw() {
  background(0); //<>//
  
   level.update(' ');
  
   translate(0.0, 0.0);
  
   level.draw();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    level.mouseBlock = new StaticBlock(mouseX, mouseY, 100, 20);
  }
  
  if (mouseButton == RIGHT) {
    level.mouseBlock = new StaticBlock(mouseX, mouseY, 20, 100);
  }
}

void mouseReleased() {
  level.mouseBlock = null;
}

void keyPressed() {

}