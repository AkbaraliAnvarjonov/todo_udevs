
class EventFields {
  static String id = "id";
  static String name = "name";
  static String description = "description";
  static String day = "day";
  static String isFinished = "isFinished";
  static String location = "location";
  static String color = "color";
}

class EventModel {
  int? id;
  final String name;
  final String description;
  final String location;
  final DateTime day;
  final bool isFinished;
  final int color;

  EventModel({
    this.id,
    required this.description,
    required this.location,
    required this.color,
    required this.name,
    required this.isFinished,
    required this.day,
  });

  // Convert EventModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'day': day.toIso8601String(),
      'isFinished': isFinished ? 1 : 0,
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
      day: DateTime.parse(json['day']),
      isFinished: json['isFinished'] == 1 ? true : false,
      color: json['color'],
    );
  }

  // Create a copy of EventModel with some updated properties
  EventModel copyWith({
    int? id,
    String? name,
    String? description,
    String? location,
    DateTime? day,
    bool? isFinished,
    int? color,
  }) {
    return EventModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      location: location ?? this.location,
      day: day ?? this.day,
      isFinished: isFinished ?? this.isFinished,
      color: color ?? this.color,
    );
  }
}
