import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/Mixins/GameCardIdCounter.dart';

abstract class GameCard with GameCardIdCounter {
  late int id;
  final String name;
  late final Map<String, CardAttribute> attributes;

  GameCard({required this.name, required List<CardAttribute> attributes}) {
    id = nextCount;
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
  String toString() {
    return "Game Card: id = $id, name = $name, attributes = ${attributes.toString()}";
  }
}
