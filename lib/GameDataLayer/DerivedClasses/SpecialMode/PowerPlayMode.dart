import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';

class PowerPlayMode extends SpecialMode {
  final double secondCardDamageToApply = 10;

  PowerPlayMode()
    : super(
        modeName: "Power Play Mode",
        damageToReceive: 10,
        damageToApply: 20,
      );

  @override
  void activate() {
    // TODO: implement activate
  }

  @override
  bool canBeUsed() {
    // TODO: implement canBeUsed
    throw UnimplementedError();
  }
}
