import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ensan_app/core/services/shared_pref/pref_keys.dart';
import 'package:ensan_app/core/services/shared_pref/shared_pref.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class AppFontHandler {
  // Font Family Names
  static const String roboto = 'Roboto';
  static const String tajawal = 'Tajawal';

  static String getLocalizedFontFamily() {
    final currentLanguage = SharedPref.getString(PrefKeys.language);
    return currentLanguage == 'ar' ? tajawal : roboto;
  }

  static TextStyle greatVibes = GoogleFonts.greatVibes(
    fontSize: 50,
    color: AppColors.textAndIconPrimary,
  );
}
