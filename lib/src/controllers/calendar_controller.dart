class CalendarController { 

  List<String> days = []; 

  createDays(String startDay, String endDay) {
    List<String> days = [];
    for (int i = int.parse(startDay); i <= int.parse(endDay); i++) {
      if (i == 1) {
        days.add('Lunes');
      } else if (i == 2) {
        days.add('Martes');
      } else if (i == 3) {
        days.add('Miércoles');
      } else if (i == 4) {
        days.add('Jueves');
      } else if (i == 5) {
        days.add('Viernes');
      } else if (i == 6) {
        days.add('Sábado');
      } else if (i == 7) {
        days.add('Domingo');
      }
    }
    return days;
    
  }

  createDaysofWeek(String startDay, String endDay) {
    List<String> days = [];
    for (int i = int.parse(startDay); i <= int.parse(endDay); i++) {
      if (i == 1) {
        days.add('Lunes');
      } else if (i == 2) {
        days.add('Martes');
      } else if (i == 3) {
        days.add('Miércoles');
      } else if (i == 4) {
        days.add('Jueves');
      } else if (i == 5) {
        days.add('Viernes');
      } else if (i == 6) {
        days.add('Sábado');
      } else if (i == 7) {
        days.add('Domingo');
      }
    }
    return this.days = days;
    
  }

}