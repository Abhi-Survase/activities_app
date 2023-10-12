import 'package:flutter/material.dart';

int num = 22;
int ans = 0;
int steps = 30;

class CumuScreen extends StatelessWidget {
  const CumuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cumuAnsList = <int>[];
    cumuAnsList.clear();
    if (num >= 0) {
      for (int i = 0; i < steps; i++) {
        ans = (num + i) + ans;
        cumuAnsList.add(ans);
      }
    } else {
      for (int i = 0; i <= steps; i++) {
        ans += num;
        cumuAnsList.add(ans);
      }
    }

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text('Gradual Addition', style: TextStyle(fontSize: 26)),
              ),
              SizedBox(
                width: 300,
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
                          labelText: 'Enter Cumulative Number',
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
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Container(
              alignment: Alignment.center,
              foregroundDecoration:
                  BoxDecoration(border: Border.all(color: Colors.blueGrey)),
              height: 400,
              width: 300,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(25),
                child: SelectableRegion(
                  focusNode: FocusNode(),
                  selectionControls: materialTextSelectionControls,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      ...cumuAnsList.map((e) {
                        var jay = e.toString();

                        return Text('$jay ');
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}