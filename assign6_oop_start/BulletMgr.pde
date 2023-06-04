class BulletMgr {
  ArrayList<Bullet> bullets = new ArrayList<Bullet>(0);
  PImage bulletImg;

  BulletMgr() {
    bulletImg = loadImage("img/shoot.png");
  }

  void addBullet(Bullet bullet) {
    if (bullets.size() < 5) {
      bullets.add(bullet);
    }
  }

  void draw() {
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet bullet = bullets.get(i);

      bullet.move();
      image(bulletImg, bullet.x, bullet.y);

      if (bullet.x < 0 - Bullet.W) {
        bullets.remove(i);
      }

      for (int j = enemyMgr.enemys.size() - 1; j >= 0; j--) {
        Enemy enemy = enemyMgr.enemys.get(j);
        if (bullet.isHit(enemy)) {
          enemy.hp -= 1;
          bullets.remove(i);
          if (enemy.hp <= 0) {
            flameMgr.addFlame(enemy.x, enemy.y);
            enemyMgr.enemys.remove(j);
          }
          break;
        }
      }
      
    }
  }
}
