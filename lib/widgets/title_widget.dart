import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final double size;
  bool isSecondScreen = false;

  AppTitle({Key? key, required this.title, required this.size, isSecondScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print (isSecondScreen);
    return isSecondScreen
        ? AppBar(
            toolbarHeight: 120,
            backgroundColor: const Color.fromARGB(255, 50, 75, 75),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: Padding(
              padding:  const EdgeInsets.only(left: 50, top:10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          )
        : AppBar(
            toolbarHeight: 120,
            backgroundColor: const Color.fromARGB(255, 50, 75, 75),
            title: Padding(
              padding: const EdgeInsets.only(left: 100, top:10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
