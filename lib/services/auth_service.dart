import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  Future<void> register(
    String email,
    String password,
    String userType,
    String phone,
    String userName,
    String birth,
    String fullName,
    String id,
    bool over18,
  ) async {
    try {
      final UserCredential userCredentials = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredentials.user;
      if (user != null) {
        await _db.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': email,
          'userType': userType,
          'phone': phone,
          'userName': userName,
          'birth': birth,
          'fullName': fullName,
          'id': id,
          'over18': over18,
        });
      }
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw AuthException("A senha é muito fraca!");
      } else if (e.code == "email-already-in-use") {
        throw AuthException("Este e-mail já está cadastrado!");
      }
    }
  }

  Future<void> updateAuthData({String? email, String? password}) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw AuthException('Usuário não autenticado.');
    }

    if (email != null && email != user.email) {
      await user.verifyBeforeUpdateEmail(email);
    }

    if (password != null && password.isNotEmpty) {
      await user.updatePassword(password);
    }
  }

  Future<void> login(String userType, String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = credential.user!.uid;
      final userDoc = await _db.collection('users').doc(uid).get();
      if (!userDoc.exists) {
        await _auth.signOut();
        throw AuthException('Usuário não encontrado.');
      }

      final data = userDoc.data()!;

      // 3. Validate userType
      if (data['userType'] != userType) {
        await _auth.signOut();
        throw AuthException(
          'Tipo de usuário incorreto. Verifique se você selecionou ALUNO ou PROFESSOR corretamente.',
        );
      }
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-credential") {
        throw AuthException("E-mail e/ou senha inválido(s)!");
      } else {
        throw AuthException("${e.message}");
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
