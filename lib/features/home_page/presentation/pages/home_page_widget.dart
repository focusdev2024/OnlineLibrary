import 'package:flutter/material.dart';
import 'package:online_library/l10n/app_localizations.dart';
import 'package:online_library/tools/colors/onlinelibrary_colors.dart';
import 'package:online_library/features/home_page/widgets/all_books_widget.dart';
import 'package:online_library/widgets/search_box_widget.dart';
import 'package:online_library/features/home_page/widgets/section_widget.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  List<String> get items => [
        AppLocalizations.of(context)!.section,
        'All Books',
      ];

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: items.length,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          toolbarHeight: 150,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello, Lover Books',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'What do you want to read today?',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w100),
                ),
                const SizedBox(height: 10),
                SearchBoxWidget(searchController: _searchController),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: TabBar(
              dividerHeight: 0.0,
              isScrollable: true,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Theme.of(context).disabledColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: AppColors.mainWhite,
                  width: 2,
                ),
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 5),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
              tabs: items
                  .map((category) => Tab(
                        child: Container(
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Text(
                              category,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        body: TabBarView(
          children: items.map((category) {
            return _getCategoryContent(category);
          }).toList(),
        ),
      ),
    );
  }

  Widget _getCategoryContent(String category) {
    switch (category) {
      case 'Section':
        return const SectionsWidget();
      case 'All Books':
      default:
        return const AllBooksWidget();
    }
  }
}
