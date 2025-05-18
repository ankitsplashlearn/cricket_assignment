import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
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
  bool canBeUsed(Player player) {
    if(super.canBeUsed(player)){
      return true;
    }else{
      return false;
    }
  }
}
