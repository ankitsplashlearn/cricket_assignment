import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/BaseClasses/PlayerHealth.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/RunCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CricketGameCard.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';
import 'package:cricket_card/GameDataLayer/Mixins/PlayerCardAction.dart';
import 'package:cricket_card/GameDataLayer/Mixins/PlayerIdCounter.dart';

abstract class Player with PlayerCardAction, PlayerIdCounter {
  late int id;
  String name;
  PlayerHealth playerHealth;
  SpecialMode specialMode;
  late List<GameCard> _availableCards;
  GameCard? selectedCard;
  CardAttribute? selectedCardAttribute;

  List<GameCard> get availableCards => _availableCards;

  Player({
    required this.name,
    required this.playerHealth,
    required this.specialMode,
  }) {
    id = nextCount;
    _availableCards = [];
  }

  void setCards(List<GameCard> gameCards){
    _availableCards = gameCards;
  }

  void setSelectedCardAttribute(CardAttribute cardAttribute){
    selectedCardAttribute = cardAttribute;
  }

  void setSelectedCard(GameCard gameCard){
    selectedCard = gameCard;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Player &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  GameCard getSelectedCard() {
    return selectedCard ?? CricketGameCard(name: "NA", attributes: []);
  }

  @override
  CardAttribute getSelectedCardAttribute() {
    return selectedCardAttribute ??
        RunCardAttribute(
          name: "Runs",
          cardValue: 0,
          cardComparator: CardComparator.greater,
        );
  }
}
