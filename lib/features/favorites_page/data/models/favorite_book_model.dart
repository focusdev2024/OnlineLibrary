import 'package:hive/hive.dart';

part 'favorite_book_model.g.dart'; // Нужно для генерации адаптера

@HiveType(typeId: 1) // Уникальный ID для этого класса
class FavoriteBookModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String author;

  @HiveField(3)
  final String imageUrl;

  FavoriteBookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
  });
}
