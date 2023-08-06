import 'package:flutter/material.dart';

class EventFields {
  static String id = "id";
  static String name = "name";
  static String description = "description";
  static String timeOfDay = "time";
  static String day = "day";
  static String mustNotify = "mustNotify";
  static String isFinished = "isFinished";
  static String location = "location";
  static String color = "color";
}

class EventModel {
  int id;
  final String name;
  final String description;
  final String location;
  final TimeOfDay time;
  final DateTime day;
  final bool isFinished;
  final bool mustNotify;
  final String color;

  EventModel({
    required this.description,
    required this.location,
    required this.color,
    required this.name,
    required this.id,
    required this.isFinished,
    required this.mustNotify,
    required this.day,
    required this.time,
  });

  // Convert EventModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'time': time.toString(),
      'day': day.toIso8601String(),
      'isFinished': isFinished,
      'mustNotify': mustNotify,
      'color': color,
    };
  }

  // Create EventModel object from JSON
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      time: TimeOfDay.fromDateTime(DateTime.parse(json['time'])),
      day: DateTime.parse(json['day']),
      isFinished: json['isFinished'],
      mustNotify: json['mustNotify'],
      color: json['color'],
    );
  }

  // Create a copy of EventModel with some updated properties
  EventModel copyWith({
    int? id,
    String? name,
    String? description,
    String? location,
    TimeOfDay? time,
    DateTime? day,
    bool? isFinished,
    bool? mustNotify,
    String? color,
  }) {
    return EventModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      location: location ?? this.location,
      time: time ?? this.time,
      day: day ?? this.day,
      isFinished: isFinished ?? this.isFinished,
      mustNotify: mustNotify ?? this.mustNotify,
      color: color ?? this.color,
    );
  }
}
