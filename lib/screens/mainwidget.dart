import 'package:flutter/material.dart';
import 'package:testapp/screens/contact_us.dart';
import 'package:testapp/screens/home.dart';
import 'package:testapp/screens/payment.dart';

import 'package:testapp/widgets/navbar.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final pages = [HomePage(), ContactUs(), PaymentPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: currentIndexNotifier,
          builder: (context, int value, _) {
            return SafeArea(child: Center(child: pages[value]));
          },
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
