import 'package:flutter/material.dart';

import '../view/home_view.dart';
import '../view/search_view.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 80,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
                iconMargin: EdgeInsetsDirectional.all(2),
              ),
              Tab(
                icon: Icon(Icons.search),
                iconMargin: EdgeInsetsDirectional.all(2),
                text: "Search",
              ),
            ],
            unselectedLabelColor: Colors.white30,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
          ),
        ),
        body: const TabBarView(
          children: [
            HomeView(),
            SearchView(),
          ],
        ),
      ),
    );
  }
}
