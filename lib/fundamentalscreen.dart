import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int num = 22;
int ans = 0;
int steps = 30;

class FundaScreen extends StatelessWidget {
  const FundaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var fundaAnsList = <int>[];

    for (int i = 0; i <= steps; i++) {
      ans += num;
      fundaAnsList.add(ans);
      //print('step ${i + 1}: $ans');
    }
    //  var currentanspointer = 0;
    // final currentans = fundaAnsList[currentanspointer];
    // List<String> getfundaAnsList() {
    //   final listfundaAnsList = List.of(fundaAnsList);
    //   return listfundaAnsList;
    // }

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
                child:
                    Text('Continuous Addition', style: TextStyle(fontSize: 26)),
              ),
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: TextEditingController(text: ''),
                      onSubmitted: (val) async {
                        num = val as int;
                        print(num);
                      },
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Starting Value',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Fundamental Number',
                        ),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLines: 1,
                      decoration: const InputDecoration(
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
                        onPressed: () {
                          fundaAnsList.clear();
                        },
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
                      ...fundaAnsList.map((e) {
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
