import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/BaseClasses/GameManager.dart';
import 'package:cricket_card/ViewModelLayer/Mixins/InputManagerMixin.dart';

class InputManager with InputManagerMixin{
  GameManager gameManager;

  InputManager({required this.gameManager});

  @override
  void applyCurrentPlayerThrow() {
    gameManager.applyCurrentPlayerThrow();
  }

  @override
  void enableSpecialModeForCurrentPlayer() {
    gameManager.enableSpecialModeForCurrentPlayer();
  }

  @override
  void selectCardForCurrentPlayer(GameCard gameCard) {
    gameManager.selectCardForCurrentPlayer(gameCard);
  }

  @override
  void disableSpecialModeForCurrentPlayer() {
    gameManager.disableSpecialModeForCurrentPlayer();
  }

  @override
  void selectCardAttributeForCurrentPlayer(CardAttribute cardAttribute) {
    gameManager.selectCardAttributeForCurrentPlayer(cardAttribute);
  }
}