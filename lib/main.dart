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
      theme: ThemeData(useMaterial3: true),
      title: 'Activities App',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              title:
                  const Text('Activities App', style: TextStyle(fontSize: 26)),
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const ShapeDecoration(
                  shape: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 3.5,
                      color: Colors.amber,
                    ),
                  ),
                ),
                dividerColor: Colors.blue[800],
                tabs: const [
                  Tab(icon: Icon(Icons.calculate, color: Colors.white)),
                  Tab(icon: Icon(Icons.calculate_outlined, color: Colors.white))
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
