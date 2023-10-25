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
