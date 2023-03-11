import 'package:flutter/material.dart';
import 'package:mgr_app_flutter/widgets/title_widget.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<String> items =
      List<String>.generate(1000, (index) => 'Item $index');

  void defaultSort() {
    setState(() {
      items.sort((a, b) => b.compareTo(a));
    });
  }

  void reversedSort() {
    setState(() {
      items.sort((a, b) => a.compareTo(b));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 50, 75, 75),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Padding(
            padding: EdgeInsets.only(left: 50, top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                "Second Screen",
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
      backgroundColor: const Color.fromARGB(255, 0, 128, 128),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
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
                        onPressed: () => defaultSort(),
                        child: const Text('Sort', style: TextStyle(fontSize: 16,
                            fontFamily: 'Roboto', color: Colors.white),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: SizedBox(
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
                        onPressed: () => reversedSort(),
                        child: const Text('Reverse', style: TextStyle(fontSize: 16,
                            fontFamily: 'Roboto', color: Colors.white),)),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10, left: 40),
                //   child: ElevatedButton(
                //     onPressed: () => reversedSort(),
                //     child: const Text(
                //       'Reverse',
                //       style: TextStyle(fontSize: 22, fontFamily: 'Roboto'),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
              child: ListView.builder(
                  itemCount: items.length,
                  itemExtent: 100,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: ListTile(
                            leading: SizedBox(
                                width: 80,
                                height: 80,
                                child: Image.asset(
                                  'assets/images/bird.png',
                                  fit: BoxFit.cover,
                                )),
                            title: Padding(
                              padding: const EdgeInsets.only(top:10, left: 20),
                              child: Text(
                                items[index],
                                style: const TextStyle(
                                    fontFamily: 'Roboto', fontSize: 24),
                              ),
                            ),
                            key: ValueKey(index),
                            textColor: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Divider(
                            color: Color.fromARGB(255, 156, 101, 76),
                            thickness: 3,
                            endIndent: 20,
                            indent: 20,
                            height: 1,
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
