import 'dart:math';

import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/BaseClasses/PlayerHealth.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/SpecialMode/DefaultMode.dart';

abstract class Player {
  int get id;
  String get name;
  Health get playerHealth;
  List<SpecialMode> get specialModes;

  List<SpecialMode> getActiveModes() {
    return specialModes.where((mode) => mode.canBeUsed(this)).toList();
  }

  List<GameCard> get availableCards => _availableCards;
  List<GameCard> _availableCards = [];

  GameCard? get selectedCard => _selectedCard;
  GameCard? _selectedCard;

  List<CardAttribute> get selectedCardAttributes => _selectedCardAttributes;
  final List<CardAttribute> _selectedCardAttributes = [];

  void removePlayedCards(){
    //removing played cards and clearing selected card attributes
    _availableCards.removeWhere((card){return _selectedCard == card;});
    _selectedCardAttributes.clear();
  }

  void setCards(List<GameCard> gameCards) {
    _availableCards = gameCards;
  }

  void addToSelectedCardAttribute(CardAttribute cardAttribute) {
    _selectedCardAttributes.add(cardAttribute);
    print(
        "$name selected attribute ${cardAttribute.toString()}");
  }

  void setSelectedCard(GameCard gameCard) {
    _selectedCard = gameCard;
    print("$name selected card ${gameCard.toString()}");
  }

  void removeSpecialModesUsed(){
    for(var mode in specialModes){
      if(mode.isActiveNow){
        mode.setUsed();
      }
    }
  }

  int getCountCardAttributesAllowedToSelect(){
    int result = DefaultMode().attributesCountAllowedToSelect;

    for(var mode in specialModes){
      if(mode.isActiveNow){
        result = max(result, mode.attributesCountAllowedToSelect);
      }
    }

    return max(result - _selectedCardAttributes.length, 0);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
