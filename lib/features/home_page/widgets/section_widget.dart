import 'package:flutter/material.dart';
import 'package:online_library/data/mock/mock_data_category.dart';
import 'package:online_library/data/mock/mock_data_genre.dart';
import 'package:online_library/features/read_and_buy_page/presentation/read_and_buy_page.dart';
import 'package:online_library/widgets/category_widget.dart';

class SectionsWidget extends StatelessWidget {
  const SectionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mockGenres.length,
            itemBuilder: (context, index) {
              final genre = mockGenres[index];

              final filteredCategories = mockCategories
                  .where((cat) => genre.categoryIds.contains(cat.id))
                  .toList();
              // Here might be error page if no categories found
              if (filteredCategories.isEmpty) return const SizedBox();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    genre.name,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: filteredCategories.length,
                      itemBuilder: (context, bookIndex) {
                        final category = filteredCategories[bookIndex];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ReadAndBuyPage(),
                              ),
                            );
                          },
                          child: CategoryWidget(
                            categoryNames: category.name,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
