Player player;

void setup() {
  size(800, 600);
  frameRate(60);
  
  player = new Player(200, 100, 50, 100);
}

void draw() {
  background(0);
  
   player.update();
  
   player.draw();
}