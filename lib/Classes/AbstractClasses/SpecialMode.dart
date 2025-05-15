abstract class SpecialMode {
  int damageToReceive;
  int damageToApply;

  bool isUsed = false;
  bool isActiveNow = false;

  SpecialMode({required this.damageToReceive, required this.damageToApply}) {}

  //pass player here
  bool canBeUsed();

  void activate();
}
