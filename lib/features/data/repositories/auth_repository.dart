import 'package:firebase_auth/firebase_auth.dart';
import 'package:ensan_app/features/data/datasources/auth_datasource.dart';
import 'package:ensan_app/features/data/datasources/local_datasource.dart';
import 'package:ensan_app/features/data/model/user_model.dart';

class AuthRepository {
  final AuthDataSource _authDataSource;
  final LocalDataSource _localDataSource;

  AuthRepository(this._authDataSource, this._localDataSource);

  Future<UserModel> signIn(String email, String password) async {
    try {
      final credential = await _authDataSource.signInWithEmail(email, password);
      final user = await _createUserModel(credential.user!);
      await _localDataSource.saveUser(user);
      return user;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<UserModel> signUp(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      // ignore: unused_local_variable
      final credential = await _authDataSource.signUpWithEmail(email, password);
      await _authDataSource.updateDisplayName(displayName);

      // Get updated user after display name is set
      final updatedUser = _authDataSource.currentUser!;
      final user = await _createUserModel(updatedUser);
      await _localDataSource.saveUser(user);
      return user;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> sendPasswordReset(String email) async {
    try {
      await _authDataSource.sendPasswordResetEmail(email);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _authDataSource.signOut();
      await _localDataSource.clearUser();
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final user = _authDataSource.currentUser;
      if (user != null) {
        return await _createUserModel(user);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> isUserLoggedIn() async {
    return await _localDataSource.isUserLoggedIn();
  }

  Stream<User?> get authStateChanges => _authDataSource.authStateChanges;

  Future<UserModel> _createUserModel(User user) async {
    final token = await user.getIdToken();
    return UserModel.fromFirebase(user, token: token);
  }

  String _handleError(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-credential':
        case 'user-not-found':
        case 'wrong-password':
          return 'Invalid email or password. Please check your credentials.';
        case 'invalid-email':
          return 'Please enter a valid email address.';
        case 'user-disabled':
          return 'Your account has been disabled. Contact support.';
        case 'too-many-requests':
          return 'Too many attempts. Please try again later.';
        case 'email-already-in-use':
          return 'An account already exists with this email.';
        case 'weak-password':
          return 'Password is too weak. Use at least 6 characters.';
        case 'network-request-failed':
          return 'Network error. Check your connection.';
        case 'requires-recent-login':
          return 'Please sign in again to continue.';
        default:
          return error.message ?? 'An unexpected error occurred.';
      }
    }
    return 'Something went wrong. Please try again.';
  }
}
