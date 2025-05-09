import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Текущий пользователь
  User? get currentUser => _auth.currentUser;

  // Состояние авторизации (Stream для отслеживания изменений)
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Регистрация по email и паролю
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint("Ошибка регистрации: ${e.message}");
      throw e;
    }
  }

  // Вход по email и паролю
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint("Ошибка входа: ${e.message}");
      throw e;
    }
  }

  // Выход из аккаунта
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Проверка, авторизован ли пользователь (синхронно)
  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}