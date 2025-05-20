import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';

abstract class GameCard {
  final int id;
  final String name;
  late final Map<String, CardAttribute> attributes;

  GameCard({required this.id, required this.name, required List<CardAttribute> attributes}) {
    this.attributes = {};
    for (var attribute in attributes) {
      this.attributes.putIfAbsent(attribute.name, () => attribute);
    }
  }

  CardAttribute? getAttribute({required String attributeName}) {
    if (attributes.containsKey(attributeName)) {
      return attributes[attributeName];
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GameCard && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return "Game Card: id = $id, name = $name, attributes = ${attributes.toString()}";
  }
}
