import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../usage/widgets/time_tab_bar.dart';
import 'widgets/report_summary_card.dart';
import 'widgets/weekly_chart.dart';
import 'widgets/insight_card.dart';
import 'widgets/daily_breakdown_card.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen>
    with TickerProviderStateMixin {
  int _selectedTab = 1; // default to "Week"
  late final AnimationController _animController;
  late final List<Animation<double>> _fadeAnims;
  late final List<Animation<Offset>> _slideAnims;

  static const int _itemCount = 8;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnims = List.generate(_itemCount, (i) {
      final start = (i * 0.1).clamp(0.0, 0.7);
      final end = (start + 0.4).clamp(0.0, 1.0);
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _animController,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    });

    _slideAnims = List.generate(_itemCount, (i) {
      final start = (i * 0.1).clamp(0.0, 0.7);
      final end = (start + 0.4).clamp(0.0, 1.0);
      return Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero)
          .animate(
        CurvedAnimation(
          parent: _animController,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    });

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Widget _animated(int index, Widget child) {
    return FadeTransition(
      opacity: _fadeAnims[index],
      child: SlideTransition(
        position: _slideAnims[index],
        child: child,
      ),
    );
  }

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
              _animated(
                0,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Report',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Your weekly screen time analytics',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Tab bar
              _animated(
                1,
                TimeTabBar(
                  selectedIndex: _selectedTab,
                  onTap: (i) => setState(() => _selectedTab = i),
                ),
              ),
              const SizedBox(height: 20),

              // Summary metrics
              _animated(2, const ReportSummaryCard()),
              const SizedBox(height: 16),

              // Weekly chart
              _animated(3, const WeeklyChart()),
              const SizedBox(height: 20),

              // Insights section
              _animated(
                4,
                Text(
                  'INSIGHTS',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textLabel,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              _animated(
                5,
                const InsightCard(
                  icon: Icons.trending_up_rounded,
                  accentColor: AppColors.accentRed,
                  title: 'Usage Spike Detected',
                  description:
                      'Your screen time peaked on Thursday at 7h 36m. Try setting a reminder to take breaks.',
                ),
              ),
              const SizedBox(height: 10),
              _animated(
                6,
                const InsightCard(
                  icon: Icons.emoji_events_rounded,
                  accentColor: AppColors.accentGreen,
                  title: 'Weekend improvement!',
                  description:
                      'You reduced usage by 32% on weekends compared to last week. Keep it up!',
                ),
              ),
              const SizedBox(height: 16),

              // Daily breakdown
              _animated(7, const DailyBreakdownCard()),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
