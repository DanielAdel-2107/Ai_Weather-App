import 'package:ai_weather/core/di/dependancy_injection.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = locator<FirebaseAuth>();
  // sign up with email and password
  Future<User?> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateProfile(displayName: displayName);
      await userCredential.user?.reload();
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthWrongDataException(errorMessage: _handleAuthError(e));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  // sign in with email and password
  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthWrongDataException(errorMessage: _handleAuthError(e));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  // get user name
  Future<String> getUserName() async {
    String  displayName = await _auth.currentUser?.displayName??"Unknown User";
    return displayName;
  }
  // check if user is logged in
  bool get isLoggedIn => _auth.currentUser!= null;
  // forget password
  Future<void> forgetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthWrongDataException(errorMessage: _handleAuthError(e));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  // handle errors
  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return "This account is not registered ❌";
      case 'wrong-password':
        return "Incorrect password ❌";
      case 'email-already-in-use':
        return "This email is already in use ❌";
      case 'weak-password':
        return "The password is too weak ❌";
      case 'invalid-email':
        return "Invalid email address ❌";
      case 'too-many-requests':
        return "This account is temporarily blocked due to multiple login attempts ❌";
      default:
        return "Unexpected error please try again later.";
    }
  }
}

class FirebaseAuthWrongDataException implements Exception {
  final String errorMessage;
  FirebaseAuthWrongDataException({required this.errorMessage});
  @override
  String toString() => errorMessage;
}
