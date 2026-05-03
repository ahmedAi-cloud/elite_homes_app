import 'package:flutter/material.dart';
import 'property_model.dart';

class FavoritesController extends ChangeNotifier {

  final List<PropertyModel> _favorites = [];

  List<PropertyModel> get favorites => _favorites;

  void toggleFavorite(PropertyModel item) {
    if (_favorites.contains(item)) {
      _favorites.remove(item);
    } else {
      _favorites.add(item);
    }

    notifyListeners();
  }

  bool isFavorite(PropertyModel item) {
    return _favorites.contains(item);
  }
}