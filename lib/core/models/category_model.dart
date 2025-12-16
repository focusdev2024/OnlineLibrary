class Category {
  final int id;
  final String name;
  final String imageUrl;
  final int genreId;
  final List<int> bookIds;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.genreId,
    required this.bookIds,
  });
}
