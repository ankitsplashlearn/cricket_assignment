abstract class Health {
  double get maxHealth;

  late double _health;

  double get health => _health;

  Health() {
    _health = maxHealth;
  }

  void reduceHealth({required double reduceBy}) {
    _health -= reduceBy;
  }
}

class PlayerHealth extends Health {
  @override
  double get maxHealth => 100;
}
