import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';

class FreeHitMode extends SpecialMode {
  FreeHitMode()
    : super(
        modeName: "Free Hit Mode",
        damageToReceive: 12.5,
        damageToApply: 12,
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
