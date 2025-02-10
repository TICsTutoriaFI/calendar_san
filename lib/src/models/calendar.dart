class Calendar {
  final String id;
  final String title;
  final String description;
  final int startDay;
  final int endDay;
  final String startHour;
  final String endHour;
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
      startDay: int.parse(json['start_date']) ,
      endDay: int.parse(json['end_date']),
      startHour: json['start_hour'],
      endHour: json['end_hour'],
      location: json['location'],
    );
  }
}