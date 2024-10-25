class MenuItemModel {
  const MenuItemModel({
    required String name,
    required double unitPrice,
    int defaultUnits = 1,
    List<String> categories = const <String>[],
    Map<String, bool> defaultOptions = const <String, bool>{},
  }) :
    _name = name,
    _unitPrice = unitPrice,
    _defaultUnits = defaultUnits,
    _categories = categories,
    _defaultOptions = defaultOptions;

  final String _name;
  final double _unitPrice;
  final int _defaultUnits;
  final List<String> _categories;
  final Map<String, bool> _defaultOptions;

  // Getters
  String get name => _name;
  double get unitPrice => _unitPrice;
  int get defaultUnits => _defaultUnits;
  List<String> get categories => List.unmodifiable(_categories);
  Map<String, bool> get defaultOptions => Map.unmodifiable(_defaultOptions);
}