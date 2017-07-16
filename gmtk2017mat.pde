import ddf.minim.*;
import java.util.Random;

Minim minim;
AudioSnippet ded;
AudioSnippet whoops;
AudioSnippet winSound;
 //<>//
PImage bgImage;  //<>// //<>//
PImage bgSub;  //<>//
  
boolean devMode = false;
   //<>//
Level  currentLevel; //<>//
int levelNr = 0;
  //<>//
  int[] goodZombies={1,2,3,5,6}; //<>//
  public String getZombieName(){
    return "zombi"+goodZombies[new Random().nextInt(goodZombies.length)];
  }
 
  int textStartX = 70,textStartY=200,textIncrement=20; //<>//
Level loadLevel(int levelNr) { //<>//
  
  switch(levelNr) { //<>//
    case 0: {
       //<>//
      Level level_0 = new Level(100, 400, 550, 400, new Rect(0, 0, 700, 600), new Background() {
        public PImage title = loadImage("GFX/Title.png");
        public PImage abut = loadImage("GFX/A.png");
        public PImage dbut = loadImage("GFX/D.png"); //<>//
        public PImage wbut = loadImage("GFX/W.png");
        public PImage arrow = loadImage("GFX/arrow.png");
        public PImage doorSign = loadImage("GFX/enter.png"); //<>//
        
        public void draw() { //<>// //<>//
          textSize(20); //<>//
          text("Level 1: Start", textStartX, textStartY+50); //<>//
          text("You have found yourself fleeing from an apocalypse",textStartX, textStartY+textIncrement + 50); //<>//
           //<>//
          image(title, 380 - title.width/2, 20);
          
          arrow.resize(30, 30);
          
          abut.resize(40, 40);
          image(abut, 80, 350);
          image(arrow, 80, 320);
          
          dbut.resize(40, 40);
          image(dbut, 150, 350);
          scale(-1, 1);
          image(arrow, -190, 320);
          scale(-1, 1);
           //<>//
          wbut.resize(40, 40);
          image(wbut, 600, 340);
          doorSign.resize(40, 40);
          image(doorSign, 550, 340);
          
        } 
      }); 
       //<>// //<>//
      StaticBlock floor   = new StaticBlock(40, 560, 700, 20); //<>// //<>//
      StaticBlock ceiling = new StaticBlock(40, 300, 700, 20);
      StaticBlock lwall   = new StaticBlock(40, 300, 20, 280); //<>// //<>//
      StaticBlock rwall   = new StaticBlock(740, 300, 20, 280); //<>//
 //<>//
      level_0.addStaticBlock(floor); //<>// //<>// //<>//
      level_0.addStaticBlock(ceiling); //<>//
      level_0.addStaticBlock(lwall); //<>//
      level_0.addStaticBlock(rwall); //<>// //<>//
      
      return level_0;
    }
    case 1: {
    Level level = new Level(100, 400, 550, 400, new Rect(0, 0, 700, 600), new Background() { //<>//
       PImage jumpsign = loadImage("GFX/jump.png"); //<>//
       PImage wbut = loadImage("GFX/W.png");
      
        public void draw() { //<>//
          textSize(20);
          text("Level 2 : The Hole", textStartX, textStartY);
          text("To reach a safe haven you have found yourself wandering",textStartX, textStartY+textIncrement);
          text("through a building",textStartX, textStartY+textIncrement*2); //<>//
           //<>//
          jumpsign.resize(80, 40);
          image(jumpsign, 370, 400); //<>//
          wbut.resize(40, 40); //<>//
          image(wbut, 390, 350);
        }
      });  //<>//
      
      StaticBlock floor1 = new StaticBlock(40, 560, 300, 20); //<>//
      StaticBlock floor2 = new StaticBlock(480, 560, 270, 20);
      StaticBlock ceiling = new StaticBlock(40, 300, 700, 20);
      StaticBlock lwall = new StaticBlock(40, 300, 20, 280);
      StaticBlock rwall = new StaticBlock(740, 300, 20, 280);
      
      Enemy deathBlock = new Enemy(0, 800, 800, 20, level); //<>//
      deathBlock.statikus = true; //<>//
       //<>//
      level.addStaticBlock(floor1); //<>//
      level.addStaticBlock(floor2);
      level.addStaticBlock(ceiling);
      level.addStaticBlock(lwall); //<>//
      level.addStaticBlock(rwall);
       //<>//
      level.addEnemy(deathBlock); //<>//
      
      return level; //<>//
    }
    case 2: {
    Level level = new Level(100, 400, 1050, 400, new Rect(0, 0, 1300, 600), new Background() { //<>// //<>//
        PImage mousebutton = loadImage("GFX/lmouse.png");
       //<>//
        public void draw() { //<>//
          textSize(20);
          text("Level 3 : The Wide Hole", textStartX, textStartY); //<>//
          text("After eating a mouse, you have obtained the power to materialize a white object",textStartX, textStartY+textIncrement); //<>//
          
          mousebutton.resize(30, 40); //<>//
          image(mousebutton, 225, 235);
        } //<>//
      }); 
       //<>//
      StaticBlock floor1 = new StaticBlock(40, 560, 400, 20); //<>//
      StaticBlock floor2 = new StaticBlock(900, 560, 360, 20); //<>//
      StaticBlock ceiling = new StaticBlock(40, 300, 1220, 20); //<>//
      StaticBlock lwall = new StaticBlock(40, 300, 20, 280); //<>// //<>//
      StaticBlock rwall = new StaticBlock(1260, 300, 20, 280); //<>//
       //<>//
      level.addStaticBlock(floor1); //<>//
      level.addStaticBlock(floor2); //<>//
      level.addStaticBlock(ceiling); //<>//
      level.addStaticBlock(lwall);
      level.addStaticBlock(rwall);
      
      return level;
    }
    case 3: {
    Level level = new Level(100, 400, 550, 400, new Rect(0, 0, 700, 600), new Background() {
        public void draw() { //<>//
          textSize(20);
          text("Level 4 : Creep", textStartX, textStartY); //<>//
          text("You have yet again encountered the enemies you fled from",textStartX, textStartY+textIncrement);
          text("creeping through this building",textStartX, textStartY+textIncrement*2);
        } //<>//
      }); 
      
      StaticBlock floor1 = new StaticBlock(40, 560, 300, 20);
      StaticBlock floor2 = new StaticBlock(480, 560, 270, 20);
      StaticBlock ceiling = new StaticBlock(40, 300, 700, 20);
      StaticBlock lwall = new StaticBlock(40, 300, 20, 280); //<>//
      StaticBlock rwall = new StaticBlock(740, 300, 20, 280);
       //<>//
      Enemy deathBlock = new Enemy(0, 800, 800, 20, level); //<>//
      deathBlock.statikus = true; //<>//
       //<>//
      Enemy nme = new Enemy(600, 400, level);
      nme.addFrames(getZombieName());
      
      level.addStaticBlock(floor1);
      level.addStaticBlock(floor2);
      level.addStaticBlock(ceiling);
      level.addStaticBlock(lwall); //<>//
      level.addStaticBlock(rwall); //<>// //<>// //<>// //<>// //<>//
       //<>// //<>//
      level.addEnemy(deathBlock);
      level.addEnemy(nme); //<>//
       //<>//
      return level; //<>//
    }
    case 4: {
      
      Level level = new Level(100, 400, 600, 400, new Rect(0, 0, 1200, 600), new Background() {
        PImage mouseBut = loadImage("GFX/rmouse.png");
         //<>// //<>//
        public void draw() { //<>// //<>//
          textSize(20);
          text("Level 5: Denied", textStartX, textStartY); //<>//
          text("It's polite to open doors for others, but in this case some rudeness",textStartX, textStartY+textIncrement); //<>//
          text("is in order. Maybe you could use some mouse powers?", textStartX, textStartY + textIncrement *2);
          
          mouseBut.resize(30, 40);
          image(mouseBut, 470, textStartY + textIncrement *2 + 10);
        }  //<>//
      }); 
       //<>//
      StaticBlock floor   = new StaticBlock(40, 560, 1020, 20);
      StaticBlock ceiling = new StaticBlock(40, 300, 1020, 20);
      StaticBlock lwall   = new StaticBlock(40, 300, 20, 280); //<>//
      StaticBlock rwall   = new StaticBlock(1050, 300, 20, 280); //<>//
      
      Enemy eminem = new Enemy(800, 400, level);
      eminem.addFrames(getZombieName());

      level.addStaticBlock(floor); //<>//
      level.addStaticBlock(ceiling);
      level.addStaticBlock(lwall);
      level.addStaticBlock(rwall); //<>//
      
      level.addEnemy(eminem); //<>// //<>//
       //<>//
      return level;
    }
    case 5: {
    Level level = new Level(100, 400, 600, 40, new Rect(0, 0, 700, 600), new Background() {
        public void draw() { //<>// //<>//
          textSize(20); //<>// //<>//
          text("Level 6 : ", textStartX, textStartY-100); //<>//,
          text("Some rooms are partially in ruin" ,textStartX, textStartY+textIncrement-100); //<>//
          text("and curiously look like a puzzle",textStartX, textStartY+textIncrement*2-100); //<>//
        } //<>//
      });  //<>//
      
      StaticBlock floor = new StaticBlock(40, 560, 700, 20);
      StaticBlock floor1 = new StaticBlock(40, 360, 300, 20); //<>//
      StaticBlock floor2 = new StaticBlock(550, 200, 210, 20);
      StaticBlock ceiling = new StaticBlock(40, 10, 700, 20); //<>//
      StaticBlock lwall = new StaticBlock(40, 10, 20, 570);
      StaticBlock rwall = new StaticBlock(740, 10, 20, 570);
       //<>// //<>//
      Enemy deathBlock = new Enemy(0, 800, 800, 20, level);
      deathBlock.statikus = true;
       //<>//
      Enemy nme = new Enemy(600, 50, level);
      nme.addFrames("zombi1");
       //<>//
      level.addStaticBlock(floor);
      level.addStaticBlock(floor1);
      level.addStaticBlock(floor2); //<>//
      level.addStaticBlock(ceiling); //<>//
      level.addStaticBlock(lwall); //<>//
      level.addStaticBlock(rwall);
       //<>//
      level.addEnemy(deathBlock); //<>//
      level.addEnemy(nme); //<>//
      
      return level;
    }

    case 6: { //<>//
        Level level = new Level(100, 240, 1100, 400, new Rect(0, 0, 1700, 600), new Background() { //<>//
        public void draw() {
          textSize(20); //<>// //<>//
          text("Level 7", textStartX, textStartY); //<>// //<>//
          text("But what do they eat?",textStartX, textStartY+textIncrement);
          text("It can't just be the few people who wander in",textStartX, textStartY+textIncrement*2); //<>//
        } //<>//
      }); 
      
      StaticBlock floor1 = new StaticBlock(40, 560, 1220, 20); //<>//
      //StaticBlock floor2 = new StaticBlock(900, 560, 360, 20); //<>//
      StaticBlock ceiling = new StaticBlock(40, 50, 1220, 20);
      StaticBlock lwall = new StaticBlock(40, 50, 20, 530); //<>// //<>//
      StaticBlock rwall = new StaticBlock(1260, 50, 20, 530); //<>// //<>//
       //<>//
      for (int i=0;i<8;i++){ //<>//
        Enemy nme = new Enemy(400+i*100, 400, level); //<>//
        nme.addFrames(getZombieName());
        level.addEnemy(nme);
      }
      
      level.addStaticBlock(floor1);
      //level.addStaticBlock(floor2);
      level.addStaticBlock(ceiling);
      level.addStaticBlock(lwall); //<>//
      level.addStaticBlock(rwall);
      
       //<>// //<>// //<>//
      return level;
    }

    case 7: {
    Level level = new Level(760, 400, 100, 400, new Rect(0, 0, 1700, 600), new Background() {
        public void draw() { //<>//
          textSize(20); //<>//
          text("Level 8", textStartX, textStartY); //<>//
          text("Sometimes the curious are rewarded",textStartX, textStartY+textIncrement); //<>//
        } //<>//
      }); 
      
      StaticBlock floor1 = new StaticBlock(40, 560, 1520, 20); //<>// //<>//
      //StaticBlock floor2 = new StaticBlock(900, 560, 360, 20); //<>//
      StaticBlock ceiling = new StaticBlock(40, 50, 1520, 20);
      StaticBlock lwall = new StaticBlock(40, 50, 20, 530); //<>//
      StaticBlock rwall = new StaticBlock(1560, 50, 20, 530); //<>// //<>//
       //<>//
      for (int i=0;i<14;i++){
        if (i>=4 && i<=9)
          continue;
        Enemy nme = new Enemy(100+i*100, 400, level);
        nme.addFrames(getZombieName());
        level.addEnemy(nme);
      } //<>//
       //<>//
      level.addStaticBlock(floor1); //<>//
      //level.addStaticBlock(floor2);
      level.addStaticBlock(ceiling);
      level.addStaticBlock(lwall); //<>//
      level.addStaticBlock(rwall);
       //<>//
      
      return level;
    }
    case 8: {
    Level level = new Level(700, 1500, 100, 400, new Rect(0, 0, 1000, 2600), new Background() {
        public void draw() {
          textSize(20); //<>//
          text("Level 9", textStartX+100, textStartY+1500); //<>//
          text("Once in a while",textStartX+100, textStartY-textIncrement*3+1500);
          text("One might rise from the depths of hell",textStartX+100, textStartY-textIncrement*6+1500);
        }
      }); 
      
      bgImage.resize(8000,4000);
      StaticBlock floor1 = new StaticBlock(40, 2560, 920, 20); //<>//
      StaticBlock floor2 = new StaticBlock(40, 560, 360, 20); //<>//
      StaticBlock ceiling = new StaticBlock(40, 50, 1520, 20);
      StaticBlock lwall = new StaticBlock(40, 50, 20, 2530); //<>//
      StaticBlock rwall = new StaticBlock(960, 50, 20, 2530); //<>//
      
      for (int i=0;i<9;i++){
        Enemy nme = new Enemy(80+i*100, 2400, level);
        nme.addFrames(getZombieName());
        level.addEnemy(nme);
      }
      
      level.addStaticBlock(floor1);
      level.addStaticBlock(floor2);
      level.addStaticBlock(ceiling);
      level.addStaticBlock(lwall); //<>//
      level.addStaticBlock(rwall);
      
      
      return level;
    }
    
    case 9: {
    Level level = new Level(100, 550, 600, 900, new Rect(0, 0, 700, 1100), new Background() {
        public void draw() {
          textSize(20);
          text("Level 10", 300, 200);
          text("Some even have closed off regions",textStartX,250); //<>//
          text("without any meaning",textStartX,250+textIncrement); //<>// //<>// //<>//
        }
      }); 
      bgImage.resize(4000,2000);
      
      StaticBlock floor = new StaticBlock(40, 1060, 700, 20);
      StaticBlock floor2 = new StaticBlock(40, 700, 510, 20);
      StaticBlock ceiling = new StaticBlock(40, 510, 700, 20); //<>//
      StaticBlock wall = new StaticBlock(530, 720, 20, 340);
      StaticBlock lwall = new StaticBlock(40, 510, 20, 570);
      StaticBlock rwall = new StaticBlock(740, 510, 20, 570);
            
      Enemy nme = new Enemy(600, 550, level);
      nme.addFrames(getZombieName());
       //<>//
      level.addStaticBlock(floor);
      level.addStaticBlock(floor2);
      level.addStaticBlock(wall);
      level.addStaticBlock(ceiling);
      level.addStaticBlock(lwall); //<>//
      level.addStaticBlock(rwall);
      
      level.addEnemy(nme);
      
      return level;
    }
    default: return null; //<>//
  } //<>//
}


