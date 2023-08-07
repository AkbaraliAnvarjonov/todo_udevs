import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_udevs/data/models/task_model.dart';

class LocalDatabase {
  static String tableName = "todoTable";
  static LocalDatabase getInstance = LocalDatabase._init();
  Database? _database;

  LocalDatabase._init();

  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDB("todo.db");
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
        String textType = "TEXT";
        String intType = "INTEGER";
        String boolType = "INTEGER";

        await db.execute('''
        CREATE TABLE $tableName (
            ${EventFields.id} $idType,
            ${EventFields.name} $textType, 
            ${EventFields.description} $textType, 
            ${EventFields.color} $intType,
            ${EventFields.day} $textType,
            ${EventFields.isFinished} $boolType,
            ${EventFields.location} $textType
            )
            ''');
      },
    );
    return database;
  }

  static Future<EventModel> insertToDatabase(EventModel event) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tableName, event.toJson());
    return event.copyWith(id: id);
  }

  static Future<EventModel> updateTaskById(EventModel updatedTask) async {
    var database = await getInstance.getDb();
    int id = await database.update(
      tableName,
      updatedTask.toJson(),
      where: 'id = ?',
      whereArgs: [updatedTask.id],
    );
    return updatedTask.copyWith(id: id);
  }

  static Future<List<EventModel>> getList() async {
    var database = await getInstance.getDb();
    var listOfEvents = await database.query(tableName, columns: [
      EventFields.id,
      EventFields.name,
      EventFields.description,
      EventFields.color,
      EventFields.day,
      EventFields.isFinished,
      EventFields.location
    ]);

    List<EventModel> list =
        listOfEvents.map((e) => EventModel.fromJson(e)).toList();

    return list;
  }

  static Future<List<EventModel>> getTaskByTitle({String name = ''}) async {
    var database = await getInstance.getDb();

    if (name.isNotEmpty) {
      var listOfTodos = await database.query(
        tableName,
        where: 'title LIKE ?',
        whereArgs: ['%$name%'],
      );
      var list = listOfTodos.map((e) => EventModel.fromJson(e)).toList();
      return list;
    } else {
      var listOfTodos = await database.query(tableName, columns: [
        EventFields.id,
        EventFields.name,
        EventFields.description,
        EventFields.color,
        EventFields.day,
        EventFields.isFinished,
        EventFields.location
      ]);

      var list = listOfTodos.map((e) => EventModel.fromJson(e)).toList();
      return list;
    }
  }

  static Future<List<EventModel>> getTodosIsCompleted(int isFinished,
      {String name = ''}) async {
    var database = await getInstance.getDb();

    if (name.isNotEmpty) {
      var listOfTodos = await database.query(
        tableName,
        where: 'title LIKE ? AND ${EventFields.isFinished} = ?',
        whereArgs: ['%$name%', '$isFinished'],
      );
      var list = listOfTodos.map((e) => EventModel.fromJson(e)).toList();
      return list;
    } else {
      var listOfTodos = await database.query(tableName,
          columns: [
            EventFields.id,
            EventFields.name,
            EventFields.description,
            EventFields.color,
            EventFields.day,
            EventFields.isFinished,
            EventFields.location,
          ],
          where: '${EventFields.isFinished} = ?',
          whereArgs: ['$isFinished']);

      var list = listOfTodos.map((e) => EventModel.fromJson(e)).toList();
      return list;
    }
  }

  static Future<int> deleteTaskById(int id) async {
    var database = await getInstance.getDb();
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
