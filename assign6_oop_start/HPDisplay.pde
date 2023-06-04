class HPDisplay {
  PImage hpUI;

  HPDisplay () {
    this.hpUI = loadImage("data/img/hp.png");
  }
  void draw(int hp)
  {
    fill (255,0,0) ;
    rect(15,10, hp * 2 , 20 ) ;
    image(hpUI,10,10);
  }

}
