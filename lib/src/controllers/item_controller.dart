import 'dart:convert';
import 'package:calendar_san/src/models/calendar_item.dart';

class ItemController {
  static List<CalendarItem> fromJson(String json) {
    List<CalendarItem> items = [];
    List<dynamic> parsedJson = jsonDecode(json);
    for (var item in parsedJson) {
      items.add(CalendarItem.fromJson(item));
    }
    return items;
  }
}
