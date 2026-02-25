// TODO: TERMINAR DE ADICIONAR OS CAMPOS RESTANTES
class TeacherModel {
  final String id;
  final String name;
  // final String subject;

  TeacherModel({
    required this.id,
    required this.name
    // required this.subject,
  });

  factory TeacherModel.fromMap(String id, Map<String, dynamic> data) {
    return TeacherModel(
      id: id,
      name: data['fullName'] ?? ''
      // subject: data['subject'] ?? '',
    );
  }
}