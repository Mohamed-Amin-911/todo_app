import 'package:flutter/material.dart';
import 'package:todo_app/counter.dart';
// import 'package:lvl2_todo_app/task_button.dart';
import 'package:todo_app/task_card.dart';
import 'package:todo_app/add_task_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  final myController = TextEditingController();

  void addNewTask() {
    setState(() {
      allTasks.add(Task(title: myController.text, stat: false));
      myController.clear();
    });
  }

  int calculateCompletedTasks() {
    int completedtasks = 0;
    for (var item in allTasks) {
      if (item.stat) {
        completedtasks++;
      }
    }
    return completedtasks;
  }

  changeStat(int indexx) {
    setState(() {
      allTasks[indexx].stat = !allTasks[indexx].stat;
    });
  }

  removeTask(int indexxx) {
    setState(() {
      allTasks.remove(allTasks[indexxx]);
    });
  }

  removeAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                removeAll();
              },
              icon: const Icon(
                Icons.remove_circle,
                color: Color.fromARGB(255, 41, 8, 96),
                size: 30,
              ))
        ],
        backgroundColor: Colors.deepPurple[400],
        title: const Text(
          'ToDo',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 41, 8, 96),
              fontSize: 30),
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Counter(
              todos: allTasks.length, allcompleted: calculateCompletedTasks()),
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: allTasks.length,
              itemBuilder: (context, index) {
                return ToDoCard(
                    varTitle: allTasks[index].title,
                    varStat: allTasks[index].stat,
                    changeStat: changeStat,
                    indexx: index,
                    removeTask: removeTask);
              },
            ),
          )
        ]),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.deepPurple[400],
                  ),
                  height: 200,
                  padding: const EdgeInsets.all(33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        controller: myController,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        decoration: const InputDecoration(
                            hintText: 'add new task',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(116, 255, 255, 255))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          addNewTask();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'add',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.deepPurple[400],
        child: const Icon(Icons.add),
      ),
    );
  }
}
