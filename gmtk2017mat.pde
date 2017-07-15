Level  currentLevel;
int levelNr = 2;

Level loadLevel(int levelNr) {
  switch(levelNr) {
    case 0: {
      Level level_0 = new Level(100, 400, 550, 400, new Rect(0, 0, 700, 600), new Background() {
        public void draw() {
          textSize(20);
          text("Mathewializer: Level 1", 300, 200);
        } //<>//
      }); 
      
      StaticBlock floor   = new StaticBlock(40, 560, 700, 20);
      StaticBlock ceiling = new StaticBlock(40, 300, 700, 20);
      StaticBlock lwall   = new StaticBlock(40, 300, 20, 280);
      StaticBlock rwall   = new StaticBlock(740, 300, 20, 280); //<>//
      
      //Enemy nme = new Enemy(500, 400, level_0);
      //nme.addFrames("zombi6");
      
      level_0.addStaticBlock(floor);
      level_0.addStaticBlock(ceiling);
      level_0.addStaticBlock(lwall);
      level_0.addStaticBlock(rwall);
<<<<<<< HEAD
       //<>//
=======
      
      //level_0.addEnemy(nme);
      
>>>>>>> e277d2c28488712f756906855e9858031cec0e13
      return level_0;
    }
    case 3: {
    Level level = new Level(100, 400, 550, 400, new Rect(0, 0, 700, 600), new Background() {
        public void draw() {
          textSize(20);
          text("Mathewializer: Level 2", 300, 200);
        }
      }); 
      
      StaticBlock floor1 = new StaticBlock(40, 560, 300, 20);
      StaticBlock floor2 = new StaticBlock(480, 560, 270, 20);
      StaticBlock ceiling = new StaticBlock(40, 300, 700, 20);
      StaticBlock lwall = new StaticBlock(40, 300, 20, 280);
      StaticBlock rwall = new StaticBlock(740, 300, 20, 280);
      
      Enemy deathBlock = new Enemy(0, 800, 800, 20, level);
      deathBlock.statikus = true;
      
      Enemy nme = new Enemy(600, 400, level);
      nme.addFrames("zombi1");
      
      level.addStaticBlock(floor1);
      level.addStaticBlock(floor2);
      level.addStaticBlock(ceiling);
      level.addStaticBlock(lwall);
      level.addStaticBlock(rwall);
      
      level.addEnemy(deathBlock);
      level.addEnemy(nme);
      
      return level;
    }
    case 2: {
    Level level = new Level(100, 400, 1050, 440, new Rect(0, 0, 1300, 600), new Background() {
        public void draw() {
          textSize(20);
          text("Mathewializer: Level 3", 300, 200);
          text("Hint: Tru using the mouse", 600, 200);
        }
      }); 
      
      StaticBlock floor1 = new StaticBlock(40, 560, 400, 20);
      StaticBlock floor2 = new StaticBlock(900, 560, 360, 20);
      StaticBlock ceiling = new StaticBlock(40, 300, 1220, 20);
      StaticBlock lwall = new StaticBlock(40, 300, 20, 280);
      StaticBlock rwall = new StaticBlock(1260, 300, 20, 280);
      
      level.addStaticBlock(floor1);
      level.addStaticBlock(floor2);
      level.addStaticBlock(ceiling);
      level.addStaticBlock(lwall);
      level.addStaticBlock(rwall);
      
      return level;
    }
    default: return null;
  } //<>// //<>//
}

void setup() {
  
  size(800, 600);

  frameRate(60);

  currentLevel = loadLevel(levelNr);
} 

float x_offset = 0;
float y_offset = 0;

void draw() {
  background(0); 
  
   currentLevel.update(direction, jump);
   System.out.println(-currentLevel.player.x + width/2);
   System.out.println(currentLevel.dimension.x-currentLevel.dimension.w+width/2);
   
   x_offset = saturate(currentLevel.player.x , currentLevel.dimension.w-width/2,width/2 ) - width/2;
   y_offset = saturate(-currentLevel.player.y + height/2, currentLevel.dimension.y, currentLevel.dimension.h);
  
   translate(-x_offset, y_offset);
  
   currentLevel.draw();
}

void mousePressed() {
  if (mouseButton == LEFT && currentLevel.mouseBlock == null) {
    currentLevel.createMouseBlock(true, mouseX + x_offset, mouseY - y_offset);
  }
  
  if (mouseButton == RIGHT && currentLevel.mouseBlock == null) {
    currentLevel.createMouseBlock(false, mouseX + x_offset, mouseY - y_offset);
  }
}

void mouseReleased() {
  if (currentLevel.mouseBlock != null) {
    float aw = abs(currentLevel.mouseBlock.w);
    float ah = abs(currentLevel.mouseBlock.h);
    
    if (mouseButton == LEFT  && aw > ah) currentLevel.mouseBlock = null;
    if (mouseButton == RIGHT && aw < ah) currentLevel.mouseBlock = null;
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