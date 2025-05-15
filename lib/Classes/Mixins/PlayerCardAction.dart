import 'package:cricket_card/Classes/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/Classes/BaseClasses/BaseCard.dart';

mixin PlayerCardAction{
  BaseCard? selectedCard;
  CardAttribute? selectedCardAttribute;

  BaseCard selectCard();
  CardAttribute selectCardAttribute();
}