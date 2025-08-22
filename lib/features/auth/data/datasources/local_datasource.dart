import 'package:ensan_app/core/services/shared_pref/shared_pref.dart';
import 'package:ensan_app/core/services/shared_pref/pref_keys.dart';
import 'package:ensan_app/features/auth/data/model/user_model.dart';

abstract class LocalDataSource {
  Future<void> saveUser(UserModel user);
  Future<void> clearUser();
  Future<UserModel?> getStoredUser();
  Future<bool> isUserLoggedIn();
}

class SharedPrefsDataSource implements LocalDataSource {
  @override
  Future<void> saveUser(UserModel user) async {
    await Future.wait([
      SharedPref.setString(PrefKeys.authToken, user.token ?? ''),
      SharedPref.setString(PrefKeys.userDisplayName, user.displayName ?? ''),
      SharedPref.setString(PrefKeys.userEmail, user.email),
      SharedPref.setBool(PrefKeys.isLoggedIn, true),
    ]);
  }

  @override
  Future<void> clearUser() async {
    await Future.wait([
      SharedPref.remove(PrefKeys.authToken),
      SharedPref.remove(PrefKeys.userDisplayName),
      SharedPref.remove(PrefKeys.userEmail),
      SharedPref.setBool(PrefKeys.isLoggedIn, false),
    ]);
  }

  @override
  Future<UserModel?> getStoredUser() async {
    final isLoggedIn = SharedPref.getBool(PrefKeys.isLoggedIn) ?? false;
    if (!isLoggedIn) return null;

    final token = SharedPref.getString(PrefKeys.authToken);
    final displayName = SharedPref.getString(PrefKeys.userDisplayName);
    final email = SharedPref.getString(PrefKeys.userEmail);

    if (email == null) return null;

    return UserModel(
      uid: '',
      email: email,
      displayName: displayName,
      token: token,
    );
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return SharedPref.getBool(PrefKeys.isLoggedIn) ?? false;
  }
}
