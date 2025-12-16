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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(children: [
            Positioned(
              top: 10,
              child: Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.chevron_left_rounded,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
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
                const SizedBox(height: 20),
                StyleButtonWidget(
                  buttonName: 'Download',
                  onTap: () {},
                  buttonColor: Theme.of(context).primaryColor,
                  buttonBorderColor: Theme.of(context).dividerColor,
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
