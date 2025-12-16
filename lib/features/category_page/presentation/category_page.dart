import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/core/routers/app_routes.dart';
import 'package:online_library/data/mock/mock_data_books.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;

    final String categoryName = args?['name'] as String? ?? 'Category';
    final int categoryId = args?['id'] as int? ?? -1;
    final List booksInCategory = mockBooks
        .where((book) => book.categoryIds.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: booksInCategory.isEmpty
              ? const Center(child: Text('No books in this category'))
              : ListView.builder(
                  itemCount: booksInCategory.length,
                  itemBuilder: (context, index) {
                    final book = booksInCategory[index];
                    return ListTile(
                      leading: Image.asset(
                        book.imageUrl,
                        width: 50,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                      title: Text(book.title),
                      subtitle: Text(book.author),
                      trailing: Text('${book.price} TMT'),
                      onTap: () {
                        Get.toNamed(Routes.readAndBuy, arguments: {
                          'bookId': book.id,
                          'title': book.title,
                          'author': book.author,
                          'imageUrl': book.imageUrl,
                        });
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}
