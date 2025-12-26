import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/core/routers/app_routes.dart';
import 'package:online_library/data/mock/mock_data_books.dart';
import 'package:online_library/data/mock/mock_data_category.dart';
import 'package:online_library/widgets/book_widget.dart';

class AllBooksWidget extends StatelessWidget {
  const AllBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          ListView.builder(
            shrinkWrap: true,
            itemCount: mockCategories.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final categories = mockCategories[index];

              final filtredBooks = mockBooks
                  .where((book) => categories.bookIds.contains(book.id))
                  .toList();
              // Here error page if no categories found
              if (filtredBooks.isEmpty) return const SizedBox();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories.name,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: filtredBooks.length,
                      itemBuilder: (context, bookIndex) {
                        final book = filtredBooks[bookIndex];

                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.readAndBuy, arguments: {
                              'bookId': book.id,
                              'title': book.title,
                              'author': book.author,
                              'imageUrl': book.imageUrl,
                            });
                          },
                          child: BookWidget(
                              bookTitle: book.title,
                              bookAuthor: book.author,
                              imagePath: book.imageUrl),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
