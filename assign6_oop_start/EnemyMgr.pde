// enemy class Manager
class EnemyMgr{
    ArrayList<Enemy> enemys = new ArrayList<Enemy>();
    PImage enemyImg, bossImg;

    int wave;

    EnemyMgr() {
      enemyImg = loadImage("data/img/enemy.png");
      bossImg = loadImage("data/img/enemy2.png");
      // enemy wave starts at 0
       wave = 0;
    }

    void addStraightEnemy()
    {
      float enemyX = 0;   
      float enemyY = random(height - Enemy.H);
      for (int i = 0; i < 5; ++i) {
        enemys.add( new Enemy(enemyX - i*(Enemy.W + 20)  , enemyY));
      }
    }
    void addSlopeEnemy()
    {
      float oblique_enemyX = 0 ;
      float oblique_enemyY = random(0 , height -  5* Enemy.H);
      for (int i = 0 ; i < 5 ; i++){
        enemys.add( new Enemy(oblique_enemyX - i*(Enemy.W + 20)  , oblique_enemyY + i*(Enemy.H-20) ) ); 
      }
    }
    void addDiamondEnemy()
    {
      float diamond_enemyX = 0;
      float diamond_enemyY = random( 2 * Enemy.H , height - 3 * Enemy.H);
      for (int i = 0 ; i < 8 ; i++){
        float offestX = Enemy.W;
        float offestY = Enemy.H;
        switch (i){
            case 0 : offestX *= 0 ; offestY*= 0 ; break ; //E
            case 1 : offestX *= -1 ; offestY*= 1 ; break ; //ES
            case 2 : offestX *= -2 ; offestY*= 2 ; break ; //S
            case 3 : offestX *= -3 ; offestY*= 1 ; break ; // SW
            case 4 : offestX *= -4 ; offestY*= 0 ; break ; // W
            case 5 : offestX *= -3 ; offestY*= -1 ; break ; // NW 
            case 6 : offestX *= -2 ; offestY *= -2 ; break ; // N
            case 7 : offestX *= -1 ; offestY*= -1 ; break ; // EN
            default : break ;
         }
         enemys.add(new Enemy(diamond_enemyX+offestX , diamond_enemyY+offestY)  ) ;
      }
    }
    void addBoss() {
  // Create five bosses in a column
  for (int i = 0; i < 5; ++i) {
    enemys.add(new Boss(0, 40 + i * 85));
  }
}


    void newWave()
    {
        switch (wave % 4){
          case 0:
            addStraightEnemy();
            break;
          case 1:
            addSlopeEnemy();
            break;
          case 2:
            addDiamondEnemy();
            break;
          case 3:
            addBoss();
            break;
        }
    }
    
    void draw() {
      for (int i = enemys.size()-1; i >=0 ; i--) {
        Enemy enemy = enemys.get(i);
        enemy.move();
        if (enemy instanceof Boss){
         image(bossImg,enemy.x,enemy.y);
        }else{
          image(enemyImg,enemy.x,enemy.y);
        }
        
        if (enemy.x > width) {
          enemys.remove(i);
        }else if (fighter.isHit(enemy)){
          fighter.changeHP(enemy.damage);
          // -- requirement A
          // Please uncomment the following code when you complete the FlameMgr class
          // ----------------
          flameMgr.addFlame(enemy.x, enemy.y);
          enemys.remove(i);          
        }
      }
      
      if (enemys.size() == 0) {
        newWave();
        wave++;
      }
   }
}
