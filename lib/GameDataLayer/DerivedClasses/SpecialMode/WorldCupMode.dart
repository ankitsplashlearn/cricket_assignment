import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';

class WorldCupMode extends SpecialMode{
  WorldCupMode():super(damageToReceive: 10, damageToApply: 20);

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