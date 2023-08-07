import 'package:todo_udevs/data/database/local_database.dart';
import 'package:todo_udevs/data/models/task_model.dart';

class DatabaseRepository {
  Future insertToDatabase({required EventModel event}) =>
      LocalDatabase.insertToDatabase(event);

  Future<List<EventModel>> getAllList() => LocalDatabase.getList();

  Future deleteEventById({required int id}) => LocalDatabase.deleteTaskById(id);

  Future updateEvent({required EventModel eventModel}) =>
      LocalDatabase.updateTaskById(eventModel);
}
