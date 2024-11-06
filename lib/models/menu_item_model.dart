class MenuItemModel {
  final String _name;

  final String _imagePath;
  final double _unitPrice;
  final String _description;
  final int _defaultUnits;
  final List<String> _categories;
  final Map<String, bool> _defaultOptions;
  const MenuItemModel({
    required String name,
    required String imagePath,
    required double unitPrice,
    required String description,
    int defaultUnits = 1,
    List<String> categories = const <String>[],
    Map<String, bool> defaultOptions = const <String, bool>{},
  })  : _name = name,
        _imagePath = imagePath,
        _unitPrice = unitPrice,
        _description = description,
        _defaultUnits = defaultUnits,
        _categories = categories,
        _defaultOptions = defaultOptions;

  List<String> get categories => List.unmodifiable(_categories);
  Map<String, bool> get defaultOptions => Map.unmodifiable(_defaultOptions);
  int get defaultUnits => _defaultUnits;
  String get description => _description;
  String get imagePath => _imagePath;
  // Getters
  String get name => _name;
  double get unitPrice => _unitPrice;
}
