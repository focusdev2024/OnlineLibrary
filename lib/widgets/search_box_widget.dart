import 'package:flutter/material.dart';

class SearchBoxWidget extends StatefulWidget {
  final TextEditingController searchController;
  const SearchBoxWidget({
    required this.searchController,
    super.key,
  });

  @override
  State<SearchBoxWidget> createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: widget.searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.searchController.dispose();
    super.dispose();
  }
}
