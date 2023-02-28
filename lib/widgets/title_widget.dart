import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final double size;
  bool isSecondScreen=false;

  AppTitle(
      {Key? key,
      required this.title,
      required this.size,
      isSecondScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSecondScreen
        ? AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          )
        : AppBar(
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
