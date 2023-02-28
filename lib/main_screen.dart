import 'package:flutter/material.dart';
import 'package:mgr_app_flutter/domain/counter.dart';
import './widgets/title_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final String _fluttery = 'Fluttery \u{1F98A}';
  final String _rocket = 'Rocket \u{1F680}';
  final TextEditingController _editingController = TextEditingController();
  final Counter _counter = Counter();
  static const int _FIELD_LENGTH = 255;

  void incrementCounter() {
    setState(() {
      _counter.increment();
    });
  }

  void decrementCounter() {
    setState(() {
      _counter.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    double rowWidth = MediaQuery.of(this.context).size.width / 3;
    double rowHeight = MediaQuery.of(this.context).size.height / 6;

    return Scaffold(
      appBar: AppTitle(
        title: 'First Screen',
        size: 100,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    height: rowHeight,
                    width: rowWidth,
                    child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => showDialog(
                              context: context,
                              builder: (BuildContext context) => showDialogBox(
                                  context,
                                  title: _fluttery,
                                  content: getFlutteryContent()),
                            ),
                        child: Image.asset('assets/images/bird.png')),
                  ),
                ),
                SizedBox(
                  width: rowWidth,
                ),
                SizedBox(
                  height: rowHeight,
                  width: rowWidth,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => showDialogBox(context,
                          title: _rocket, content: getRocketContent()),
                    ),
                    child: Image.asset('assets/images/rocket.png'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 5, color: Colors.black26),
                      borderRadius: BorderRadius.circular(50.0)),
                  hintText: 'Type something',
                ),
                cursorColor: Colors.black,
                maxLength: _FIELD_LENGTH,
                style: const TextStyle(fontSize: 24, fontFamily: 'Roboto'),
                controller: _editingController,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25),
                  child: SizedBox(
                    height: 40,
                    width: rowWidth,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[850],
                      ),
                        onPressed: () => _editingController.clear(),
                        child: const Text('Clear')),
                  ),
                ),
                SizedBox(
                  width: rowWidth / 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: rowWidth,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[850],
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/secondPage'),
                      child: const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          'Go to the second page',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'You have pushed the button this many times: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _counter.value.toString(),
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.blue[850],
                  heroTag: 'Decrement',
                  onPressed: decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.blue[850],
                  heroTag: 'Increment',
                  onPressed: incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.teal[800],
    );
  }

  Widget showDialogBox(BuildContext context,
      {required String title, required String content}) {
    return Theme(
      data: Theme.of(context).copyWith(
          dialogTheme: const DialogTheme(backgroundColor: Colors.blue)),
      child: AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(this.context).pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(this.context, '/secondPage'),
            child: const Text(
              'Go to the second page',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  String getFlutteryContent() =>
      "Welcome my name is Fluttery and I'am the official Flutter mascot ";

  String getRocketContent() =>
      "Welcome I'am Rocket one of the symbols of Flutter";
}
