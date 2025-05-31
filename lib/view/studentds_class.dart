import 'package:flutter/material.dart';
import 'package:fourth_api_class/controllers/students_controllers.dart';
import 'package:fourth_api_class/view/add_students_dailoge.dart';
import 'package:get/get.dart';

class StudentdsClass extends StatelessWidget {
  const StudentdsClass({super.key});

  @override
  Widget build(BuildContext context) {
    StudentsControllers studentsControllers = Get.put(StudentsControllers());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await addStudents(context);
          if (result != null) {
            studentsControllers.postStudents(data: result);
          }
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<StudentsControllers>(
        builder: (context) {
          return ListView.builder(
            itemCount: studentsControllers.students.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(studentsControllers.students[index].name ?? ''),
                subtitle: Text(studentsControllers.students[index].email ?? ''),
                trailing: Wrap(
                  children: [
                    IconButton(
                      onPressed: () async {
                        studentsControllers.updateStudent(
                          id: studentsControllers.students[index].id!,
                          stdData: {
                            "name":
                                " ${studentsControllers.students[index].name}",
                            "email": studentsControllers.students[index].email,
                          },
                        );
                        final result = await addStudents(
                          context,
                          std: studentsControllers.students[index],
                        );
                        if (result != null) {
                          studentsControllers.updateStudent(
                            id: studentsControllers.students[index].id!,
                            stdData: result,
                          );
                        }
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        studentsControllers.deleteStudent(
                          id: studentsControllers.students[index].id!,
                        );
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
