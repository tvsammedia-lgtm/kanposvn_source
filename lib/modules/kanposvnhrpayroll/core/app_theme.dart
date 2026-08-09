import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Brand colors
  static const primaryBlue = Color(0xFF2563EB);
  static const primaryLight = Color(0xFF3B82F6);
  static const accent = Color(0xFF06B6D4);
  static const success = Color(0xFF10B981);
  static const warning = Color(0xFFF59E0B);
  static const danger = Color(0xFFEF4444);

  // Dark surface
  static const bg900 = Color(0xFF0F172A);
  static const bg800 = Color(0xFF1E293B);
  static const bg700 = Color(0xFF1E3A5F); // card highlight
  static const surface = Color(0xFF243447);
  static const surfaceLight = Color(0xFF2D4163);
  static const borderColor = Color(0xFF334155);

  // Text
  static const textPrimary = Color(0xFFF1F5F9);
  static const textSecondary = Color(0xFF94A3B8);
  static const textMuted = Color(0xFF64748B);

  static TextStyle _roboto({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static ThemeData get darkTheme {
    final base = ThemeData.dark();
    final textTheme = base.textTheme.copyWith(
      displayLarge: _roboto(
          color: textPrimary, fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: _roboto(
          color: textPrimary, fontSize: 28, fontWeight: FontWeight.bold),
      headlineLarge: _roboto(
          color: textPrimary, fontSize: 24, fontWeight: FontWeight.w700),
      headlineMedium: _roboto(
          color: textPrimary, fontSize: 20, fontWeight: FontWeight.w600),
      headlineSmall: _roboto(
          color: textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
      titleLarge: _roboto(
          color: textPrimary, fontSize: 16, fontWeight: FontWeight.w600),
      titleMedium: _roboto(
          color: textPrimary, fontSize: 14, fontWeight: FontWeight.w500),
      bodyLarge:
          _roboto(color: textPrimary, fontSize: 14),
      bodyMedium:
          _roboto(color: textSecondary, fontSize: 13),
      bodySmall:
          _roboto(color: textMuted, fontSize: 12),
      labelLarge: _roboto(
          color: textPrimary, fontSize: 14, fontWeight: FontWeight.w500),
    );

    return base.copyWith(
      textTheme: textTheme,
      scaffoldBackgroundColor: bg900,
      colorScheme: const ColorScheme.dark(
        primary: primaryBlue,
        secondary: accent,
        surface: bg800,
        error: danger,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: bg800,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: _roboto(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: textPrimary),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: borderColor, width: 1),
        ),
        margin: const EdgeInsets.all(0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: bg800,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryBlue, width: 2),
        ),
        labelStyle: _roboto(color: textSecondary, fontSize: 13),
        hintStyle: _roboto(color: textMuted, fontSize: 13),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: _roboto(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryLight,
          textStyle: _roboto(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryLight,
          side: const BorderSide(color: primaryBlue),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: _roboto(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: bg800,
        labelStyle: _roboto(color: textSecondary, fontSize: 12),
        side: const BorderSide(color: borderColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      ),
      dividerTheme:
          const DividerThemeData(color: borderColor, thickness: 1, space: 1),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      dataTableTheme: DataTableThemeData(
        headingRowColor: WidgetStateProperty.all(bg800),
        dataRowColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return primaryBlue.withOpacity(0.1);
          return surface;
        }),
        headingTextStyle:
            _roboto(color: textSecondary, fontSize: 12, fontWeight: FontWeight.w600),
        dataTextStyle: _roboto(color: textPrimary, fontSize: 13),
        dividerThickness: 1,
        horizontalMargin: 16,
        columnSpacing: 16,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: primaryLight,
        unselectedLabelColor: textMuted,
        indicatorColor: primaryBlue,
        labelStyle: _roboto(fontSize: 13, fontWeight: FontWeight.w600),
        unselectedLabelStyle: _roboto(fontSize: 13),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: bg800,
        selectedIconTheme: const IconThemeData(color: primaryLight, size: 22),
        unselectedIconTheme: const IconThemeData(color: textMuted, size: 22),
        selectedLabelTextStyle:
            _roboto(color: primaryLight, fontSize: 11, fontWeight: FontWeight.w600),
        unselectedLabelTextStyle:
            _roboto(color: textMuted, fontSize: 11),
        indicatorColor: primaryBlue.withOpacity(0.2),
        useIndicator: true,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: surface,
        contentTextStyle: _roboto(color: textPrimary, fontSize: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: bg800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: _roboto(
            color: textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
