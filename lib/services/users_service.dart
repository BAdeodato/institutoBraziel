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
    String? birth,
    String? fullName,
    String? id,
    bool? over18,
  }) async {
    await _db.collection('users').doc(_getUid()).update({
      if (phone != null) 'phone': phone,
      if (userName != null) 'userName': userName,
      if (birth != null) 'birth': birth,
      if (fullName != null) 'fullName': fullName,
      if (id != null) 'id': id,
      if (over18 != null) 'over18': over18,
    });
  }
}
