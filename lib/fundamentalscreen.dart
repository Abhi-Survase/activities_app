import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int ans = 0;
int num = 0;
int steps = 0;

class FundaScreen extends StatefulWidget {
  const FundaScreen({super.key});
  @override
  State<FundaScreen> createState() {
    return _FundaScreenState();
  }
}

class _FundaScreenState extends State<FundaScreen> {
  @override
  Widget build(BuildContext context) {
    final finAnsCtrl = TextEditingController();
    final finNumCtrl = TextEditingController();
    final finStepsCtrl = TextEditingController();
    var fundaAnsList = <int>[];
    var fundaAnsStringList = <String>[];
    for (int i = 0; i < steps; i++) {
      ans += num;
      fundaAnsList.add(ans);
      //print('step ${i + 1}: $ans');
    }
    for (int i = 0; i < fundaAnsList.length; i++) {
      // var jay = fundaAnsList[i].toString();
      //print(fundaAnsList[i]);
      fundaAnsStringList.add(fundaAnsList[i].toString());
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
                      autocorrect: false,
                      controller: finAnsCtrl,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (fAnsVal) async {
                        ans = int.parse(fAnsVal);
                        //print(ans);
                      },
                      onSubmitted: (fAnsVal) async {
                        ans = int.parse(fAnsVal);
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
                        controller: finNumCtrl,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (fNumVal) async {
                          num = int.parse(fNumVal);
                          //print(num);
                        },
                        onSubmitted: (fNumVal) async {
                          num = int.parse(fNumVal);
                          //print(num);
                        },
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
                      controller: finStepsCtrl,
                      onChanged: (fStepsVal) async {
                        steps = int.parse(fStepsVal);
                        //print(fStepsVal);
                      },
                      onSubmitted: (fStepsVal) async {
                        steps = int.parse(fStepsVal);
                        //print(fStepsVal);
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
                                    fundaAnsList.clear();
                                    num = 0;
                                    ans = 0;
                                    steps = 0;
                                    finAnsCtrl.clear();
                                    finNumCtrl.clear();
                                    finStepsCtrl.clear();
                                    setState(() {
                                      fundaAnsStringList.clear;
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
                    itemCount: fundaAnsStringList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      // print(index);
                      return Text(fundaAnsStringList[index]);
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
