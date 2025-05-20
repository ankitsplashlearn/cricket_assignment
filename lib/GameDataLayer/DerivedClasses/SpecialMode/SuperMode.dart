import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

class SuperMode extends SpecialMode {
  @override
  int get cardAttributedAvailableToSelect => 2;

  @override
  void applyModeEffect(
      Player player, Player otherPlayer, CardThrowResult gameRoundResult) {
    switch (gameRoundResult) {
      case CardThrowResult.win:
        otherPlayer.playerHealth.reduceHealth(reduceBy: 10);
      case CardThrowResult.loss:
        player.playerHealth.reduceHealth(reduceBy: 10);
      default:
        break;
    }
  }

  @override
  String get modeName => "Super Mode";
}
