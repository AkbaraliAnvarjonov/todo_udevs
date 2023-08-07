part of 'events_bloc.dart';

abstract class EventsEvent {}

class GetAllEvents extends EventsEvent {}

class InsertNewEvent extends EventsEvent {
  EventModel eventModel;
  InsertNewEvent(this.eventModel);
}

class UpdateCurrentEvent extends EventsEvent {
  EventModel eventModel;
  UpdateCurrentEvent(this.eventModel);
}

class DeleteEvent extends EventsEvent {
  EventModel eventModel;
  DeleteEvent(this.eventModel);
}

class CloseReminderBanner extends EventsEvent {}
