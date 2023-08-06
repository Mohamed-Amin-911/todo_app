import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard({
    super.key,
    required this.varTitle,
    required this.varStat,
    required this.indexx,
    required this.changeStat,
    required this.removeTask,
  });
  final String varTitle;
  final bool varStat;
  final int indexx;
  final Function changeStat;
  final Function removeTask;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStat(indexx);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          height: 75,
          margin: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
              color: Colors.deepPurple[400],
              borderRadius: BorderRadius.circular(33)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(varTitle,
                      style: TextStyle(
                          decoration: varStat
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 41, 8, 96),
                          fontSize: 22)),
                ),
                Row(
                  children: [
                    Icon(
                      varStat ? Icons.check_circle : Icons.circle,
                      color: const Color.fromARGB(255, 41, 8, 96),
                      size: 30,
                    ),
                    IconButton(
                        onPressed: () {
                          removeTask(indexx);
                        },
                        icon: const Icon(
                          Icons.highlight_remove_rounded,
                          size: 30,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
