enum OriginalsTabItem {
  mon,
  tue,
  wed,
  thu,
  fri,
  sat,
  sun,
  dailypass,
  completed;

  @override
  String toString() {
    switch (this) {
      case OriginalsTabItem.mon:
        return 'MON';
      case OriginalsTabItem.tue:
        return 'TUE';
      case OriginalsTabItem.wed:
        return 'WED';
      case OriginalsTabItem.thu:
        return 'THU';
      case OriginalsTabItem.fri:
        return 'FRI';
      case OriginalsTabItem.sat:
        return 'SAT';
      case OriginalsTabItem.sun:
        return 'SUN';
      case OriginalsTabItem.dailypass:
        return 'DAILY PASS';
      case OriginalsTabItem.completed:
        return 'COMPLETED';
    }
  }
}
