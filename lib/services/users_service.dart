import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instituto_braziel/services/auth_service.dart';

class UsersService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final AuthService authService;

  UsersService({required this.authService});

  String _getUid() {
    final user = authService.usuario;
    if (user == null) {
      throw Exception('No user logged in');
    }
    return user.uid;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?> getCurrentUser() async {
    final user = authService.usuario;

    if (user == null) return null;

    return _db.collection('users').doc(user.uid).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>?> getUsers({
    String? userType,
    String? subject,
  }) async {
    final user = authService.usuario;

    if (user == null) return null;
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance.collection(
      'users',
    );

    if (userType != null) {
      query = query.where('userType', isEqualTo: userType);
    }

    if (subject != null) {
      query = query.where('subject', isEqualTo: subject.toLowerCase());
    }

    return query.get();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>?> currentUserStream() {
    final user = authService.usuario;

    if (user == null) {
      return const Stream.empty();
    }

    return _db.collection('users').doc(user.uid).snapshots();
  }

  Future<void> update({
    String? phone,
    String? userName,
    String? subject,
    String? birth,
    String? fullName,
    String? school,
    String? schoolYear,
    String? relativesName,
    String? relativesPhone,
    String? relativesBirth,
    String? relativesEmail,
    String? relativesId,
    String? period,
    String? id,
    bool? over18,
  }) async {
    await _db.collection('users').doc(_getUid()).update({
      if (phone != null) 'phone': phone,
      if (userName != null) 'userName': userName,
      if (userName != null) 'subject': subject!.toLowerCase(),
      if (birth != null) 'birth': birth,
      if (fullName != null) 'fullName': fullName,
      if (school != null) 'school': school,
      if (schoolYear != null) 'schoolYear': schoolYear,
      if (relativesName != null) 'relativesName': relativesName,
      if (relativesPhone != null) 'relativesPhone': relativesPhone,
      if (relativesBirth != null) 'relativesBirth': relativesBirth,
      if (relativesEmail != null) 'relativesEmail': relativesEmail,
      if (relativesId != null) 'relativesId': relativesId,
      if (period != null) 'period': period,
      if (id != null) 'id': id,
      if (over18 != null) 'over18': over18,
    });
  }
}
