import 'package:get_it/get_it.dart';
import 'package:todo_udevs/data/repositories/database_repository.dart';
import 'package:todo_udevs/service/local_notification.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton(() => DatabaseRepository());
  getIt<LocalNotificationService>().init();
}
