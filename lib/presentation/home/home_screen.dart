import 'package:alchemist_arsenal/config/routes/routes_app.dart';
import 'package:alchemist_arsenal/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenProvider = context.watch<RoutesApp>();
    return Scaffold(
      appBar: AppBar(title: Text(screenProvider.screenTitle)),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
        child: RoutesApp.screens[screenProvider.screenIndex],
      ),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
