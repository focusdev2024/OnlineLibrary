import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:online_library/core/routers/app_routes.dart';
import 'package:online_library/core/routers/nav_ids.dart';
import 'package:online_library/tools/colors/onlinelibrary_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OwnBooksPageWidget extends StatefulWidget {
  const OwnBooksPageWidget({super.key});

  @override
  State<OwnBooksPageWidget> createState() => _OwnBooksPageWidgetState();
}

class _OwnBooksPageWidgetState extends State<OwnBooksPageWidget> {
  final urlImages = [
    'assets/images/carousel_images/9f0bbe386a.jpg',
    'assets/images/carousel_images/346824345923811.webp',
    'assets/images/carousel_images/b94740f80df563fa7443f481b3f7fab1.png',
    'assets/images/carousel_images/f79beacdef1ab0dc3d00e6c02542d89a.jpg',
    'assets/images/carousel_images/image-1.jpg',
  ];
  int carouselActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text('Could Be Interesting'),
          const SizedBox(height: 10),
          // Image Carousel start
          SizedBox(
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: urlImages.length,
                  options: CarouselOptions(
                      initialPage: 0,
                      height: 200.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          carouselActiveIndex = index;
                        });
                      }),
                  itemBuilder: (
                    context,
                    index,
                    realIndex,
                  ) {
                    final urlImage = urlImages[index];
                    return _buildImage(urlImage, index);
                  },
                ),
                const SizedBox(height: 10),
                _buildIndicator(),
              ],
            ),
          ),
          // Image Carousel end
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Get.toNamed(
                id: NavIds.ownBooksPage,
                Routes.favorites,
                arguments: {},
              );
            },
            child: const _FavoriteContainerWidget(
              containerName: 'Favorites',
              containerItemCount: '2',
              containerIcon: Icons.favorite_border,
            ),
          ),
          const SizedBox(height: 10),
          const _FavoriteContainerWidget(
            containerName: 'For Later',
            containerItemCount: '10',
            containerIcon: Icons.access_time,
          ),
          const SizedBox(height: 10),
          const _FavoriteContainerWidget(
            containerName: 'Downloaded',
            containerItemCount: '4',
            containerIcon: Icons.file_download_rounded,
          ),
          const SizedBox(height: 10),
          const _FavoriteContainerWidget(
            containerName: 'Have read',
            containerItemCount: '5',
            containerIcon: Icons.flag_circle,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildImage(String urlImage, int index) => Image.asset(
        urlImage,
        fit: BoxFit.cover,
      );

  Widget _buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: carouselActiveIndex,
        count: urlImages.length,
        effect: ExpandingDotsEffect(
          activeDotColor: AppColors.mainWhite,
          radius: 8,
          spacing: 10,
          dotHeight: 9,
          dotWidth: 9,
        ),
      );
}

class _FavoriteContainerWidget extends StatelessWidget {
  final String containerName;
  final String containerItemCount;
  final IconData containerIcon;
  const _FavoriteContainerWidget({
    required this.containerName,
    required this.containerItemCount,
    required this.containerIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 5),
            Icon(
              containerIcon,
            ),
            const SizedBox(width: 5),
            Expanded(child: Text(containerName)),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).canvasColor,
              ),
              child: Center(child: Text(containerItemCount)),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
