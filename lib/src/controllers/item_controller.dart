import 'dart:convert';
import 'package:calendar_san/src/models/calendar_item.dart';

class ItemController {
  static List<ScheduleResponse> getItems(String json) {
    List<ScheduleResponse> items = [];
    if (json.isNotEmpty) {
      final parsed = jsonDecode(json).cast<Map<String, dynamic>>();
      items = parsed.map<ScheduleResponse>((json) => ScheduleResponse.fromJson(json)).toList();
    }
    return items;
  }

}
