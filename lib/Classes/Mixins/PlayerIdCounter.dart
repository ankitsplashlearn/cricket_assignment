mixin PlayerIdCounter{
  static int _idCounter = 0;

  int get nextCount => _idCounter++;
}