

Level  level;

Level loadLevels(int levelNr) {
  Level level_0 = new Level(100, 400, 550, 440, new Rect(0, 0, 700, 600)); 
  
  StaticBlock floor = new StaticBlock(40, 560, 700, 20);
  StaticBlock ceiling = new StaticBlock(40, 300, 700, 20);
  StaticBlock lwall = new StaticBlock(40, 300, 20, 280);
  StaticBlock rwall = new StaticBlock(740, 300, 20, 280);
  
  level_0.addStaticBlock(floor);
  level_0.addStaticBlock(ceiling);
  level_0.addStaticBlock(lwall);
  level_0.addStaticBlock(rwall);
  
  /*
   level = level_0;
  enemy = new Enemy(400, 100,level);
  floor = new StaticBlock(0, 500, 1200, 20); //<>//
 
  level.addEnemy(enemy);
  level.addStaticBlock(floor);
  
  
  enemy = new Enemy(600, 250,level);
  level.addEnemy(enemy); 
  */
  return level_0;
}

void setup() {
  size(800, 600);

  frameRate(60);

  level = loadLevels(0);
} 

float x_offset = 0;
float y_offset = 0;

void draw() {
  background(0); 
  
   level.update(direction, jump);
  
   x_offset = saturate(-level.player.x + width/2, level.dimension.x, level.dimension.x);
   y_offset = saturate(-level.player.y + height/2, level.dimension.y, level.dimension.h);
  
  System.out.println(y_offset);
  
   translate(x_offset, y_offset);
  
   level.draw();
}

void mousePressed() {
  if (mouseButton == LEFT && level.mouseBlock == null) {
    level.createMouseBlock(true, mouseX - x_offset, mouseY - y_offset);
  }
  
  if (mouseButton == RIGHT && level.mouseBlock == null) {
    level.createMouseBlock(false, mouseX - x_offset, mouseY - y_offset);
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
  if      (key == 'a') direction = -1;
  else if (key == 'd') direction = 1;
  else if (key == 'w') jump = true;
}

void keyReleased() {
  if (key == 'a' && direction == -1) direction = 0;
  if (key == 'd' && direction ==  1) direction = 0;
  if (key == 'w') jump = false;
}