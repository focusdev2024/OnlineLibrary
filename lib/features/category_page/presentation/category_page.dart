import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/core/routers/app_routes.dart';
import 'package:online_library/data/mock/mock_data_books.dart';
import 'package:online_library/data/mock/mock_data_category.dart';
import 'package:online_library/widgets/book_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    if (args == null || args['categoryId'] == null) {
      return const Scaffold(body: Center(child: Text('Category not found')));
    }
    final int categoryId = args['categoryId'];
    final category = mockCategories.firstWhereOrNull((c) => c.id == categoryId);
    if (category == null) return _buildErrorState('Category not found');

    final booksInCategory = mockBooks
        .where((book) => book.categoryIds.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                iconSize: 24,
                padding: EdgeInsets.zero,
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(category.name),
            ),
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                iconSize: 24,
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.sort,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: booksInCategory.isEmpty
            ? const Center(child: Text('No books in this category'))
            : _buildGrid(booksInCategory),
      ),
    );
  }

  Widget _buildGrid(List books) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final crossAxisCount = (constraints.maxWidth / 160).floor().clamp(1, 6);
        final bool isTablet = width >= 600;
        final aspectRatio = isTablet ? 0.58 : 0.7;

        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: aspectRatio,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];

            return GestureDetector(
              onTap: () {
                Get.toNamed(
                  Routes.readAndBuy,
                  arguments: {
                    'bookId': book.id,
                    'title': book.title,
                    'author': book.author,
                    'imageUrl': book.imageUrl,
                  },
                );
              },
              child: BookWidget(
                bookId: book.id,
                bookTitle: book.title,
                bookAuthor: book.author,
                imagePath: book.imageUrl,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildErrorState(String message) {
    return Scaffold(body: Center(child: Text(message)));
  }
}
