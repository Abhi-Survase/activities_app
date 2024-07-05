import 'package:flutter/material.dart';

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
    final screenSize = MediaQuery.of(context).size.width;
    final cinAnsCtrl = TextEditingController();
    final cinNumCtrl = TextEditingController();
    final cinStepsCtrl = TextEditingController();

    var cumuAnsList = <int>[];
    var cumuAnsStringlist = <String>[];

    if (num >= 0 && steps > 0) {
      for (int i = 0; i < steps; i++) {
        ans = (num + i) + ans;
        cumuAnsList.add(ans);
      }
    } else if (num < 0 && steps > 0) {
      for (int i = 0; i < steps; i++) {
        ans += (num - i);
        cumuAnsList.add(ans);
      }
    } else if (num >= 0 && steps < 0) {
      for (int i = 0; i > steps; i--) {
        ans = (num + i) + ans;
        cumuAnsList.add(ans);
      }
    } else if (num < 0 && steps < 0) {
      for (int i = 0; i > steps; i--) {
        ans = ans + num;
        cumuAnsList.add(ans);
        num = num + 1; //incrementing the value by 1
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
      child: (screenSize > 660
          ? Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('Gradual Calculation',
                          style: TextStyle(fontSize: 26)),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true),
                            autocorrect: false,
                            controller: cinAnsCtrl,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
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
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true),
                              controller: cinNumCtrl,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.digitsOnly
                              // ],
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
                                labelText: 'Start Cumulative From',
                              ),
                            ),
                          ),
                          TextField(
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true),
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
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
                                      elevation: WidgetStatePropertyAll(5),
                                      fixedSize: WidgetStatePropertyAll(
                                          Size.fromHeight(40)),
                                      backgroundColor: WidgetStatePropertyAll(
                                          Colors.blueGrey),
                                      foregroundColor:
                                          WidgetStatePropertyAll(Colors.white)),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.calculate_outlined),
                                  label: const Text(
                                    'Calculate',
                                    style: TextStyle(fontSize: 20),
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
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey)),
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
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 20),
                      child: Text('Gradual Calculation',
                          style: TextStyle(fontSize: 26)),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true),
                            autocorrect: false,
                            style: const TextStyle(
                              height: 0.75,
                            ),
                            controller: cinAnsCtrl,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
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
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true),
                              style: const TextStyle(
                                height: 0.75,
                              ),
                              controller: cinNumCtrl,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.digitsOnly
                              // ],
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
                                labelText: 'Start Cumulative From',
                              ),
                            ),
                          ),
                          TextField(
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true),
                            style: const TextStyle(
                              height: 0.75,
                            ),
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
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
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton.icon(
                                  style: const ButtonStyle(
                                      elevation: WidgetStatePropertyAll(5),
                                      fixedSize: WidgetStatePropertyAll(
                                          Size.fromHeight(30)),
                                      backgroundColor: WidgetStatePropertyAll(
                                          Colors.blueGrey),
                                      foregroundColor:
                                          WidgetStatePropertyAll(Colors.white)),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.calculate_outlined,
                                      size: 18),
                                  label: const Text(
                                    'Calculate',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    radius: 19,
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
                                      splashRadius: 17,
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        weight: 50,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                    child: Container(
                      alignment: Alignment.center,
                      foregroundDecoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey)),
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
                ),
                const Text(
                  "github.com/Abhi-Survase/activities_app",
                  style: TextStyle(color: Color.fromARGB(120, 158, 158, 158)),
                ),
              ],
            )),
    );
  }
}
