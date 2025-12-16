// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class BookWidget extends StatefulWidget {
  const BookWidget({
    super.key,
  });

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                    'assets/images/tagamly_sozler001.png',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 100),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Theme.of(context).highlightColor,
                          key: ValueKey<bool>(isFavorite),
                          size: 30.0,
                        ),
                      ),
                      onPressed: toggleFavorite,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Book Name'),
                  Text('Author Name'),
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
