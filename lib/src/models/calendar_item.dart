// Esta es una clase para la instancia del horario de cada item
class Schedule {
  final int dia;
  final int horaInicial;
  final int minutosInicial;
  final int horaFinal;
  final int minutosFinal;

  Schedule({
    required this.dia,
    required this.horaInicial,
    required this.minutosInicial,
    required this.horaFinal,
    required this.minutosFinal,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      dia: json['dia'],
      horaInicial: json['hora_inicial'],
      minutosInicial: json['minutos_inicial'],
      horaFinal: json['hora_final'],
      minutosFinal: json['minutos_final'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dia': dia,
      'hora_inicial': horaInicial,
      'minutos_inicial': minutosInicial,
      'hora_final': horaFinal,
      'minutos_final': minutosFinal,
    };
  }
}

// Esta es una clase para la instancia de cada item
class CalendarItem {
  final String docente;
  final String materia;
  final String grupo;

  // Para esta cada item se tiene la lista de sus horarios o repeticiones a lo largo de una semana
  final List<Schedule> horarios;

  CalendarItem({
    required this.docente,
    required this.materia,
    required this.grupo,
    required this.horarios,
  });

  factory CalendarItem.fromJson(Map<String, dynamic> json) {
    var list = json['horarios'] as List;
    List<Schedule> horariosList = list.map((i) => Schedule.fromJson(i)).toList();

    return CalendarItem(
      docente: json['docente'],
      materia: json['materia'],
      grupo: json['grupo'],
      horarios: horariosList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docente': docente,
      'materia': materia,
      'grupo': grupo,
      'horarios': horarios.map((e) => e.toJson()).toList(),
    };
  }
}


