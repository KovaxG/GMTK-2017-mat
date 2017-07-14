Player player;
Enemy enemy;
StaticBlock floor;

StaticBlock mouseHor;
StaticBlock mouseVer;

void setup() {
  size(800, 600);
  frameRate(60);
  
  player = new Player(200, 100);
  enemy = new Enemy(400, 100);
  floor = new StaticBlock(0, 500, 800, 20);
}

void draw() {
  background(0);
  
   player.update();
   enemy.update();
  
   translate(0.0, 0.0);
  
   player.draw();
   enemy.draw();
   floor.draw();  
}

void mousePressed() {
  
}