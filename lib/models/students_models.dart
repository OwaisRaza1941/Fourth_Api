class StudentsModels {
  String? id;
  String? name;
  String? email;
  String? course;

  StudentsModels({this.id, this.name, this.email, this.course});

  factory StudentsModels.fromjson(Map<String, dynamic> json) {
    return StudentsModels(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      course: json['course'],
    );
  }
}