void setup() {
  
  size(800, 600);
  minim = new Minim(this);
  noCursor();

  //bg image
  bgImage = loadImage("GFX/bg.png");

  frameRate(60);

  currentLevel = loadLevel(levelNr);
  
  //sound preload
  ded = minim.loadSnippet("SFX/aww.wav");
  ded.rewind();
  
  whoops = minim.loadSnippet("SFX/whoops.wav");
  whoops.rewind();
  
  winSound = minim.loadSnippet("SFX/win.wav");
  winSound.rewind();
  
  
  //FPS counter
  currentTime = millis();
  lastTime= currentTime;
} 

int FPS=0;
int frames=0;
int currentTime;
int lastTime;

float x_offset = 0;
float y_offset = 0;

void draw() {
   background(0); 
   bgSub = bgImage.get((int)x_offset+200,(int)y_offset+500,800,600);
   image(bgSub,0,0);
  
   currentLevel.update(direction, jump);
   
   x_offset = saturate(currentLevel.player.x , currentLevel.dimension.w-width/2,width/2 ) - width/2;
   y_offset = saturate(currentLevel.player.y , currentLevel.dimension.h-height/2,height/2 ) - height/2;
  
   translate(-x_offset, -y_offset);

  
   currentLevel.draw();
   
   translate(x_offset, y_offset);
   
   fill(255);
     rect(mouseX, mouseY, 5, 5);
   
   if (devMode) {
          
     ///mouseposition;
     text("X: "+(mouseX+x_offset)+"; Y: "+(mouseY-y_offset),20,40);
     
     ///FPS counter
     text("FPS: "+FPS,20,20);
     frames++;
     if (millis() - lastTime >200){
       FPS = frames*1000/(millis()-lastTime);
       frames = 0;
       lastTime = millis();
     }
   }
}

