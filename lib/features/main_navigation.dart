
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'favorites.dart';
import 'profile.dart';
import 'properties.dart';
import 'services.dart';

 class MainNavigation extends StatefulWidget {
   MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
 int currentIndex = 0;
 final List<Widget> pages = [
  HomePage(),
  PropertiesScreen(),
  ServicesScreen(),
  FavoritesScreen(),
  ProfileScreen(),

 ];

 @override
  
  Widget build(BuildContext context) {
    return  Scaffold(

      body: pages[currentIndex],
       bottomNavigationBar: Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xff7B2FF7), Color.fromRGBO(154, 47, 247, 1)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  child: BottomNavigationBar(
    
    elevation: 0,
    currentIndex: currentIndex,
    selectedItemColor:const Color.fromRGBO(154, 47, 247, 1),
    unselectedItemColor: const Color.fromARGB(179, 8, 8, 8),
    backgroundColor: const Color.fromRGBO(154, 47, 247, 1),

    onTap: (index) {
      setState(() {
        currentIndex = index;
      });
    },

    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.apartment),
        label: "Properties",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.design_services),
        label: "Services",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        label: "Favorites",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: "Profile",
      ),
    ],
  ),
),
    );
    
  }
}