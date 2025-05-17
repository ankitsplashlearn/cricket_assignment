import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';

class FreeHitMode extends SpecialMode{
  FreeHitMode():super(damageToReceive: 12.5, damageToApply: 12);

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