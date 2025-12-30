import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:online_library/features/library_main_page/controller/bottom_navbar_controller.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.08),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              rippleColor: Theme.of(context).primaryColor,
              activeColor: Theme.of(context).primaryColor,
              tabShadow: [
                BoxShadow(
                  color: Theme.of(context).cardColor,
                  blurRadius: 2,
                )
              ],
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 400),
              gap: 6,
              tabBorderRadius: 25,
              iconSize: 24,
              padding: const EdgeInsets.all(15),
              selectedIndex: BottomNavBarController.to.selectedIndex.value,
              onTabChange: BottomNavBarController.to.changeIndex,
              tabs: [
                GButton(
                  icon: Icons.my_library_books_outlined,
                  text: "Sanow",
                  iconActiveColor: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).cardColor,
                ),
                GButton(
                  icon: Icons.menu_book_sharp,
                  text: "Meniň kitaplarym",
                  iconActiveColor: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).cardColor,
                ),
                GButton(
                  icon: Icons.person,
                  text: "Agza bol",
                  iconActiveColor: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).cardColor,
                ),
              ]),
        ),
      ),
    );
  }
}
