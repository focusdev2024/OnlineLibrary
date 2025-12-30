// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:online_library/features/library_main_page/navs/home.dart';
import 'package:online_library/features/library_main_page/navs/ownbooks.dart';
import 'package:online_library/features/library_main_page/navs/profile.dart';
import 'package:online_library/features/library_main_page/controller/bottom_navbar_controller.dart';
import 'package:online_library/features/library_main_page/widgets/bottom_navbar.dart';

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
      body: Obx(
        () => SafeArea(
          child: IndexedStack(
            index: BottomNavBarController.to.selectedIndex.value,
            children: const [
              HomeNav(),
              OwnBooksNav(),
              ProfileNav(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
