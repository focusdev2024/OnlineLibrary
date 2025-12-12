import 'package:flutter/material.dart';
import 'package:online_library/data/mock/mock_data_category.dart';
import 'package:online_library/data/mock/mock_data_genre.dart';
import 'package:online_library/features/read_and_buy_page/presentation/read_and_buy_page.dart';
import 'package:online_library/widgets/category_widget.dart';

class SectionsWidget extends StatelessWidget {
  SectionsWidget({super.key});

  final genres = mockGenres;
  final categories = mockCategories;

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
            physics: const NeverScrollableScrollPhysics(),
            itemCount: genres.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${genres[index].name} '),
                  Text('${genres[index].categoryIds} '),
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: genres.length,
                      itemBuilder: (context, bookIndex) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReadAndBuyPage(),
                              ),
                            );
                          },
                          child: const CategoryWidget(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
