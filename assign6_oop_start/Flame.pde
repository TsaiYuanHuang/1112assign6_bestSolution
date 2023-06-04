class Flame {
  float x;
  float y;
  int timer;
  int maxTimer;
  PImage[] flameImages;
  int currentFrame;

  Flame(float x, float y) {
    this.x = x;
    this.y = y;
    this.timer = 0;
    this.maxTimer = 60; 
    this.currentFrame = 0;

    // Load flame images
    flameImages = new PImage[5];
    for (int i = 0; i < flameImages.length; i++) {
      flameImages[i] = loadImage("img/flame" + (i + 1) + ".png");
    }
  }

  void update() {
    if (timer < maxTimer) {
      timer++;
      currentFrame = floor(map(timer, 0, maxTimer, 0, flameImages.length));
    }
  }

  void draw() {
    if (timer < maxTimer) {
      image(flameImages[currentFrame], x, y);
    }
  }
}
