import 'package:cricket_card/Classes/AbstractClasses/CardAttribute.dart';

class BaseCard {
  final String name;
  late final Map<String, CardAttribute> attributes;

  BaseCard({required this.name, required List<CardAttribute> attributes}) {
    // this.attributes = {
    //   for (var attribute in attributes) attribute.name: attribute,
    // };

    //refactored for code readability
    for (var attribute in attributes) {
      this.attributes.putIfAbsent(attribute.name, () => attribute);
    }
  }

  CardAttribute? getAttribute({required String attributeName}) {
    //please review if it is good
    if (attributes.containsKey(attributeName)) {
      return attributes[attributeName];
    }
    return null;
  }
}
