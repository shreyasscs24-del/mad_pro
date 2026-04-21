import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'widgets/time_tab_bar.dart';
import 'widgets/screen_time_card.dart';
import 'widgets/hourly_pattern_chart.dart';
import 'widgets/category_card.dart';
import 'widgets/app_comparison_row.dart';

class UsageScreen extends StatefulWidget {
  const UsageScreen({super.key});

  @override
  State<UsageScreen> createState() => _UsageScreenState();
}

class _UsageScreenState extends State<UsageScreen> {
  int _selectedTab = 0;

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
              const Text(
                'Usage',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Today\'s screen time breakdown',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 20),

              // Tab bar
              TimeTabBar(
                selectedIndex: _selectedTab,
                onTap: (i) => setState(() => _selectedTab = i),
              ),
              const SizedBox(height: 20),

              // Total Screen Time
              const ScreenTimeCard(),
              const SizedBox(height: 16),

              // Hourly Pattern
              const HourlyPatternChart(),
              const SizedBox(height: 20),

              // Category Split
              Text(
                'CATEGORY SPLIT',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textLabel,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              const CategoryCard(
                label: 'Social Media',
                value: '4h 15m',
                color: AppColors.accentPink,
              ),
              const SizedBox(height: 10),
              const CategoryCard(
                label: 'Entertainment',
                value: '1h 10m',
                color: AppColors.accentRed,
              ),
              const SizedBox(height: 10),
              const CategoryCard(
                label: 'Productivity',
                value: '45m',
                color: AppColors.accentGreen,
              ),
              const SizedBox(height: 10),
              const CategoryCard(
                label: 'Others',
                value: '33m',
                color: AppColors.accentBlue,
              ),
              const SizedBox(height: 20),

              // App Comparison
              const AppComparisonRow(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
