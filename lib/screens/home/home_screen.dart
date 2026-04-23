import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/stat_card.dart';
import 'widgets/productivity_score_card.dart';
import 'widgets/time_drain_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animController;
  late final List<Animation<double>> _fadeAnims;
  late final List<Animation<Offset>> _slideAnims;

  // Pulse animation for the header icon
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnim;

  static const int _itemCount = 8;

  @override
  void initState() {
    super.initState();

    // Staggered entrance
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

    // Subtle pulse on header menu icon
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _pulseAnim = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _pulseController.dispose();
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
              _animated(0, _buildHeader()),
              const SizedBox(height: 20),

              // Productivity Score
              _animated(1, const ProductivityScoreCard()),
              const SizedBox(height: 16),

              // Stat Cards
              _animated(
                2,
                const StatCard(
                  icon: Icons.phone_android,
                  iconBgColor: AppColors.accentPink,
                  value: '4 1 5  h  m',
                  valueColor: AppColors.accentPink,
                  label: 'Social Time',
                  sublabel: 'today',
                ),
              ),
              const SizedBox(height: 12),
              _animated(
                3,
                const StatCard(
                  icon: Icons.menu_book_rounded,
                  iconBgColor: AppColors.accentCyan,
                  value: '383',
                  valueColor: AppColors.accentCyan,
                  label: 'Pages Lost',
                  sublabel: 'could\'ve read',
                ),
              ),
              const SizedBox(height: 12),
              _animated(
                4,
                const StatCard(
                  icon: Icons.code_rounded,
                  iconBgColor: AppColors.accentBlue,
                  value: '17',
                  valueColor: AppColors.accentBlue,
                  label: 'Code Lessons',
                  sublabel: 'missed',
                ),
              ),
              const SizedBox(height: 12),
              _animated(
                5,
                const StatCard(
                  icon: Icons.diamond_rounded,
                  iconBgColor: AppColors.accentGreen,
                  value: '510',
                  valueColor: AppColors.accentGreen,
                  label: 'Words Lost',
                  sublabel: 'vocab potential',
                ),
              ),
              const SizedBox(height: 16),

              // Time Drain
              _animated(6, const TimeDrainCard()),
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
        ScaleTransition(
          scale: _pulseAnim,
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF8B5CF6).withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.grid_view_rounded,
                color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }
}
