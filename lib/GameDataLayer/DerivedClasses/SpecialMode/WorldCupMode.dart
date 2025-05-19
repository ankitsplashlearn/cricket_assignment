import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';

class WorldCupMode extends SpecialMode {
  WorldCupMode()
      : super(
            modeName: "World Cup Mode", damageToReceive: 10, damageToApply: 20);

  @override
  bool canBeUsed(Player player) {
    if (super.canBeUsed(player)) {
      return player.availableCards.length == 1;
    } else {
      return false;
    }
  }
}
