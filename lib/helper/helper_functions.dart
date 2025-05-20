import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';

CardCompareResultType compareWith<T>(
  T other,
  bool Function(T) isGreater,
  bool Function(T) isLesser,
) {
  if (isGreater(other)) {
    return CardCompareResultType.greaterThan;
  } else if (isLesser(other)) {
    return CardCompareResultType.lessThan;
  } else {
    return CardCompareResultType.equalTo;
  }
}
