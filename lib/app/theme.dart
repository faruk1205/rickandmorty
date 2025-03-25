import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); //nesne olusturmamiza izin vermiyor

  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Inter',
    scaffoldBackgroundColor: Colors.white, //arkaplan rengi
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF42B4CA),
      secondary: Color(0xFFD5E9ED),
      surface: Colors.white,
      onSurface: Color(0xFF414A4C), //yazı rengi
      error: Color(0xFF414A4C),
      tertiary: Color(0xFFB5C4C7), //ucuncul reng
    ), // light theme
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: Color(0xFF42B4CA),
      ), //tüm ikon butonların rengi için yaptık sadece normal yani buton olmayan ikonlar içinde yapabilirdik
    ),
  );
}
