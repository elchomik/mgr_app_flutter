import 'package:flutter/material.dart';
import 'package:mgr_app_flutter/widgets/title_widget.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<String> items =
      List<String>.generate(1000, (index) => 'Item $index');

  void defaultSort() {
    setState(() {
      items.sort((a,b) => b.compareTo(a));
    });
  }

  void reversedSort() {
    setState(() {
      items.sort((a,b) => a.compareTo(b));
    });
  }

  void quickSort(List<String> list, int leftIndex, int rightIndex) {
    if(leftIndex < rightIndex) {
      int partitionIndex = partition(list, leftIndex, rightIndex);
      quickSort(list, leftIndex, partitionIndex-1);
      quickSort(list, partitionIndex+1, rightIndex);
    }
  }

  int partition(List<String> list, int leftIndex, int rightIndex) {
    int pivot = list[rightIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitle(
        title: 'Second Screen',
        size: 100,
        isSecondScreen: true,
      ),
      backgroundColor: Colors.greenAccent,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 40),
                child: ElevatedButton(
                  onPressed: () => defaultSort(),
                  child: const Text(
                    'Sortuj',
                    style: TextStyle(fontSize: 22, fontFamily: 'Roboto'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 40),
                child: ElevatedButton(
                  onPressed: () => reversedSort(),
                  child: const Text(
                    'Przywróć',
                    style: TextStyle(fontSize: 22, fontFamily: 'Roboto'),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top:20, left: 8, right: 8),
              child: Container(
                color: Colors.tealAccent,
                child: ListView.builder(
                    itemCount: items.length,
                    itemExtent: 100,
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/bird.png'),
                            ),
                            title: Text(items[index], style: const TextStyle(fontFamily: 'Roboto', fontSize: 24),),
                            key: ValueKey(index),
                            textColor: Colors.black,
                            trailing: const Icon(Icons.account_circle),
                          ),
                          Divider(
                            color: Colors.amber[300],
                            thickness: 2,
                            height: 1,
                          )
                        ],
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
