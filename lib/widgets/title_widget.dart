import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final double size;

  const AppTitle({Key? key, required this.title, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
