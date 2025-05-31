import 'package:flutter/material.dart';
import 'package:fourth_api_class/models/students_models.dart';
import 'package:get/get.dart';

Future<dynamic> addStudents(BuildContext context, {StudentsModels? std}) {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController courseController = TextEditingController();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      if (std != null) {
        nameController.text = std.name ?? "";
        emailController.text = std.email ?? "";
        courseController.text = std.course ?? "";
      }
      return AlertDialog(
        title: Text("${std == null ? "Add" : "Edit"} Student"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            inputsFeilds(hintText: "Add Name", controller: nameController),
            SizedBox(height: 15),
            inputsFeilds(hintText: "Add Email", controller: emailController),
            SizedBox(height: 15),
            inputsFeilds(hintText: "Add Course", controller: courseController),
            SizedBox(height: 20),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (nameController.text.isEmpty) {
                Get.snackbar(
                  'Error',
                  'Please enter name',
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                );
                return;
              }
              Get.back(
                result: {
                  'name': nameController.text,
                  'email': emailController.text,
                  'course': courseController.text,
                },
              );
              return;
            },
            child: Text(std == null ? "Add" : "Update"),
          ),
        ],
      );
    },
  );
}

TextField inputsFeilds({
  required String hintText,
  required TextEditingController controller,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(),
    ),
  );
}
