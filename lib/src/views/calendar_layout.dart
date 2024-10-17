import 'package:flutter/material.dart';

class CalendarLayout extends StatelessWidget {
  const CalendarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: Center(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index', style: Theme.of(context).textTheme.labelSmall),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              child: const Center(
                child: Text('Zona del Evento'),
              ),
            ),
          )
        ],
      ),
    );
  }
}