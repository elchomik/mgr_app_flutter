import 'package:flutter/material.dart';
import 'package:mgr_app_flutter/widgets/title_widget.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTitle(title: 'Second Screen', size: 100,),
      body:  ElevatedButton(onPressed: () => Navigator.pop(this.context),
      child: const Text('Go to the main screen'),),
      backgroundColor: Colors.teal,
    );
  }
}
