import 'package:flutter/material.dart';
import 'fundamentalscreen.dart';
import 'cumulativescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activities App',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.accessible)),
                  Tab(icon: Icon(Icons.accessible_forward))
                ],
              ),
            ),
            body: const TabBarView(
              clipBehavior: Clip.antiAlias,
              children: [
                FundaScreen(),
                CumuScreen(),
              ],
            )),
      ),
    );
  }
}
