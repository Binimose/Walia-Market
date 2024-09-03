import 'package:flutter/material.dart';
import 'package:waliamarket/utils/constants.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController _pageController = PageController(); // Changed indentation for consistency
  int currentPage = 0; // Added space for consistency

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose(); // Moved _pageController.dispose() before super.dispose()
    super.dispose();
  }

  void changePage(int page) { // Added return type 'void' for consistency
    _pageController.jumpToPage(page);
    setState(() {
      currentPage = page; // Fixed indentation
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: PageView(
          controller: _pageController, // Added controller to PageView
          children:screens
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(border:Border(top: BorderSide(color: Colors.grey,width:2))),
          child: TabBar(
            indicator:BoxDecoration(border: Border(
              top: BorderSide(color:Colors.red,width:4)
            )) ,
            indicatorSize:TabBarIndicatorSize.label,
            onTap: changePage,
            tabs: [
              Tab(icon: Icon(Icons.home_outlined,color:currentPage == 0 ? Colors.red:Colors.black)),
              Tab(icon: Icon(Icons.account_circle_rounded,color:currentPage == 1 ? Colors.red:Colors.black)),
               Tab(icon: Icon(Icons.shopping_cart_outlined,color:currentPage == 2 ? Colors.red:Colors.black)),
             Tab(icon: Icon(Icons.menu_outlined,color:currentPage == 3 ? Colors.red:Colors.black))
            ],
          ),
        ),
      ),
    );
  }
}