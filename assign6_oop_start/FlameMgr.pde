class FlameMgr {
  ArrayList<Flame> flames;

  FlameMgr() {
    flames = new ArrayList<Flame>();
  }

  void addFlame(float x, float y) {
    flames.add(new Flame(x, y));
  }

  void draw() {
    for (int i = flames.size() - 1; i >= 0; i--) {
      Flame flame = flames.get(i);
      flame.update();
      flame.draw();

      if (flame.timer >= flame.maxTimer) {
        flames.remove(i);
      }
    }
  }
}
