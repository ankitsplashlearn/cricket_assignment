import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/BaseClasses/PlayerHealth.dart';

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

  CardAttribute? get selectedCardAttribute => _selectedCardAttribute;
  CardAttribute? _selectedCardAttribute;

  List<CardAttribute> get selectedCardAttributes => _selectedCardAttributes;
  final List<CardAttribute> _selectedCardAttributes = [];

  void removePlayedCards(){
    _availableCards.removeWhere((card){return _selectedCard == card;});
  }

  void setCards(List<GameCard> gameCards) {
    _availableCards = gameCards;
  }

  void setSelectedCardAttribute(CardAttribute cardAttribute) {
    _selectedCardAttribute = cardAttribute;
    _selectedCardAttributes.add(cardAttribute);
  }

  void setSelectedCard(GameCard gameCard) {
    _selectedCard = gameCard;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
