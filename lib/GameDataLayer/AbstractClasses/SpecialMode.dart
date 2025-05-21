import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

abstract class SpecialMode {
  String get modeName;
  int get attributesCountAllowedToSelect;

  bool _isUsed = false;
  bool _isActiveNow = false;

  bool canBeUsed(Player player) {
    return !_isUsed;
  }

  bool get isActiveNow => _isActiveNow;

  void activate() {
    if (!_isUsed) {
      _isActiveNow = true;
    }
  }

  void deActivate() {
    _isActiveNow = false;
  }

  void setUsed() {
    _isUsed = true;
    _isActiveNow = false;
  }

  CardThrowResult cardThrowResult(Player currentPlayer, Player otherPlayer) {
    // Default to draw
    CardThrowResult result = CardThrowResult.draw;

    // Return draw if any attribute list is empty
    if (currentPlayer.selectedCardAttributes.isEmpty || otherPlayer.selectedCardAttributes.isEmpty) {
      return result;
    }

    // Compare each attribute of current player with each of other player's attributes
    for (var myAttr in currentPlayer.selectedCardAttributes) {
      for (var otherAttr in otherPlayer.selectedCardAttributes) {
        CardThrowResult compareResult = myAttr.compareAttributes(otherAttr);
        if (compareResult == CardThrowResult.win) {
          return CardThrowResult.win;
        } else if (compareResult == CardThrowResult.loss) {
          result = CardThrowResult.loss;
        }
      }
    }

    return result;
  }


  //returns true if the current lost and false current player wins
  //this flag will be used further to check if the current players'
  //health needs to be reduced or not
  bool applyModeEffect(Player player, Player otherPlayer,
      bool isHealthReducedForCurrentPlayer);
}
