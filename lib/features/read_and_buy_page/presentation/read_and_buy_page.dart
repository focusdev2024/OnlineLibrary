// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/widgets/style_button_widget.dart';

class ReadAndBuyPage extends StatefulWidget {
  const ReadAndBuyPage({super.key});

  @override
  State<ReadAndBuyPage> createState() => _ReadAndBuyPageState();
}

class _ReadAndBuyPageState extends State<ReadAndBuyPage> {
  @override
  Widget build(BuildContext context) {
    final bookArgs = Get.arguments as Map<String, dynamic>?;
    final String bookTitle =
        bookArgs?['title'] as String? ?? 'Name of the book';
    final String bookAuthor =
        bookArgs?['author'] as String? ?? 'Author of the book';
    final String bookImageUrl = bookArgs?['imageUrl'] as String? ??
        'assets/images/tagamly_sozler001.png';

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            child: Container(
              height: 450,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bookImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).shadowColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
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
                      Icons.chevron_left_rounded,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                child: Image.asset(
                  bookImageUrl,
                  width: 230,
                  height: 340,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      bookAuthor,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    const Text('About the author'),
                    const Text(
                      'About the author text',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Ovedview',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Overview text',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 10),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: StyleButtonWidget(
              buttonName: 'Download',
              onTap: () {},
              buttonColor: Theme.of(context).primaryColor,
              buttonBorderColor: Theme.of(context).dividerColor,
            ),
          ),
        ]),
      ),
    );
  }
}
