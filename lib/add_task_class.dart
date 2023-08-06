class Task {
  String title;
  bool stat;
  Task({required this.title, required this.stat});
}

List allTasks = [
  Task(title: "111111", stat: true),
  Task(title: "222222", stat: false),
  Task(title: "333333", stat: true)
];
