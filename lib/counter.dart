import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int todos;
  final int allcompleted;
  const Counter({super.key, required this.todos, required this.allcompleted});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        "$allcompleted <-> $todos",
        style: TextStyle(
          color: allcompleted != todos || todos == 0
              ? const Color.fromARGB(255, 41, 8, 96)
              : Colors.greenAccent,
          fontSize: 28,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
