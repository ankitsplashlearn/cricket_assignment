import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

class FreeHitMode extends SpecialMode {
  @override
  String get modeName => "Free Hit Mode";

  @override
  void applyModeEffect(
      Player player, Player otherPlayer, CardThrowResult gameRoundResult) {
    switch (gameRoundResult) {
      case CardThrowResult.win:
        otherPlayer.playerHealth.reduceHealth(reduceBy: 12.5);
      case CardThrowResult.loss:
        player.playerHealth.reduceHealth(reduceBy: 15);
      default:
        break;
    }
  }
}
