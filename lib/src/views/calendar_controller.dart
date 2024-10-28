import 'dart:math';
import 'package:flutter/material.dart';

/// A controller for the timetable.
///
/// The controller allow intialization of the timetable and to expose timetable functionality to the outside.
class CalendarLayoutController {
  CalendarLayoutController({
    /// The number of day columns to show.
    int initialColumns = 7,
    /// The start date (first column) of the timetable. Default is today.
    DateTime? start,
    
    /// The start hour of the timetable. Default is 0.
    int? startHour,

    /// The end hour of the timetable. Default is 23.
    int? endHour,

    /// The height of each cell in the timetable. Default is 50.
    double? cellHeight,

    /// The height of the header in the timetable. Default is 50.
    double? headerHeight,

    /// The width of the timeline where hour labels are rendered. Default is 50.
    double? timelineWidth,

    /// Controller event listener.
    Function(CalendarControllerEvent)? onEvent,
  }) {
    _columns = initialColumns;
    _start = DateUtils.dateOnly(start ?? DateTime(DateTime.monday));
    _startHour = startHour ?? 0;
    _endHour = endHour ?? 23;
    _cellHeight = cellHeight ?? 50;
    _headerHeight = headerHeight ?? 50;
    _timelineWidth = timelineWidth ?? 50;
    _visibleDateStart = _start;
    if (onEvent != null) addListener(onEvent);
  }

  late DateTime _start;

  DateTime get start => _start;
  set start(DateTime value) {
    _start = DateUtils.dateOnly(value);
    dispatch(CalendarStartChanged(_start));
  }

  /// The [start] time of the timetable.
  late int _startHour;
  int get startHour => _startHour;
  set startHour(int value) {
    assert(value >= 0 && value < 24);
    _startHour = value;
    dispatch(CalendarStartHourChanged(value));
  }

  /// The [end] time of the timetable.
  late int _endHour;
  int get endHour => _endHour;
  set endHour(int value) {
    assert(value >= 0 && value < 24);
    _endHour = value;
    dispatch(CalendarEndHourChanged(value));
  }

  int _columns = 5;

  /// The current number of [columns] in the timetable.
  int get columns => _columns;

  double _cellHeight = 50.0;

  /// The current height of each cell in the timetable.
  double get cellHeight => _cellHeight;

  final Map<int, Function(CalendarControllerEvent)> _listeners = {};
  bool get hasListeners => _listeners.isNotEmpty;

  double _headerHeight = 50.0;

  /// The current height of the header in the timetable.
  double get headerHeight => _headerHeight;

  double _timelineWidth = 50.0;

  /// The current width of the timeline where hour labels are rendered.
  double get timelineWidth => _timelineWidth;

  late DateTime _visibleDateStart;

  /// The first date of the visible area of the timetable.
  DateTime get visibleDateStart => _visibleDateStart;

  /// Allows listening to events dispatched from the timetable
  int addListener(Function(CalendarControllerEvent)? listener) {
    if (listener == null) return -1;
    final id = _listeners.isEmpty ? 0 : _listeners.keys.reduce(max) + 1;
    _listeners[id] = listener;
    return id;
  }

  /// Removes a listener from the timetable
  void removeListener(int id) => _listeners.remove(id);

  /// Removes all listeners from the timetable
  void clearListeners() => _listeners.clear();

  /// Dispatches an event to all listeners
  void dispatch(CalendarControllerEvent event) {
    for (var listener in _listeners.values) {
      listener(event);
    }
  }

  /// Scrolls the timetable to the given date and time.
  void jumpTo(DateTime date) {
    dispatch(CalendarJumpToRequested(date));
  }

  /// Updates the number of columns in the timetable
  setColumns(int i) {
    if (i == _columns) return;
    _columns = i;
    dispatch(CalendarColumnsChanged(i));
  }

  /// Updates the height of each cell in the timetable
  setCellHeight(double height) {
    if (height == _cellHeight) return;
    if (height <= 0) return;
    _cellHeight = min(height, 1000);
    dispatch(CalendarCellHeightChanged(height));
  }

  /// This allows the timetable to update the current visible date.
  void updateVisibleDate(DateTime date) {
    _visibleDateStart = date;
    dispatch(CalendarVisibleDateChanged(date));
  }
}





// EVENTS CLASS: Will be moving a other archive .dart
/// A generic event that can be dispatched from the timetable controller
abstract class CalendarControllerEvent {}

/// Event used to change the cell height of the timetable
class CalendarCellHeightChanged extends CalendarControllerEvent {
  final double height;
  CalendarCellHeightChanged(this.height);
}

/// Event used to change the number of columns in the timetable
class CalendarColumnsChanged extends CalendarControllerEvent {
  CalendarColumnsChanged(this.columns);
  final int columns;
}

/// Event used to scroll the timetable to a given date and time
class CalendarJumpToRequested extends CalendarControllerEvent {
  CalendarJumpToRequested(this.date);
  final DateTime date;
}

/// Event dispatched when the start date of the timetable changes
class CalendarStartChanged extends CalendarControllerEvent {
  CalendarStartChanged(this.start);
  final DateTime start;
}

/// Event dispatched when the start time of the timetable changes
class CalendarStartHourChanged extends CalendarControllerEvent {
  CalendarStartHourChanged(this.startHour);
  final int startHour;
}

/// Event dispatched when the end time of the timetable changes
class CalendarEndHourChanged extends CalendarControllerEvent {
  CalendarEndHourChanged(this.endHour);
  final int endHour;
}

/// Event dispatched when the visible date of the timetable changes
class CalendarVisibleDateChanged extends CalendarControllerEvent {
  CalendarVisibleDateChanged(this.start);
  final DateTime start;
}