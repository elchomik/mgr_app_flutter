import 'package:flutter/material.dart';
import 'package:mgr_app_flutter/domain/counter.dart';
import 'package:mgr_app_flutter/second_screen.dart';
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 50, 75, 75),
            title: const Padding(
              padding: EdgeInsets.only(left: 100, top: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  'First Screen',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    SizedBox(
                      height: rowHeight,
                      width: rowWidth,
                      child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    showDialogBox(context,
                                        title: _fluttery,
                                        content: getFlutteryContent()),
                              ),
                          child: Image.asset('assets/images/bird.png')),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    SizedBox(
                      height: rowHeight,
                      width: rowWidth,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) => showDialogBox(
                              context,
                              title: _rocket,
                              content: getRocketContent()),
                        ),
                        child: Image.asset('assets/images/bird.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.0, color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      hintText: 'Type something',
                      hintStyle: const TextStyle(color: Colors.white)),
                  cursorColor: Colors.white,
                  maxLength: _FIELD_LENGTH,
                  style: const TextStyle(
                      fontSize: 24, fontFamily: 'Roboto', color: Colors.white),
                  controller: _editingController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 140,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 149, 177, 176)),
                            elevation: MaterialStateProperty.all(5),
                            shadowColor: MaterialStateProperty.all(
                                Colors.grey.withOpacity(0.25)),
                          ),
                          onPressed: () => _editingController.clear(),
                          child: const Text('Clear')),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: 140,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 156, 101, 76)),
                          elevation: MaterialStateProperty.all(5),
                          shadowColor: MaterialStateProperty.all(
                              Colors.grey.withOpacity(0.25)),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(this.context, '/secondPage'),
                        child: const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            'Second Screen',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Divider(
                  height: 1,
                  thickness: 5,
                  endIndent: 20,
                  indent: 20,
                  color: Color.fromARGB(255, 156, 101, 76),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: FloatingActionButton(
                        backgroundColor: const Color.fromARGB(255, 149, 177, 176),
                        heroTag: 'Decrement',
                        onPressed: decrementCounter,
                        tooltip: 'Decrement',
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        _counter.value.toString(),
                        style: const TextStyle(
                            fontSize: 54,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: FloatingActionButton(
                        backgroundColor: const Color.fromARGB(255, 149, 177, 176),
                        heroTag: 'Increment',
                        onPressed: incrementCounter,
                        tooltip: 'Increment',
                        child: const Icon(Icons.add),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                  'You have pushed the button this many times: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Roboto',
                  color: Colors.white),
                ),
              )
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 128, 128));
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
