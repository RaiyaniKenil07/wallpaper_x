import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List _photos = [];
  List get photos => _photos;

  void toggleFavorite(photos) {
    final isExist = _photos.contains(photos);
    if (isExist) {
      _photos.remove(photos);
    } else {
      _photos.add(photos);
    }
  }

  bool isExist(photos) {
    final isExist = _photos.contains(photos);
    return isExist;
  }

  // void clearFavorite() {
  //   _photos = [];
  //   notifyListeners();
  // }

  static FavoriteProvider of(
      BuildContext context, {
        bool listen = true,
      }) {
    return Provider.of(
      context,
      listen: listen,
    );
  }
}
