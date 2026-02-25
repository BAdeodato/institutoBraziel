// TODO: TERMINAR DE ADICIONAR OS CAMPOS RESTANTES
class TeacherModel {
  final String id;
  final String name;
  String? subject;
  String? period;

  TeacherModel({
    required this.id,
    required this.name,
    this.subject,
    this.period,
  });

  factory TeacherModel.fromMap(String id, Map<String, dynamic> data) {
    return TeacherModel(
      id: id,
      name: data['fullName'] ?? '',
      subject: data['subject'] ?? '',
      period: data['period'] ?? '',
    );
  }
}