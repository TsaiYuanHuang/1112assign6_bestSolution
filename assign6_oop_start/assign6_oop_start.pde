final int GAME_START   = 0;
final int GAME_PLAYING = 1;
final int GAME_WIN     = 2;
final int GAME_LOSE    = 3;
int gameState = 0 ; 

boolean isMovingUp ;
boolean isMovingDown ;
boolean isMovingLeft ;
boolean isMovingRight ;
  
// objects
Background bg;
Fighter fighter;
Treasure treasure;
HPDisplay hpDisplay;

// collections
BulletMgr bulletMgr;
FlameMgr flameMgr;
EnemyMgr enemyMgr;


void setup () {
  
  size(640, 480) ;
  textAlign(CENTER);
  
  bg = new Background();
  hpDisplay = new HPDisplay();
  
  fighter = new Fighter(20);
  treasure = new Treasure();

  enemyMgr = new EnemyMgr();
  bulletMgr = new BulletMgr();
  flameMgr = new FlameMgr();
  
  gameState   = GAME_START ;
 
}

void draw() {

  switch(gameState){
      
    case GAME_START:
      bg.draw(GAME_START);    
      break;
    
    case GAME_PLAYING:
      bg.draw(GAME_PLAYING);
      hpDisplay.draw(fighter.hp);
      
      treasure.draw();
      fighter.draw();
      
      bulletMgr.draw();
     
      flameMgr.draw();
      enemyMgr.draw();

      break;
      
    case GAME_LOSE:
      bg.draw(GAME_LOSE);  
      break;
  }
 
}

boolean AABB(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh)
{
  // Collision x-axis?
    boolean collisionX = (ax + aw >= bx) && (bx + bw >= ax);
    // Collision y-axis?
    boolean collisionY = (ay + ah >= by) && (by + bh >= ay);
    return collisionX && collisionY;
}
          
void keyPressed(){
  switch(keyCode){
    case UP : isMovingUp = true ;break ;
    case DOWN : isMovingDown = true ; break ;
    case LEFT : isMovingLeft = true ; break ;
    case RIGHT : isMovingRight = true ; break ;
    default :break ;
  }
}

void keyReleased(){
  switch(keyCode){
    case UP : isMovingUp = false ;break ;
    case DOWN : isMovingDown = false ; break ;
    case LEFT : isMovingLeft = false ; break ;
    case RIGHT : isMovingRight = false ; break ;
    default :break ;
  }
  if (key == ' ') {
    if (gameState == GAME_PLAYING) {
      fighter.fire();
    }
  }
  if (key == ENTER) {
    switch(gameState) {
      case GAME_START:
      case GAME_LOSE:
        setup();
        gameState = GAME_PLAYING;
      default : break ;
    }
  }
}
