class Genre {
  final int id;
  final String name;
  final String imageUrl;
  final List<int> categoryIds;

  const Genre({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.categoryIds,
  });
}
