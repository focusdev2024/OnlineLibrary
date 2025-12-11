class Book {
  final int id;
  final String title;
  final String author;
  final String imageUrl; // Для обложки
  final bool isFavorite;
  final double price; // $1
  final List<int> categoryIds;
  final List<int> genreIDs;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    this.isFavorite = false,
    this.price = 1.0,
    required this.categoryIds,
    required this.genreIDs,
  });
}
