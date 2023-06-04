 class Enemy{
   float x;
   float y;
   float xSpeed;
   float ySpeed;
   int hp;
   int damage;
   
   //static constants: access by Enemy.W, Enemy.H
   static final float W = 61; 
   static final float H = 61;
   
   Enemy(float x, float y) {
      this.x = x;
      this.y = y;
      this.hp = 1;
      this.damage=-10;
      xSpeed = 5;
      ySpeed = 0;
      
   }
   
   void move() {
     x += xSpeed;
   }
  
}
