import 'package:hive/hive.dart';

part 'pushupdata.g.dart';

@HiveType(typeId: 1)
class PushupData extends HiveObject {
  PushupData({
    required this.date,
    required this.count,
  });

  @HiveField(0)
  DateTime date;

  @HiveField(1)
  int count;
}

@HiveType(typeId: 2)
class ImpValuesData extends HiveObject {
  ImpValuesData({
    required this.field,
    required this.value,
  });

  @HiveField(0)
  String field;

  @HiveField(1)
  int value;
}
