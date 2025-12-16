import 'package:online_library/core/models/author_model.dart';

final List<AuthorModel> mockAuthors = [
  const AuthorModel(
    id: 1,
    name: 'F. Scott Fitzgerald',
    biography:
        'American novelist and short story writer, famous for The Great Gatsby.',
    photoUrl: 'assets/images/authors/fitzgerald.png',
    bookIds: [1, 3, 5],
  ),
  const AuthorModel(
    id: 2,
    name: 'J.K. Rowling',
    biography: 'British author, best known for the Harry Potter series.',
    photoUrl: 'assets/images/authors/rowling.png',
    bookIds: [2, 4, 6],
  ),
  const AuthorModel(
    id: 3,
    name: 'George Orwell',
    biography:
        'English novelist and essayist, famous for 1984 and Animal Farm.',
    photoUrl: 'assets/images/authors/orwell.png',
    bookIds: [1, 7],
  ),
  const AuthorModel(
    id: 4,
    name: 'Ernest Hemingway',
    biography: 'American novelist, known for The Old Man and the Sea.',
    photoUrl: 'assets/images/authors/hemingway.png',
    bookIds: [2, 8, 9],
  ),
  const AuthorModel(
    id: 5,
    name: 'Mark Twain',
    biography: 'American writer, famous for Adventures of Huckleberry Finn.',
    photoUrl: 'assets/images/authors/twain.png',
    bookIds: [3, 5, 10],
  ),
  const AuthorModel(
    id: 6,
    name: 'Jane Austen',
    biography: 'English novelist known for Pride and Prejudice.',
    photoUrl: 'assets/images/authors/austen.png',
    bookIds: [4, 6],
  ),
  const AuthorModel(
    id: 7,
    name: 'Leo Tolstoy',
    biography: 'Russian author of War and Peace and Anna Karenina.',
    photoUrl: 'assets/images/authors/tolstoy.png',
    bookIds: [1, 9],
  ),
  const AuthorModel(
    id: 8,
    name: 'Charles Dickens',
    biography: 'English writer famous for Oliver Twist and Great Expectations.',
    photoUrl: 'assets/images/authors/dickens.png',
    bookIds: [2, 7, 10],
  ),
  const AuthorModel(
    id: 9,
    name: 'Agatha Christie',
    biography: 'British writer known for her detective novels.',
    photoUrl: 'assets/images/authors/christie.png',
    bookIds: [3, 8, 9],
  ),
  const AuthorModel(
    id: 10,
    name: 'J.R.R. Tolkien',
    biography: 'English writer, author of The Lord of the Rings.',
    photoUrl: 'assets/images/authors/tolkien.png',
    bookIds: [4, 5, 6],
  ),
  const AuthorModel(
    id: 11,
    name: 'Haruki Murakami',
    biography:
        'Japanese author known for Norwegian Wood and Kafka on the Shore.',
    photoUrl: 'assets/images/authors/murakami.png',
    bookIds: [7, 8],
  ),
];
