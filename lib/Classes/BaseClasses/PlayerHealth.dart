class PlayerHealth {
  final int _maxHealth = 100;
  final int _minHealth = 0;

  late int health;

  PlayerHealth() {
    health = _maxHealth;
  }

  void reduceHealth({required int reduceBy}) {
    health -= reduceBy;
    if (health < _minHealth) {
      health = _minHealth;
    }
  }
}
