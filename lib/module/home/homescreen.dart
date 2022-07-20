import 'package:floor_demo/module/home/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeScreenController ctrl = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: GetBuilder<HomeScreenController>(
        builder: (_) => Column(children: <Widget>[
          Form(
              key: ctrl.key,
              child: TextFormField(
                  controller: ctrl.controller,
                  validator: (value) => validator(value!))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    ctrl.insertOnPress();
                  },
                  child: Text(ctrl.isUpdate.value ? 'Update' : 'Insert'),
                ),
              ),
            ],
          ),
          Flexible(
            child: ListView.builder(
              itemCount: ctrl.userData.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Flexible(
                      child: ListTile(
                        leading: const Icon(Icons.account_box_outlined,
                            color: Colors.blue, size: 40),
                        title: Text('${ctrl.userData[index].id}'),
                        subtitle: Text(ctrl.userData[index].name),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.update),
                      onPressed: () {
                        ctrl.updateOnPress(ctrl.userData[index]);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ctrl.delete(ctrl.userData[index]);
                      },
                    )
                  ],
                );
              },
            ),
          )
        ]),
      ),
    );
  }

  validator(String value) {
    if (value.isEmpty) {
      return "Please Enter Name";
    }
    if (value.trim() == '') {
      return "Only space is not allowed!!";
    }
  }
}
