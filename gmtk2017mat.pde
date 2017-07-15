Enemy enemy;
StaticBlock floor;

StaticBlock mouseHor;
StaticBlock mouseVer;
Level  level;

void setup() {
  size(800, 600);
  frameRate(60); //<>//
  
  level=new Level();
  enemy = new Enemy(400, 100);
  floor = new StaticBlock(0, 500, 800, 20);
 
  level.addEnemy(enemy);
  level.addStaticBlock(floor);
}

void draw() {
  background(0); //<>//
  
   level.update(' ');
  
   translate(0.0, 0.0);
  
   level.draw();
}

void mousePressed() {
  
}

void keyPressed() {

}