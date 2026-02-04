import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instituto_braziel/services/auth_service.dart';

class UsersService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final AuthService authService;

  UsersService({required this.authService});

  Future<DocumentSnapshot<Map<String, dynamic>>> getCurrentUser() async {
    final user = authService.usuario;

    if (user == null) {
      throw Exception("No user logged in");
    }

    return await _db.collection('users').doc(user.uid).get();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> currentUserStream() {
    final user = authService.usuario;

    if (user == null) {
      throw Exception('No user logged in');
    }

    return _db.collection('users').doc(user.uid).snapshots();
  }
}