void mousePressed() {
  if (mouseButton == LEFT && currentLevel.mouseBlock == null) {
    currentLevel.createMouseBlock(true, mouseX + x_offset, mouseY + y_offset);
  }
  
  if (mouseButton == RIGHT && currentLevel.mouseBlock == null) {
    currentLevel.createMouseBlock(false, mouseX + x_offset, mouseY + y_offset);
  }
}

void mouseReleased() {
  if (currentLevel.mouseBlock != null) {
    float aw = abs(currentLevel.mouseBlock.w);
    float ah = abs(currentLevel.mouseBlock.h);
    
    if (mouseButton == LEFT  && aw > ah) currentLevel.mouseBlock = null;
    if (mouseButton == RIGHT && aw < ah) currentLevel.mouseBlock = null;
  }
  
  currentLevel.ghostBlock = null;
}

int direction = 0;
boolean jump = false;

void keyPressed() {
  if      (key == 'a' || key == 'A') direction = -1;
  else if (key == 'd' || key == 'D') direction = 1;
  else if (key == 'w' || key == 'W') jump = true;
  else if (key == '`' &&  devMode) devMode = false;
  else if (key == '`' && !devMode) devMode = true;
}

void keyReleased() {
  if ((key == 'a'  || key == 'A') && direction == -1) direction = 0;
  if ((key == 'd'  || key == 'D') && direction ==  1) direction = 0;
  if ( key == 'w'  || key == 'W') jump = false;
}