import 'package:flutter/material.dart';

class TopAppBarCart extends StatelessWidget {
  final String title;
  const TopAppBarCart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.arrow_back_outlined),
            ),
          ),
          Expanded(
            child: Center(child: Text(title, style: TextStyle(fontSize: 25))),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
