import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/BaseClasses/GameManager.dart';
import 'package:cricket_card/ViewModelLayer/Mixins/InputManagerMixin.dart';

class InputManager with InputManagerMixin{
  late GameManager _gameManager;

  InputManager({required GameManager gameManager}){
    _gameManager = gameManager;
  }

  @override
  void applyCurrentPlayerThrow() {
    _gameManager.applyCurrentPlayerThrow();
  }

  @override
  void enableSpecialModeForCurrentPlayer() {
    _gameManager.enableSpecialModeForCurrentPlayer();
  }

  @override
  void selectCardForCurrentPlayer(GameCard gameCard) {
    _gameManager.selectCardForCurrentPlayer(gameCard);
  }

  @override
  void disableSpecialModeForCurrentPlayer() {
    _gameManager.disableSpecialModeForCurrentPlayer();
  }

  @override
  void selectCardAttributeForCurrentPlayer(CardAttribute cardAttribute) {
    _gameManager.selectCardAttributeForCurrentPlayer(cardAttribute);
  }

  @override
  Future<void> shuffleCards() async {
    _gameManager.shuffleCards();
  }

  @override
  Player getCurrentThrowingPlayer() {
    return _gameManager.getCurrentThrowingPlayer();
  }

  @override
  Player getFirstThrowPlayerForCurrentRound() {
    return _gameManager.getFirstThrowPlayerForCurrentRound();
  }

  @override
  void moveToNextApplicableStep() {
    if(_gameManager.isPlayerRemainingToThrowInCurrentRound()){
      _gameManager.moveToNextPlayerCardSelection();
    }else{
      _gameManager.evaluateRemainingPlayers();
      _gameManager.applyCurrentPlayerThrow();
    }
  }
}