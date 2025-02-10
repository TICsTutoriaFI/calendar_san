import 'package:flutter/material.dart';
import 'package:calendar_san/src/controllers/calendar_controller.dart';

class CalendarSan extends StatefulWidget {
  const CalendarSan({super.key});

  @override
  _CalendarSanState createState() => _CalendarSanState();
}

class _CalendarSanState extends State<CalendarSan> {


  // Hacer la creacion de la lista de eventos en item_controller en lib/src/controllers/calendar_controller.dart
  List<List<String?>> eventos =
      List.generate(6, (_) => List.generate(15, (_) => null)); // 6 días, 15 horas

  @override
  Widget build(BuildContext context) {


    // Ya puedo usar el controlador desde aquí pero para que lo hagan desde el que usa la librería como?
    // es decir que se pueda decir desde /example/lib/main.dart que sería como delphos

    
    CalendarController controller = CalendarController();
    List<String> days = controller.createDays('1', '4');



    List<String> dias = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado'
    ];

    List<String> horas = List.generate(15, (index) => '${index + 7}:00'); // Horas de 7 a 21

    return Flexible(
      fit: FlexFit.loose,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Fila para los encabezados de los días
            Row(
              children: [
                SizedBox(width: 60), // Espacio para alinear la columna de horas
                ...days.map((dia) {
                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                          child: Text(dia,
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  );
                })
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  children: [
                    // Columna de horas
                    Column(
                      children: horas.map((hora) {
                        return Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Center(child: Text(hora)),
                        );
                      }).toList(),
                    ),
                    Expanded(
                      child: Row(
                        children: days.asMap().entries.map((entry) {
                          int indexDia = entry.key;
                          return Expanded(
                            child: Column(
                              children: horas.asMap().entries.map((entry) {
                                int indexHora = entry.key;
                                String? evento = eventos[indexDia][indexHora];

                                return Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.black)),
                                    color: evento != null
                                        ? Colors.lightBlueAccent
                                        : Colors.white,
                                  ),
                                  child: Center(
                                      child: Text(evento ?? 'Aqui puede o no ir una materia')),
                                );
                              }).toList(),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
