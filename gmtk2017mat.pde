Enemy enemy;
StaticBlock floor;

StaticBlock mouseHor;
StaticBlock mouseVer;
Level  level;

void setup() {
  size(800, 600);

  frameRate(60); //<>//

  level=new Level();
  enemy = new Enemy(400, 100,level);
  floor = new StaticBlock(0, 500, 800, 20);
 
  level.addEnemy(enemy);
  level.addStaticBlock(floor);
  
  
  enemy = new Enemy(400, 250,level);
  level.addEnemy(enemy); //<>//
} //<>//

void draw() {
  background(0); 
  
   level.update(direction, jump);
  
   translate(0.0, 0.0);
  
   level.draw();
}

void mousePressed() {
  if (mouseButton == LEFT && level.mouseBlock == null) {
    level.mouseBlock = new StaticBlock(mouseX, mouseY, 100, -20);
  }
  
  if (mouseButton == RIGHT && level.mouseBlock == null) {
    level.mouseBlock = new StaticBlock(mouseX, mouseY, 20, -100);
  }
}

void mouseReleased() {
  if (level.mouseBlock != null) {
    float aw = abs(level.mouseBlock.w);
    float ah = abs(level.mouseBlock.h);
    
    if (mouseButton == LEFT  && aw > ah) level.mouseBlock = null;
    if (mouseButton == RIGHT && aw < ah) level.mouseBlock = null;
  }
}

int direction = 0;
boolean jump = false;

void keyPressed() {
  if (key == 'a') direction = -1;
  else if (key == 'd') direction = 1;
  else if (key == 'w') jump = true;
}

void keyReleased() {
  if (key == 'a' && direction == -1) direction = 0;
  if (key == 'd' && direction ==  1) direction = 0;
  if (key == 'w') jump = false;
}