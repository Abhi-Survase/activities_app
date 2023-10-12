import 'package:flutter/material.dart';

class FundaScreen extends StatelessWidget {
  const FundaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Continuous Addition', style: TextStyle(fontSize: 26)),
          ),
          SizedBox(
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Starting Value',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Fundamental Number',
                    ),
                  ),
                ),
                const TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Number of Steps',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: OutlinedButton.icon(
                    style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(5),
                        fixedSize:
                            MaterialStatePropertyAll(Size.fromHeight(35)),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blueGrey),
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {},
                    icon: const Icon(Icons.calculate_outlined),
                    label: const Text(
                      'Calculate',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
