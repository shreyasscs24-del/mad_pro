import 'package:flutter/material.dart';
import 'package:skilltime_app/constants/app_colors.dart';

class ScreenTimeCard extends StatelessWidget {
  const ScreenTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
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
            'TOTAL SCREEN TIME',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textLabel,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                '6h 43m',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'vs yesterday',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                  Text(
                    '+1h 12m ↑',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.accentRed,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildAppBar('Instagram', 1.0, AppColors.instagramGradientStart, '1h 28m'),
          const SizedBox(height: 10),
          _buildAppBar('YouTube', 0.79, AppColors.youtubeRed, '1h 10m'),
          const SizedBox(height: 10),
          _buildAppBar('TikTok', 0.59, AppColors.tiktokBlue, '52m'),
          const SizedBox(height: 10),
          _buildAppBar('WhatsApp', 0.45, AppColors.whatsappGreen, '40m'),
          const SizedBox(height: 10),
          _buildAppBar('Twitter', 0.32, AppColors.twitterBlue, '28m'),
          const SizedBox(height: 10),
          _buildAppBar('Others', 0.51, AppColors.textMuted, '45m'),
        ],
      ),
    );
  }

  Widget _buildAppBar(String name, double fraction, Color color, String time) {
    return Row(
      children: [
        SizedBox(
          width: 68,
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.cardMedium,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: fraction,
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 48,
          child: Text(
            time,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
