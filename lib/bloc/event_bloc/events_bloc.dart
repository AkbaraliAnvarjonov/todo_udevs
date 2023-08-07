import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_udevs/data/models/task_model.dart';
import 'package:todo_udevs/data/repositories/database_repository.dart';
import 'package:todo_udevs/utils/constants/form_status.dart';
import 'package:todo_udevs/utils/tools/get_it.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, TasksState> {
  EventsBloc()
      : super(TasksState(
          newEvent: null,
          events: [],
          message: '',
          status: FormStatus.pure,
        )) {
    on<GetAllEvents>(getAllEvents);
    on<InsertNewEvent>(insertNewEvent);
    // on<UpdateCurrentEvent>(updateTask);
    // on<DeleteEvent>(deleteTask);
  }

  getAllEvents(GetAllEvents event, emit) async {
    emit(state.copyWith(status: FormStatus.getting));
    List<EventModel> events = await getIt<DatabaseRepository>().getAllList();
    emit(state.copyWith(
      status: FormStatus.success,
      events: events,
    ));
    // emit(state.copyWith(
    //     status: FormStatus.fail, message: myResponse.errorMessage));
  }

  insertNewEvent(InsertNewEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.adding));
    await getIt<DatabaseRepository>().insertToDatabase(event: event.eventModel);
    emit(state.copyWith(
      status: FormStatus.addingSucces,
    ));
    // emit(state.copyWith(
    //     status: FormStatus.fail, message: myResponse.errorMessage));
  }

  // updateTask(UpdateCurrentEvent event, emit) {
  //   getIt<TaskRepository>().updateItem(event.task);
  //   if (event.task.mustNotify) {
  //     getIt<TaskRepository>().setNotification(event.task);
  //   } else {
  //     getIt<TaskRepository>().cancelNotification(event.task.id);
  //   }
  //   emit(state.copyWith(status: FormStatus.updated));
  //   add(GetAllTasks());
  // }

  // deleteTask(DeleteTaskEvent event, emit) {
  //   getIt<TaskRepository>().deleteItem(event.task);
  //   emit(state.copyWith(status: FormStatus.updated));
  //   add(GetAllTasks());
  // }
}
