class Calendar {
  final String id;
  final String title;
  final String description;
  final String startDay;
  final String endDay;
  final DateTime startHour;
  final DateTime endHour;
  final String location;


  Calendar({
    required this.id,
    required this.title,
    required this.description,
    required this.startDay,
    required this.endDay,
    required this.startHour,
    required this.endHour,
    required this.location,
  });

  factory Calendar.fromJson(Map<String, dynamic> json) {
    return Calendar(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDay: json['start_date'],
      endDay: json['end_date'],
      startHour: DateTime.parse(json['start_hour']),
      endHour: DateTime.parse(json['end_hour']),
      location: json['location'],
    );
  }
}