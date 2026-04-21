import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/stat_card.dart';
import 'widgets/productivity_score_card.dart';
import 'widgets/time_drain_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 20),

              // Productivity Score
              const ProductivityScoreCard(),
              const SizedBox(height: 16),

              // Stat Cards
              const StatCard(
                icon: Icons.phone_android,
                iconBgColor: AppColors.accentPink,
                value: '4 1 5  h  m',
                valueColor: AppColors.accentPink,
                label: 'Social Time',
                sublabel: 'today',
              ),
              const SizedBox(height: 12),
              const StatCard(
                icon: Icons.menu_book_rounded,
                iconBgColor: AppColors.accentCyan,
                value: '383',
                valueColor: AppColors.accentCyan,
                label: 'Pages Lost',
                sublabel: 'could\'ve read',
              ),
              const SizedBox(height: 12),
              const StatCard(
                icon: Icons.code_rounded,
                iconBgColor: AppColors.accentBlue,
                value: '17',
                valueColor: AppColors.accentBlue,
                label: 'Code Lessons',
                sublabel: 'missed',
              ),
              const SizedBox(height: 12),
              const StatCard(
                icon: Icons.diamond_rounded,
                iconBgColor: AppColors.accentGreen,
                value: '510',
                valueColor: AppColors.accentGreen,
                label: 'Words Lost',
                sublabel: 'vocab potential',
              ),
              const SizedBox(height: 16),

              // Time Drain
              const TimeDrainCard(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'WELCOME BACK',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'SkillTime',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 2),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Screen Time → ',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  TextSpan(
                    text: 'Real Skills',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.accentPink,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(Icons.grid_view_rounded,
              color: Colors.white, size: 20),
        ),
      ],
    );
  }
}
