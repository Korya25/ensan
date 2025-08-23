import 'package:ensan_app/core/services/shared_pref/pref_keys.dart';
import 'package:ensan_app/core/services/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  bool get isGuest => SharedPref.getBool(PrefKeys.guest) == true;
  bool get isLoggedIn => SharedPref.getBool(PrefKeys.isLoggedIn) == true;
}
