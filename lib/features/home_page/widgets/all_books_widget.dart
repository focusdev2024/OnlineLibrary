import 'package:flutter/material.dart';
import 'package:online_library/data/mock/mock_data_books.dart';
import 'package:online_library/data/mock/mock_data_category.dart';

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
              // Here might be error page if no categories found
              if (filtredBooks.isEmpty) return const SizedBox();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories.name,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: filtredBooks.length,
                      itemBuilder: (context, bookIndex) {
                        final book = filtredBooks[bookIndex];

                        return GestureDetector(
                          onTap: () {
                            // Navigate to book details page
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.only(right: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    book.imageUrl,
                                    height: 200,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  book.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
