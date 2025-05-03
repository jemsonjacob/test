import 'package:flutter/material.dart';

ValueNotifier<int> currentIndexNotifier = ValueNotifier(0);

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentIndexNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: newIndex,
          onTap: (index) {
            currentIndexNotifier.value = index;
          },
          elevation: 0,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
              label: 'Contact Us',
              icon: Icon(Icons.contact_emergency),
            ),
            BottomNavigationBarItem(label: 'Pay', icon: Icon(Icons.paypal)),
          ],
        );
      },
    );
  }
}
