// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:online_library/features/home_page/presentation/pages/home_page_widget.dart';
import 'package:online_library/features/own_books/presentation/own_books_page.dart';
import 'package:online_library/features/profile_page/presentation/profile_page_widget.dart';

class LibraryMainPage extends StatefulWidget {
  const LibraryMainPage({super.key});

  @override
  State<LibraryMainPage> createState() => _LibraryMainPageState();
}

class _LibraryMainPageState extends State<LibraryMainPage> {
  int _selectedPage = 0;

  void onSelectedPage(int index) {
    if (_selectedPage == index) return;
    setState(() {
      _selectedPage = index;
    });
  }

  bool typing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedPage,
          children: const [
            MainPageWidget(),
            FavoritesPageWidget(),
            ProfilePageWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
              selectedIndex: _selectedPage,
              onTabChange: onSelectedPage,
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
