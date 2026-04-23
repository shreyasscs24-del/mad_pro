import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:skilltime_app/constants/app_colors.dart';

class GoalCard extends StatelessWidget {
  final IconData icon;
  final Color accentColor;
  final String title;
  final String current;
  final String target;
  final double progress;
  final bool isOnTrack;

  const GoalCard({
    super.key,
    required this.icon,
    required this.accentColor,
    required this.title,
    required this.current,
    required this.target,
    required this.progress,
    this.isOnTrack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Progress ring
          SizedBox(
            width: 52,
            height: 52,
            child: CustomPaint(
              painter: _GoalRingPainter(
                progress: progress,
                color: accentColor,
              ),
              child: Center(
                child: Icon(icon, color: accentColor, size: 22),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 13),
                    children: [
                      TextSpan(
                        text: current,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: accentColor,
                        ),
                      ),
                      TextSpan(
                        text: ' / $target',
                        style: TextStyle(
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Status badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: (isOnTrack ? AppColors.accentGreen : AppColors.accentRed)
                  .withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              isOnTrack ? 'On Track' : 'Behind',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isOnTrack ? AppColors.accentGreen : AppColors.accentRed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GoalRingPainter extends CustomPainter {
  final double progress;
  final Color color;

  _GoalRingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    final bgPaint = Paint()
      ..color = color.withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 2,
      false,
      bgPaint,
    );

    final fgPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 2 * progress,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
