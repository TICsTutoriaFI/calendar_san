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
                  itemCount: 18,
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
              //color: Theme.of(context).colorScheme.secondary,
              child: Center(
                child:  GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                  ),
                  itemCount: 31,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}