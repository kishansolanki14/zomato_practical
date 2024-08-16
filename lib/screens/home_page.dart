import 'package:flutter/material.dart';
import 'package:zomato_clone/screens/components/delivery_screen.dart';
import 'package:zomato_clone/screens/components/dining_screen.dart';
import 'package:zomato_clone/screens/components/live_screen.dart';
import 'package:zomato_clone/screens/components/blinkit_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List screens = [
    DeliveryScreen(),
    const DiningScreen(),
    const LiveScreen(),
    const BlinkitScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.delivery_dining,
              color: Colors.grey,
            ),
            label: "Delivery",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lunch_dining_outlined,
              color: Colors.grey,
            ),
            label: "Dining",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.live_tv_outlined,
              color: Colors.grey,
            ),
            label: "Live",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.healing,
              color: Colors.grey,
            ),
            label: "blinkit",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.done,
          //     color: Colors.black,
          //   ),
          //   label: "Donate",
          // ),
        ],
      ),
    );
  }
}
