import 'package:flutter/material.dart';
import 'package:calendar_san/src/controllers/calendar_controller.dart';
import 'package:calendar_san/src/controllers/item_controller.dart';
import 'package:calendar_san/src/models/calendar_item.dart';

class CalendarSan extends StatefulWidget {
  final int startDay;
  final int endDay;
  final int startHour;
  final int endHour;
  final String json;

  const CalendarSan(
      {super.key,
      this.startDay = 1,
      this.endDay = 5,
      this.startHour = 7,
      this.endHour = 21,
      this.json = ''});

  @override
  _CalendarSanState createState() => _CalendarSanState();
}

class _CalendarSanState extends State<CalendarSan> {
  @override
  Widget build(BuildContext context) {
    // Crear un controlador de calendario
    CalendarController controller = CalendarController();
    List<String> days = controller.createDays(
        widget.startDay.toString(), widget.endDay.toString());
    List<String> hours = controller.createHours(
        widget.startHour.toString(), widget.endHour.toString());

    // Crear una lista de items de calendario
    // Esta lista se obtiene a partir de un JSON
    List<CalendarItem> items = ItemController.fromJson(widget.json);
    
    void printItems(){
      for (var item in items) {
        print('Professor: ${item.professor}');
        print('Subject: ${item.subject}');
        for (var detail in item.details) {
          print('Detail: ${detail.iniHour}:${detail.iniMin} - ${detail.endHour}:${detail.endMin} - ${detail.day}');
        }
      }
    }
    printItems();

    // Cuando ya sirva obtener la lista de items de un JSON
    // Imprimir la lista de items en la consola
    //print('Items: $items');

    List<List<String?>> eventos = List.generate(
        6, (_) => List.generate(15, (_) => null)); // 6 días, 15 horas

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
                const SizedBox(width: 60), // Espacio para alinear la columna de horas
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
                      children: hours.map((hora) {
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
                              children: hours.asMap().entries.map((entry) {
                                int indexHora = entry.key;
                                String? evento = eventos[indexDia][indexHora];

                                return Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: const Border(
                                        bottom:
                                            BorderSide(color: Colors.black)),
                                    color: evento != null
                                        ? Colors.lightBlueAccent
                                        : Colors.white,
                                  ),
                                  child: Center(
                                      child: Text(evento ??
                                          'Aqui puede o no ir una materia')),
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
