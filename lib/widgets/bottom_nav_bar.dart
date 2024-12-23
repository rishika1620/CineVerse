import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/HomeScreen.dart';
import 'package:netflix_clone/screens/New&HotScreen.dart';
import 'package:netflix_clone/screens/ProfileScreen.dart';
import 'package:netflix_clone/screens/SearchScreen.dart';
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 70,
        child: TabBar(tabs: [
          Tab(
              icon: Icon(Icons.home,),
              text: 'Home',
          ),
          Tab(
            icon: Icon(Icons.search,
            ),
            text: 'Search',
          ),
          Tab(
            icon: Icon(Icons.photo_library_outlined,),
            text: "New & Hot",
          ),

          Tab(
            icon: Icon(Icons.person,),
            text: 'My Netflix',
          ),
        ],
            indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
        ),
      ),
      
      body: TabBarView(children: [
        Home_Screen(),
        Search_Screen(),
        New_Hot_Screen(),
        Profile_Screen(),
      ]),
    ));
  }
}
