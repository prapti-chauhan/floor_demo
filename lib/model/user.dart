import 'package:floor/floor.dart';

@entity
class Users {
  @PrimaryKey(autoGenerate: true)
  late int? id;
  late String name;

  Users({this.id, required this.name});
}