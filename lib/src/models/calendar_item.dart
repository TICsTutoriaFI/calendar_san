//una unica clase que maneja todos los datos de los eventos del calendario
class CalendarItem{
  final String professor;
  final String subject;
  final List<CalendarItemDetail> details;

  CalendarItem({
    required this.professor,
    required this.subject,
    required this.details,
  });

  factory CalendarItem.fromJson(Map<String, dynamic> json) {
    return CalendarItem(
      professor: json['Professor'] as String,
      subject: json['Subject'] as String,
      details: (json['Details'] as List<dynamic>)
          .map((detailJson) => CalendarItemDetail.fromJson(detailJson as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CalendarItemDetail {
  final String iniHour;
  final String iniMin;
  final String endHour;
  final String endMin;
  final String day;

  CalendarItemDetail({
    required this.iniHour,
    required this.iniMin,
    required this.endHour,
    required this.endMin,
    required this.day,
  });

  factory CalendarItemDetail.fromJson(Map<String, dynamic> json) {
    return CalendarItemDetail(
      iniHour: json['inihour'] as String,
      iniMin: json['inimin'] as String,
      endHour: json['endhour'] as String,
      endMin: json['endmin'] as String,
      day: json['day'] as String,
    );
  }
}
