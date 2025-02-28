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

/*
class ScheduleResponse {
  final List<Schedule> schedules;

  ScheduleResponse({
    required this.schedules,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) {
    return ScheduleResponse(
      schedules: (json['Schedules'] as List<dynamic>)
          .map((scheduleJson) => Schedule.fromJson(scheduleJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Schedules': schedules.map((schedule) => schedule.toJson()).toList(),
    };
  }
}

class Schedule {
  final String professor;
  final String subject;
  final List<ScheduleDetail> details;

  Schedule({
    required this.professor,
    required this.subject,
    required this.details,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      professor: json['Professor'] as String,
      subject: json['Subject'] as String,
      details: (json['Details'] as List<dynamic>)
          .map((detailJson) => ScheduleDetail.fromJson(detailJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Professor': professor,
      'Subject': subject,
      'Details': details.map((detail) => detail.toJson()).toList(),
    };
  }
}

class ScheduleDetail {
  final String iniHour;
  final String iniMin;
  final String endHour;
  final String endMin;
  final String day;

  ScheduleDetail({
    required this.iniHour,
    required this.iniMin,
    required this.endHour,
    required this.endMin,
    required this.day,
  });

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) {
    return ScheduleDetail(
      iniHour: json['inihour'] as String,
      iniMin: json['inimin'] as String,
      endHour: json['endhour'] as String,
      endMin: json['endmin'] as String,
      day: json['day'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'inihour': iniHour,
      'inimin': iniMin,
      'endhour': endHour,
      'endmin': endMin,
      'day': day,
    };
  }
}
*/