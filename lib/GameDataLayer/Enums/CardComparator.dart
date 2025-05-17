enum CardComparator {
  greater,
  lesser;

  static CardComparator fromInt(int value) {
    switch (value) {
      case 0:
        return CardComparator.greater;
      case 1:
        return CardComparator.greater;
      default:
        return CardComparator.greater;
    }
  }
}
