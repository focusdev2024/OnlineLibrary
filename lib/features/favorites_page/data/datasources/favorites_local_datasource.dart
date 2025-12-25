import 'package:hive/hive.dart';
import 'package:online_library/features/favorites_page/data/models/favorite_book_model.dart';

class FavoritesLocalDataSource {
  final Box<FavoriteBookModel> _box =
      Hive.box<FavoriteBookModel>('favorites_box');

  // Добавить или удалить из избранного (Toggle)
  Future<void> toggleFavorite(FavoriteBookModel book) async {
    if (_box.containsKey(book.id)) {
      await _box.delete(book.id); // Если уже есть — удаляем
    } else {
      await _box.put(book.id, book); // Если нет — добавляем
    }
  }

  // Проверить, в избранном ли книга (для цвета сердечка)
  bool isFavorite(String id) {
    return _box.containsKey(id);
  }

  // Получить все избранные книги
  List<FavoriteBookModel> getAllFavorites() {
    return _box.values.toList();
  }
}
