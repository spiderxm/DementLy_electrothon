class Task {
  final String name;
  bool value;
  Task({this.name, this.value = false});
  void toggleTask() {
    value = !value;
  }
}
