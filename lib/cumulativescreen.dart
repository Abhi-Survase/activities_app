import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int ans = 0;
int num = 0;
int steps = 0;

class CumuScreen extends StatefulWidget {
  const CumuScreen({super.key});
  @override
  State<CumuScreen> createState() {
    return _CumuScreenState();
  }
}

class _CumuScreenState extends State<CumuScreen> {
  @override
  Widget build(BuildContext context) {
    final cinAnsCtrl = TextEditingController();
    final cinNumCtrl = TextEditingController();
    final cinStepsCtrl = TextEditingController();

    var cumuAnsList = <int>[];
    var cumuAnsStringlist = <String>[];

    if (num >= 0) {
      for (int i = 0; i < steps; i++) {
        ans = (num + i) + ans;
        cumuAnsList.add(ans);
      }
    } else {
      for (int i = 0; i < steps; i++) {
        ans += (num - i);
        cumuAnsList.add(ans);
      }
    }

    for (int i = 0; i < cumuAnsList.length; i++) {
      var jay = cumuAnsList[i].toString();
      var ind = (i + 1).toString();
      //print(cumuAnsList[i]);
      cumuAnsStringlist.add('$ind :  $jay ');
    }
    //  var currentanspointer = 0;
    // final currentans = cumuAnsList[currentanspointer];
    // List<String> getcumuAnsList() {
    //   final listcumuAnsList = List.of(cumuAnsList);
    //   return listcumuAnsList;
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
                      autocorrect: false,
                      controller: cinAnsCtrl,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (cAnsVal) async {
                        ans = int.parse(cAnsVal);
                        //print(ans);
                      },
                      onSubmitted: (cAnsVal) async {
                        ans = int.parse(cAnsVal);
                        //print(ans);
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
                        controller: cinNumCtrl,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (cNumVal) async {
                          num = int.parse(cNumVal);
                          //print(num);
                        },
                        onSubmitted: (cNumVal) async {
                          num = int.parse(cNumVal);
                          //print(num);
                        },
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Cumulative Number',
                        ),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: cinStepsCtrl,
                      onChanged: (cStepsVal) async {
                        steps = int.parse(cStepsVal);
                        //print(cStepsVal);
                      },
                      onSubmitted: (cStepsVal) async {
                        steps = int.parse(cStepsVal);
                        //print(cStepsVal);
                      },
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Number of Steps',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton.icon(
                            style: const ButtonStyle(
                                elevation: MaterialStatePropertyAll(5),
                                fixedSize: MaterialStatePropertyAll(
                                    Size.fromHeight(35)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blueGrey),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {
                              setState(() {});
                            },
                            icon: const Icon(Icons.calculate_outlined),
                            label: const Text(
                              'Calculate',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                radius: 20,
                                child: IconButton(
                                  onPressed: () {
                                    cumuAnsList.clear();
                                    num = 0;
                                    ans = 0;
                                    steps = 0;
                                    cinAnsCtrl.clear();
                                    cinNumCtrl.clear();
                                    cinStepsCtrl.clear();
                                    setState(() {
                                      cumuAnsStringlist.clear;
                                    });
                                  },
                                  splashColor: Colors.red,
                                  splashRadius: 22,
                                  icon: const Icon(Icons.close,
                                      color: Colors.white),
                                ),
                              ))
                        ],
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
                  child: ListView.builder(
                    itemCount: cumuAnsStringlist.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      // print(index);
                      return Text(cumuAnsStringlist[index]);
                    },
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
