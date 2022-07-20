import 'package:floor/floor.dart';
import 'package:floor_demo/model/user.dart';

@dao
abstract class MyDao {
  @Query('SELECT * FROM Users WHERE id = :id')
  Future<Users?> retrieveUserById(int id);

  @Query('SELECT * FROM Users')
  Future<List<Users>> retrieveUser();

  @Query('UPDATE Users SET name = :name WHERE id = :id')
  Future<void> updateUsers(int id, String name);

  @insert
  Future<void> insertUser(Users user);

  @update
  Future<void> updateUser(Users user);

  @delete
  Future<void> deleteUser(Users user);
}
