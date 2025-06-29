import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle kLargeTitle = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w800,
  fontSize: 36.0,
);
final TextStyle kMediumTitle = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w800,
  fontSize: 32.0,
);
final TextStyle kTitle = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w800,
  fontSize: 28.0,
);
final TextStyle kSubTitle = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w800,
  fontSize: 24.0,
);
final TextStyle kHeadline = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w700,
  fontSize: 20.0,
);
final TextStyle kSubHeadline = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
);
final TextStyle kBodyText = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w400,
  fontSize: 16.0,
);
final TextStyle kButtonText = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w600,
  fontSize: 16.0,
);
final TextStyle kCaption1 = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
);
final TextStyle kCaption2 = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w400,
  fontSize: 12.0,
);
final TextStyle kCaption3 = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w400,
  fontSize: 10.0,
);

final TextTheme kMobileTextTheme = TextTheme(
  displayLarge: kLargeTitle.copyWith(fontSize: 24.0),
  displaySmall: kMediumTitle.copyWith(fontSize: 20.0),
  titleLarge: kTitle.copyWith(fontSize: 16.0),
  titleMedium: kSubTitle.copyWith(fontSize: 14.0),
  headlineLarge: kHeadline.copyWith(fontSize: 20.0),
  headlineMedium: kSubHeadline.copyWith(fontSize: 16.0),
  bodyLarge: kBodyText.copyWith(fontSize: 16.0),
  bodySmall: kCaption1.copyWith(fontSize: 12.0, fontWeight: FontWeight.w500),
  bodyMedium: kCaption1.copyWith(fontSize: 12.0),
  labelLarge: kButtonText.copyWith(fontSize: 14.0),
);
