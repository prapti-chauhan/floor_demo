import 'package:floor_demo/local/db.dart';
import 'package:floor_demo/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  List<Users> userData = [];
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  RxBool isUpdate = false.obs;

  Users? user;

  @override
  void onInit() {
    retrieve();
    super.onInit();
  }

  insert() {
    final user = Users(name: controller.text);
    if (key.currentState!.validate()) {
      DB().dao.insertUser(user);
      retrieve();

      update();
    }
  }

  updateData() {
    DB().dao.updateUsers(user!.id!, controller.text);
    retrieve();
    update();
  }

  retrieve() {
    DB().dao.retrieveUser().then((value) {
      userData = value;
      update();
    });
  }

  delete(Users users) {
    isUpdate.value = false;
    DB().dao.deleteUser(users);
    retrieve();
  }

  insertOnPress() {
    if (isUpdate.value) {
      isUpdate.value = false;
      updateData();
      controller.clear();
    } else {
      insert();
      controller.clear();
    }
  }

  updateOnPress(Users users){
    controller.text = users.name;
    user = users;
    isUpdate.value = true;
  }


}
