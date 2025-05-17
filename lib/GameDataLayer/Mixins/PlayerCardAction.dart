import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';

mixin PlayerCardAction{
  GameCard? selectedCard;
  CardAttribute? selectedCardAttribute;

  GameCard getSelectedCard();
  CardAttribute getSelectedCardAttribute();
}