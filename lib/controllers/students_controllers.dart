import 'dart:convert';
import 'package:fourth_api_class/models/students_models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StudentsControllers extends GetxController {
  List<StudentsModels> students = [];

  getStudents() async {
    String url =
        "https://crudcrud.com/api/8aefc8aeaed5426a9b225763aea0790f/student";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var rseponseBody = jsonDecode(response.body);
    students.clear();
    for (var stdData in rseponseBody) {
      students.add(StudentsModels.fromjson(stdData));
    }
    update();
  }

  postStudents({required Map<String, dynamic> data}) async {
    String url =
        "https://crudcrud.com/api/8aefc8aeaed5426a9b225763aea0790f/student";
    Uri uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    getStudents();
    print(response);
    update();
  }

  @override
  void onInit() {
    getStudents();
    super.onInit();
  }

  deleteStudent({required String id}) async {
    String url =
        "https://crudcrud.com/api/8aefc8aeaed5426a9b225763aea0790f/student/$id";
    Uri uri = Uri.parse(url);
    final response = await http.delete(uri);
    print(response.body);
    getStudents();
  }

  updateStudent({
    required String id,
    required Map<String, dynamic> stdData,
  }) async {
    String url =
        "https://crudcrud.com/api/8aefc8aeaed5426a9b225763aea0790f/student/$id";
    Uri uri = Uri.parse(url);
    final response = await http.put(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(stdData),
    );
    print(response.body);
    getStudents();
  }
}
