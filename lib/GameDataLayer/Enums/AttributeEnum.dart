enum AttributeEnum {
  runs,
  matches,
  centuries,
  halfCenturies,
  catches,
  wickets;

  static AttributeEnum fromString(String type) {
    switch (type) {
      case "Runs":
        return AttributeEnum.runs;
      case "Matches":
        return AttributeEnum.matches;
      case "Centuries":
        return AttributeEnum.centuries;
      case "Half Centuries":
        return AttributeEnum.halfCenturies;
      case "Catches":
        return AttributeEnum.catches;
      case "Wickets":
        return AttributeEnum.wickets;
      default:
        throw Exception("Unknown attribute type: $type");
    }
  }

  String stringValue() {
    switch (this) {
      case AttributeEnum.runs:
        return "Runs";
      case AttributeEnum.matches:
        return "Matches";
      case AttributeEnum.centuries:
        return "Centuries";
      case AttributeEnum.halfCenturies:
        return "Half Centuries";
      case AttributeEnum.catches:
        return "Catches";
      case AttributeEnum.wickets:
        return "Wickets";
      }
  }

}
