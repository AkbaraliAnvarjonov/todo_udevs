part of 'events_bloc.dart';

@immutable

// ignore: must_be_immutable
class EventsState extends Equatable {
  List<EventModel> events;
  String message;
  FormStatus status;
  EventModel? newEvent;

  EventsState({
    required this.events,
    required this.message,
    required this.status,
    required this.newEvent,
  });

  copyWith(
          {List<EventModel>? events,
          String? message,
          FormStatus? status,
          EventModel? newEvent}) =>
      EventsState(
          newEvent: newEvent ?? this.newEvent,
          status: status ?? this.status,
          message: message ?? this.message,
          events: events ?? this.events);

  @override
  List<Object?> get props => [events, message, status, newEvent];
}
