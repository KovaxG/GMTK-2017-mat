Player player;
Enemy enemy;
StaticBlock floor;

StaticBlock mouseHor;
StaticBlock mouseVer;
Level  level;

void setup() {
  size(800, 600);
  frameRate(60); //<>//
  
  level=new Level();
  player = new Player(200, 100, level);
  enemy = new Enemy(400, 100, level);
  floor = new StaticBlock(0, 500, 800, 20);
  level.setPlayer(player);
  level.addEnemy(enemy);
  level.addStaticBlock(floor);
}

void draw() {
  background(0); //<>//
  
   level.update(' ');
  
   translate(0.0, 0.0);
  
   player.draw();
   enemy.draw();
   floor.draw();  
}

void mousePressed() {
  
}