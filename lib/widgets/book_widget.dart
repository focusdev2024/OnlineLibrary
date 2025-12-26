import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/features/favorites_page/controller/favorite_controller.dart';

class BookWidget extends StatelessWidget {
  final int bookId;
  final String bookTitle;
  final String bookAuthor;
  final String? imagePath;

  BookWidget({
    super.key,
    required this.bookId,
    required this.bookTitle,
    required this.bookAuthor,
    this.imagePath,
  });

  final FavoriteController favoriteController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.09),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.circular(24),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    imagePath ?? 'assets/images/tagamly_sozler001.png',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Obx(() {
                    final isFav = favoriteController.isFavorite(bookId);

                    return IconButton(
                      onPressed: () =>
                          favoriteController.toggleFavorite(bookId),
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : Colors.grey,
                        size: 30,
                      ),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bookTitle, maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(bookAuthor,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
