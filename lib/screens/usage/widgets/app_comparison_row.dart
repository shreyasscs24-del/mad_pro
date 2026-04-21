import 'package:flutter/material.dart';
import 'package:skilltime_app/constants/app_colors.dart';

class AppComparisonRow extends StatelessWidget {
  const AppComparisonRow({super.key});

  @override
  Widget build(BuildContext context) {
    final apps = [
      _AppEntry(Icons.camera_alt, '1h 28m', 'Instagram', [AppColors.instagramGradientStart, AppColors.instagramGradientEnd]),
      _AppEntry(Icons.play_arrow_rounded, '1h 10m', 'YouTube', [AppColors.youtubeRed, AppColors.youtubeRed]),
      _AppEntry(Icons.music_note, '52m', 'TikTok', [AppColors.tiktokBlue, AppColors.tiktokBlue]),
      _AppEntry(Icons.chat_bubble, '40m', 'WhatsApp', [AppColors.whatsappGreen, AppColors.whatsappGreen]),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'APP COMPARISON',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textLabel,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: apps.map((app) {
              return Column(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: app.gradientColors),
                    ),
                    child: Icon(app.icon, color: Colors.white, size: 22),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    app.time,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    app.name,
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _AppEntry {
  final IconData icon;
  final String time;
  final String name;
  final List<Color> gradientColors;
  _AppEntry(this.icon, this.time, this.name, this.gradientColors);
}
