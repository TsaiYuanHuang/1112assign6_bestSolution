class Fighter{
  PImage fighterImg;
  float x = 0;
  float y = 0;
  float speed = 5;
  int hp;


  Fighter(int hp) {
    this.fighterImg = loadImage("img/fighter.png");
    this.x = width - this.fighterImg.width;
    this.y = (height-this.fighterImg.height)/2;
    this.hp = hp;
  }

  void draw() {
    image(fighterImg, this.x, this.y);

    if (isMovingUp) {
      this.move(UP);
    }
    if (isMovingDown) {
      this.move(DOWN);  
    }
    if (isMovingLeft) {
      this.move(LEFT);
    }
    if (isMovingRight) {
      this.move(RIGHT);  
    }
  }

  void move(int direction) {
    switch (direction) {
      case UP:
        if (this.y - speed > 0) {
          this.y-= speed;
        }
        break;
      case DOWN:
        if (this.y + speed < height - this.fighterImg.height) {
          this.y+= speed;
        }
        break;
      case LEFT:
        if (this.x - speed > 0) {
          this.x-= speed;
        }
        break;
      case RIGHT:
        if (this.x + speed < width - this.fighterImg.width) {
          this.x+= speed;
        }
        break;
    }
  }
  
  boolean isHit(Enemy e){
    return AABB(x,y,Enemy.W,Enemy.H, e.x,e.y,Enemy.W,Enemy.H);
  }
  
  boolean isHit(Treasure t){
    return AABB(x,y,Enemy.W,Enemy.H, t.x, t.y, Enemy.W,Enemy.H);
  }
  
  void fire() {
    bulletMgr.addBullet(new Bullet(this.x, this.y + 5));
  }

  void changeHP(int value)
  {
    this.hp += value;
    if (this.hp <=0) {
      gameState = GAME_LOSE;
    }else if (this.hp >= 100) {
      this.hp = 100;
    }
  }
}
