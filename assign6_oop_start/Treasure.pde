class Treasure{
  int x = 0;
  int y = 0;
  PImage treasureImg;
  
  // constructor
  Treasure () {
    this.treasureImg = loadImage("data/img/treasure.png");
    this.randomPosition();
  }

  void randomPosition() {
    this.x = int(random(0, width - this.treasureImg.width));
    this.y = int(random(0, height - this.treasureImg.height));
  }

  void draw() {
    image(this.treasureImg, this.x, this.y);

    if (fighter.isHit(this)){
      fighter.changeHP(+10);
      this.randomPosition();
    }
  }
}
