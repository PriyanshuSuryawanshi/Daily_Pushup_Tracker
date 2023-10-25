import 'package:hive/hive.dart';

part 'pushupdata.g.dart';

@HiveType(typeId: 1)
class PushupData {
  PushupData({
    required this.date,
    required this.count,
  });

  @HiveField(0)
  String date;

  @HiveField(1)
  int count;
}
