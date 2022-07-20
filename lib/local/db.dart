import 'package:floor_demo/local/app_database.dart';
import 'package:floor_demo/local/my_dao.dart';

class DB {
  late UserDatabase db;
  late MyDao dao;
  static DB instance = DB._();

  factory DB() {
    return instance;
  }

  DB._() {
    builder();
  }

  builder() async {
    db = await $FloorUserDatabase.databaseBuilder('user_db.db').build();
    dao = db.myDao;
    return dao;
  }
}
