import 'package:todo_udevs/data/models/task_model.dart';

class MyResponse {
  String errorMessage;
  List<EventModel> tasks;

  MyResponse({
    required this.tasks,
    this.errorMessage = '',
  });
}
