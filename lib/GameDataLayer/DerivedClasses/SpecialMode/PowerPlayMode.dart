import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

class PowerPlayMode extends SpecialMode {
  @override
  void applyModeEffect(
      Player player, Player otherPlayer, CardThrowResult gameRoundResult) {
    switch (gameRoundResult) {
      case CardThrowResult.win:
        otherPlayer.playerHealth.reduceHealth(reduceBy: 25);
      case CardThrowResult.loss:
        player.playerHealth.reduceHealth(reduceBy: 10);
      default:
        break;
    }
  }

  @override
  String get modeName => "Power Play Mode";
}
