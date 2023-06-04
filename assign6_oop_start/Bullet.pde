class Bullet{
  float x;
  float y;
  float speed;
  
  static final float W=31;
  static final float H=27;
  
  Bullet(float x, float y) {
    this.x = x;
    this.y = y;
    this.speed = 7;
  }
  
  boolean isHit (Enemy e){
    return AABB(x,y,W,H,e.x,e.y,Enemy.W, Enemy.H);
  }
  
  void move(){
    x -= speed;
  }

}
