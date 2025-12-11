import 'package:online_library/core/models/genre_model.dart';

final mockGenres = [
  const Genre(
    id: 1,
    name: 'Fiction',
    imageUrl: 'assets/images/genre_images/genre_image.png',
    categoryIds: [1, 2, 3],
  ),
  const Genre(
    id: 2,
    name: 'Mystery',
    imageUrl: 'assets/images/genre_images/genre_image.png',
    categoryIds: [2, 4],
  ),
  const Genre(
    id: 3,
    name: 'Science Fiction',
    imageUrl: 'assets/images/genre_images/genre_image.png',
    categoryIds: [1, 3, 5],
  ),
  const Genre(
    id: 4,
    name: 'Romance',
    imageUrl: 'assets/images/genre_images/genre_image.png',
    categoryIds: [2, 6],
  ),
  const Genre(
    id: 5,
    name: 'Thriller',
    imageUrl: 'assets/images/genre_images/genre_image.png',
    categoryIds: [2, 4, 7],
  ),
  const Genre(
    id: 6,
    name: 'Fantasy',
    imageUrl: 'assets/images/genre_images/genre_image.png',
    categoryIds: [1, 3, 8],
  ),
  const Genre(
    id: 7,
    name: 'Horror',
    imageUrl: 'assets/images/genre_images/genre_image.png',
    categoryIds: [4, 7, 9],
  ),
  const Genre(
    id: 8,
    name: 'Historical',
    imageUrl: 'assets/images/genre_images/genre_image.png',
    categoryIds: [1, 10],
  ),
  const Genre(
    id: 9,
    name: 'Biography',
    imageUrl: 'assets/images/genre_images/genre_image.png',
    categoryIds: [10, 11],
  ),
  const Genre(
    id: 10,
    name: 'Self-Help',
    imageUrl: 'assets/images/genre_images/genre_image.png',
    categoryIds: [11, 12],
  ),
];
