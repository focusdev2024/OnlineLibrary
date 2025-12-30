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
      body: SafeArea(
        child: Obx(() {
          final favoriteBooks = mockBooks
              .where((book) => controller.favoriteBookIds.contains(book.id))
              .toList();

          if (favoriteBooks.isEmpty) {
            return const Center(
              child: Text('No favorites yet'),
            );
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;

              final crossAxisCount = (width / 160).floor().clamp(1, 6);

              final bool isTablet = width >= 600;
              final double aspectRatio = isTablet ? 0.58 : 0.7;

              return GridView.builder(
                itemCount: favoriteBooks.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: aspectRatio,
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
            },
          );
        }),
      ),
    );
  }
}
