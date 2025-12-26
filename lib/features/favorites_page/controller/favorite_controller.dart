import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final RxSet<int> favoriteBookIds = <int>{}.obs;

  bool isFavorite(int bookId) {
    return favoriteBookIds.contains(bookId);
  }

  void toggleFavorite(int bookId) {
    if (favoriteBookIds.contains(bookId)) {
      favoriteBookIds.remove(bookId);
    } else {
      favoriteBookIds.add(bookId);
    }
  }
}
