import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller.valueController,
              decoration: const InputDecoration(
                hintText: "enter the value",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                controller.insertData();
          
              },
              child: const Text("save"),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => ListTile(
                      leading: Checkbox(
                        value: controller.checkbox[index],
                        onChanged: (value) {
                          controller.checkbox[index] = value;
                        },
                      ),
                      title: Text(
                        controller.data[index],
                        style: TextStyle(
                          decoration: controller.checkbox[index] == true
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          controller.deletedata(index);
                        },
                        child: const Text("Delete"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
