class BookDescriptionModel {
  final int bookId;
  final String description;
  final String downloadUrl;
  final List<String> bookList;
  final DateTime printedDate;
  final int ageLimit;

  const BookDescriptionModel({
    required this.bookId,
    required this.description,
    required this.downloadUrl,
    required this.bookList,
    required this.printedDate,
    required this.ageLimit,
  });
}
