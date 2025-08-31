import 'package:alchemist_arsenal/config/routes/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var screenProvider = context.watch<RoutesApp>();
    return BottomNavigationBar(
      currentIndex: screenProvider.screenIndex,
      items: RoutesApp.items,
      onTap: (value) => screenProvider.setScreenIndex(value),
    );
  }
}
