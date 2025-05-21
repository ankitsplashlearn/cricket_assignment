import 'dart:math';

import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/BaseClasses/PlayerHealth.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/SpecialMode/DefaultMode.dart';
import 'package:cricket_card/GameDataLayer/Mixins/AiPlayerCardSelection.dart';

class AiPlayer extends Player with AiPlayerCardSelection {
  @override
  int id;

  @override
  String name;

  @override
  PlayerHealth playerHealth;

  @override
  List<SpecialMode> specialModes;

  final Random _random = Random();

  AiPlayer({
    required this.id,
    required this.name,
    required this.playerHealth,
    required this.specialModes,
  });

  @override
  void selectGameCard() {
    if (availableCards.isEmpty) return;
    setSelectedCard(availableCards[_random.nextInt(availableCards.length)]);
  }

  @override
  void selectGameCardAttributes() {
    if (selectedCard == null || selectedCard!.attributes.isEmpty) return;
    final attributes = selectedCard!.attributes.values.toList();
    SpecialMode activeSpecialMode = specialModes.firstWhere((mode) {
      return mode.isActiveNow;
    }, orElse: () {
      return DefaultMode();
    });
    int allowedAttributeSelectionCount =
        activeSpecialMode.attributesCountAllowedToSelect;
    // Shuffle and take unique attributes
    attributes.shuffle(_random);
    final selectedAttributes = attributes.take(allowedAttributeSelectionCount);

    for (var attr in selectedAttributes) {
      addToSelectedCardAttribute(attr);
    }
  }

  @override
  void selectSpecialModeIfAny() {
    if (specialModes.isEmpty) return;
    if (specialModes.first.canBeUsed(this) && _random.nextBool()) {
      specialModes.first.activate();
    }
  }

  Future<void> choseCardsAndAttributes(bool isCardAttributeSelecting) async {
    await Future.delayed(Duration(milliseconds: 1500));
    if (isCardAttributeSelecting) {
      selectSpecialModeIfAny();
    }
    selectGameCard();
    if (isCardAttributeSelecting) {
      selectGameCardAttributes();
    }
  }
}
