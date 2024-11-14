import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimplePage(),
    );
  }
}

class SimplePage extends StatelessWidget {
  const SimplePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Calendario(),
    );
  }
}

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  // Usaremos una lista de listas para almacenar los eventos en la tabla
  List<List<String?>> eventos =
      List.generate(6, (_) => List.generate(15, (_) => null)); // 6 días, 15 horas

  // Método para agregar un evento
  void agregarEvento(int dia, int hora, String evento) {
    setState(() {
      eventos[dia][hora] = evento;
    });
  }

  // Método para eliminar un evento
  void eliminarEvento(int dia, int hora) {
    setState(() {
      eventos[dia][hora] = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> dias = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado'
    ];
    List<String> horas = List.generate(15, (index) => '${index + 7}:00'); // Horas de 7 a 21

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Fila para los encabezados de los días
            Row(
              children: [
                SizedBox(width: 60), // Espacio para alinear la columna de horas
                ...dias.map((dia) {
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
                        children: dias.asMap().entries.map((entry) {
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
