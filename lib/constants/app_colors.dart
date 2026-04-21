import 'package:flutter/material.dart';

class AppColors {
  // Backgrounds
  static const Color background = Color(0xFF0A0E21);
  static const Color cardDark = Color(0xFF111328);
  static const Color cardMedium = Color(0xFF1A1F38);
  static const Color cardLight = Color(0xFF1D2136);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8D8E98);
  static const Color textMuted = Color(0xFF5A5E76);
  static const Color textLabel = Color(0xFF6C7092);

  // Accents
  static const Color accentPink = Color(0xFFEB1555);
  static const Color accentOrange = Color(0xFFFF6B35);
  static const Color accentCyan = Color(0xFF24D876);
  static const Color accentPurple = Color(0xFFA855F7);
  static const Color accentBlue = Color(0xFF3B82F6);
  static const Color accentGreen = Color(0xFF22C55E);
  static const Color accentYellow = Color(0xFFEAB308);
  static const Color accentRed = Color(0xFFEF4444);
  static const Color accentTeal = Color(0xFF14B8A6);

  // Bar colors for apps
  static const Color instagramGradientStart = Color(0xFFE1306C);
  static const Color instagramGradientEnd = Color(0xFFF77737);
  static const Color youtubeRed = Color(0xFFFF0000);
  static const Color tiktokBlue = Color(0xFF4A90D9);
  static const Color whatsappGreen = Color(0xFF25D366);
  static const Color twitterBlue = Color(0xFF1DA1F2);

  // Gradients
  static const LinearGradient pinkOrangeGradient = LinearGradient(
    colors: [Color(0xFFEB1555), Color(0xFFFF6B35)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient purplePinkGradient = LinearGradient(
    colors: [Color(0xFFA855F7), Color(0xFFEB1555)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Nav
  static const Color navBarBg = Color(0xFF0D1025);
  static const Color navInactive = Color(0xFF5A5E76);
  static const Color navActive = Color(0xFFEB1555);
}
