import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';

mixin InputManagerMixin{
  void selectCardForCurrentPlayer(GameCard gameCard);
  void selectCardAttributeForCurrentPlayer(CardAttribute cardAttribute);
  void enableSpecialModeForCurrentPlayer();
  void disableSpecialModeForCurrentPlayer();
  void applyCurrentPlayerThrow();
}