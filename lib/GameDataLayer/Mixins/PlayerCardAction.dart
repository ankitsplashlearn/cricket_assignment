import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';

mixin PlayerCardAction{
  GameCard getSelectedCard();
  CardAttribute getSelectedCardAttribute();
}