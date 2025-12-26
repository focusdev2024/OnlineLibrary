import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/data/mock/mock_data_books.dart';
import 'package:online_library/features/favorites_page/controller/favorite_controller.dart';
import 'package:online_library/widgets/book_widget.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  final FavoriteController controller = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Obx(() {
        final favoriteBooks = mockBooks
            .where((book) => controller.favoriteBookIds.contains(book.id))
            .toList();

        if (favoriteBooks.isEmpty) {
          return const Center(
            child: Text('No favorites yet'),
          );
        }

        return GridView.builder(
          itemCount: favoriteBooks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            final book = favoriteBooks[index];
            return BookWidget(
              bookId: book.id,
              bookTitle: book.title,
              bookAuthor: book.author,
              imagePath: book.imageUrl,
            );
          },
        );
      }),
    );
  }
}
