class AuthorModel {
  final int id;
  final String name;
  final String biography;
  final String photoUrl;
  final List<int> bookIds;

  const AuthorModel({
    required this.id,
    required this.name,
    required this.biography,
    required this.photoUrl,
    required this.bookIds,
  });
}
