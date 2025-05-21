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

    // Return draw if lists are empty or card is not selected
    if (currentPlayer.selectedCardAttributes.isEmpty || otherPlayer.selectedCard == null) {
      return result;
    }

    final otherCardAttributes = otherPlayer.selectedCard!.attributes;

    for (var myAttr in currentPlayer.selectedCardAttributes) {
      // Match attribute by name in the other player's selected card
      final opponentAttr = otherCardAttributes[myAttr.name];

      if (opponentAttr != null) {
        final compareResult = myAttr.compareAttributes(opponentAttr);

        if (compareResult == CardThrowResult.win) {
          return CardThrowResult.win; // immediate win
        } else if (compareResult == CardThrowResult.loss) {
          result = CardThrowResult.loss; // possible loss, continue checking
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
