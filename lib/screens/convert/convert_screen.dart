import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'widgets/conversion_summary_card.dart';
import 'widgets/skill_conversion_card.dart';

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen>
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
                      'Convert',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Turn wasted time into real skills',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Conversion Summary
              _animated(1, const ConversionSummaryCard()),
              const SizedBox(height: 20),

              // Section Label
              _animated(
                2,
                Text(
                  'SKILL CONVERSIONS',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textLabel,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Skill cards
              _animated(
                3,
                const SkillConversionCard(
                  icon: Icons.menu_book_rounded,
                  accentColor: AppColors.accentCyan,
                  skillName: 'Reading',
                  convertedValue: '383 pg',
                  subtitle: 'pages you could\'ve read',
                  progress: 0.75,
                ),
              ),
              const SizedBox(height: 10),
              _animated(
                4,
                const SkillConversionCard(
                  icon: Icons.code_rounded,
                  accentColor: AppColors.accentBlue,
                  skillName: 'Coding',
                  convertedValue: '17 lessons',
                  subtitle: 'programming tutorials missed',
                  progress: 0.55,
                ),
              ),
              const SizedBox(height: 10),
              _animated(
                5,
                const SkillConversionCard(
                  icon: Icons.diamond_rounded,
                  accentColor: AppColors.accentGreen,
                  skillName: 'Vocabulary',
                  convertedValue: '510 words',
                  subtitle: 'new words you could learn',
                  progress: 0.85,
                ),
              ),
              const SizedBox(height: 10),
              _animated(
                6,
                const SkillConversionCard(
                  icon: Icons.fitness_center_rounded,
                  accentColor: AppColors.accentOrange,
                  skillName: 'Fitness',
                  convertedValue: '3 workouts',
                  subtitle: 'full workout sessions',
                  progress: 0.45,
                ),
              ),
              const SizedBox(height: 10),
              _animated(
                7,
                const SkillConversionCard(
                  icon: Icons.self_improvement_rounded,
                  accentColor: AppColors.accentTeal,
                  skillName: 'Meditation',
                  convertedValue: '8 sessions',
                  subtitle: 'mindfulness sessions missed',
                  progress: 0.65,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
