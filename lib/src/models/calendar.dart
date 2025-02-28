class Calendar {
  String id;
  String title;
  String description;
  int startDay;
  int endDay;
  String startHour;
  String endHour;
  String location;


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

  String get getId => id;
  String get getTitle => title;
  String get getDescription => description;
  int get getStartDay => startDay;
  int get getEndDay => endDay;
  String get getStartHour => startHour;
  String get getEndHour => endHour;
  String get getLocation => location;

  set setId(String id) {
    this.id = id;
  }

  set setTitle(String title) {
    this.title = title;
  }

  set setDescription(String description) {
    this.description = description;
  }

  set setStartDay(int startDay) {
    this.startDay = startDay;
  }

  set setEndDay(int endDay) {
    this.endDay = endDay;
  }

  set setStartHour(String startHour) {
    this.startHour = startHour;
  }

  set setEndHour(String endHour) {
    this.endHour = endHour;
  }

  set setLocation(String location) {
    this.location = location;
  }


  // Este metodo probablemente no sea necesario
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