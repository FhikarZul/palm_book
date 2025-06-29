import 'package:flutter/material.dart';

// Primaries
const Color kPrimaryMain = Color(0xFF3DA485);
const Color kPrimarySecondary = Color(0xFFFACC55);
const Color kPrimarySurface = Color.fromARGB(255, 228, 186, 117);
const Color kPrimaryBorder = Color.fromARGB(255, 241, 220, 186);
const Color kPrimaryHover = Color.fromARGB(255, 222, 159, 59);
const Color kPrimaryPressed = Color.fromARGB(255, 242, 168, 49);
const Color kPrimaryFocus = Color.fromARGB(255, 244, 210, 155);

// Neutrals
const Color kNeutral10 = Color(0xFFFFFFFF);
const Color kNeutral20 = Color(0xFFF5F5F5);
const Color kNeutral30 = Color(0xFFEDEDED);
const Color kNeutral40 = Color(0xFFE0E0E0);
const Color kNeutral50 = Color(0xFFC2C2C2);
const Color kNeutral60 = Color(0xFF9E9E9E);
const Color kNeutral70 = Color(0xFF757575);
const Color kNeutral80 = Color(0xFF616161);
const Color kNeutral90 = Color(0xFF404040);
const Color kNeutral100 = Color(0xFF0A0A0A);

// Success
const Color kSuccessMain = Color(0xFF65C466);
const Color kSuccessSurface = Color(0xFFE0F3E0);
const Color kSuccessBorder = Color(0xFFCCEBCC);
const Color kSuccessHover = Color(0xFF54A355);
const Color kSuccessPressed = Color(0xFF326233);

// Error
const Color kErrorMain = Color(0xFFED4330);
const Color kErrorSurface = Color(0xFFFBD9D6);
const Color kErrorBorder = Color.fromARGB(255, 226, 142, 133);
const Color kErrorHover = Color(0xFFC5382B);
const Color kErrorPressed = Color(0xFF762118);

// Info
const Color kInfoMain = Color(0xFF3267E3);
const Color kInfoSurface = Color(0xFFF0F3FF);
const Color kInfoBorder = Color(0xFFB1C5F6);
const Color kInfoHover = Color(0xFF114CD6);
const Color kInfoPressed = Color(0xFF11317D);

// Danger
const Color kDangerMain = Color.fromARGB(255, 189, 112, 40);
const Color kDangerSurface = Color(0xFFFBE8D6);
const Color kDangerBorder = Color(0xFFF9D8BA);
const Color kDangerHover = Color(0xFFC57428);
const Color kDangerPressed = Color(0xFF764518);

// Other
const Color kOther1 = Color(0xFFFDE047);
const Color kOther2 = Color(0xFFFACC15);
const Color kOther3 = Color(0xFFFACC15);
const Color kOther4 = Color(0xFF0369A1);
const Color kOther5 = Color(0xFF7DD3FC);
const Color kOther6 = Color.fromARGB(255, 255, 183, 50);
const Color kOther7 = Color.fromARGB(255, 12, 130, 5);
const Color kOther8 = Color.fromARGB(255, 41, 236, 30);
const Color kOther9 = Color.fromARGB(159, 133, 163, 173);

//Scheme
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: kPrimaryMain,
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFCCE5FF),
  onPrimaryContainer: Color(0xFF001D31),
  secondary: kPrimarySecondary,
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFCFE5FF),
  onSecondaryContainer: Color(0xFF001D34),
  tertiary: Color(0xFF006687),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFC1E8FF),
  onTertiaryContainer: Color(0xFF001E2B),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFFCFCFF),
  onSurface: Color(0xFF1A1C1E),
  onSurfaceVariant: Color(0xFF42474E),
  outline: Color(0xFF72787E),
  onInverseSurface: Color(0xFFF0F0F4),
  inverseSurface: Color(0xFF2F3033),
  inversePrimary: Color(0xFF93CCFF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006398),
  outlineVariant: Color(0xFFC2C7CE),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: kPrimaryMain,
  onPrimary: Color(0xFF003351),
  primaryContainer: Color(0xFF004B73),
  onPrimaryContainer: Color(0xFFCCE5FF),
  secondary: kPrimarySecondary,
  onSecondary: Color(0xFF003355),
  secondaryContainer: Color(0xFF004A78),
  onSecondaryContainer: Color(0xFFCFE5FF),
  tertiary: Color(0xFF74D1FF),
  onTertiary: Color(0xFF003548),
  tertiaryContainer: Color(0xFF004D67),
  onTertiaryContainer: Color(0xFFC1E8FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xFF1A1C1E),
  onSurface: Color(0xFFE2E2E5),
  onSurfaceVariant: Color(0xFFC2C7CE),
  outline: Color(0xFF8C9198),
  onInverseSurface: Color(0xFF1A1C1E),
  inverseSurface: Color(0xFFE2E2E5),
  inversePrimary: Color(0xFF006398),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF93CCFF),
  outlineVariant: Color(0xFF42474E),
  scrim: Color(0xFF000000),
);
