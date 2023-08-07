import 'package:get_it/get_it.dart';
import 'package:todo_udevs/data/repositories/database_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton(() => DatabaseRepository());
}
