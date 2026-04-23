import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'widgets/streak_card.dart';
import 'widgets/goal_card.dart';
import 'widgets/active_challenge_card.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen>
    with TickerProviderStateMixin {
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
                      'Goals',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Track your digital wellness targets',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Streak
              _animated(1, const StreakCard()),
              const SizedBox(height: 20),

              // Goals section
              _animated(
                2,
                Text(
                  'YOUR GOALS',
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
                3,
                const GoalCard(
                  icon: Icons.phone_android,
                  accentColor: AppColors.accentPink,
                  title: 'Daily Screen Time',
                  current: '4h 15m',
                  target: '3h limit',
                  progress: 0.85,
                  isOnTrack: false,
                ),
              ),
              const SizedBox(height: 10),
              _animated(
                4,
                const GoalCard(
                  icon: Icons.group_rounded,
                  accentColor: AppColors.accentPurple,
                  title: 'Social Media Limit',
                  current: '1h 20m',
                  target: '2h limit',
                  progress: 0.65,
                  isOnTrack: true,
                ),
              ),
              const SizedBox(height: 10),
              _animated(
                5,
                const GoalCard(
                  icon: Icons.menu_book_rounded,
                  accentColor: AppColors.accentCyan,
                  title: 'Reading Goal',
                  current: '25 min',
                  target: '30 min/day',
                  progress: 0.83,
                  isOnTrack: true,
                ),
              ),
              const SizedBox(height: 10),
              _animated(
                6,
                const GoalCard(
                  icon: Icons.code_rounded,
                  accentColor: AppColors.accentBlue,
                  title: 'Coding Practice',
                  current: '40 min',
                  target: '1h/day',
                  progress: 0.67,
                  isOnTrack: true,
                ),
              ),
              const SizedBox(height: 20),

              // Active Challenge
              _animated(7, const ActiveChallengeCard()),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
