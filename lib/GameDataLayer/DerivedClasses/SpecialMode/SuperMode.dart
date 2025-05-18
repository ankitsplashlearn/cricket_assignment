import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';

class SuperMode extends SpecialMode {
  SuperMode()
    : super(modeName: "Super Mode", damageToReceive: 10, damageToApply: 25);

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
