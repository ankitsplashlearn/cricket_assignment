// TODO: abstract or not?
abstract class Health {
  int get maxHealth;

  late int _health;

  int get health => _health;

  Health() {
    _health = maxHealth;
  }

  void reduceHealth({required int reduceBy}) {
    _health -= reduceBy;
  }
}

class PlayerHealth extends Health {
  @override
  int get maxHealth => 100;
}
