class PlayerHealth {
  final int _maxHealth = 100;
  final int _minHealth = 0;

  late int _health;

  int get health => _health;

  PlayerHealth() {
    _health = _maxHealth;
  }

  void reduceHealth({required int reduceBy}) {
    _health -= reduceBy;
    if (_health < _minHealth) {
      _health = _minHealth;
    }
  }
}
