import 'package:flutter/material.dart';
import 'package:skilltime_app/constants/app_colors.dart';

class DailyBreakdownCard extends StatelessWidget {
  const DailyBreakdownCard({super.key});

  @override
  Widget build(BuildContext context) {
    final days = [
      _DayEntry('Monday', '5h 12m', 0.65),
      _DayEntry('Tuesday', '4h 00m', 0.50),
      _DayEntry('Wednesday', '6h 24m', 0.80),
      _DayEntry('Thursday', '7h 36m', 0.95),
      _DayEntry('Friday', '5h 36m', 0.70),
      _DayEntry('Saturday', '3h 12m', 0.40),
      _DayEntry('Sunday', '4h 24m', 0.55),
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
            'DAILY BREAKDOWN',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textLabel,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          ...days.map((day) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    SizedBox(
                      width: 90,
                      child: Text(
                        day.name,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.cardMedium,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: day.fraction,
                            child: Container(
                              height: 6,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: day.fraction > 0.7
                                      ? [AppColors.accentPink, AppColors.accentOrange]
                                      : [AppColors.accentPurple, AppColors.accentBlue],
                                ),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 55,
                      child: Text(
                        day.time,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: day.fraction > 0.7
                              ? AppColors.accentPink
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _DayEntry {
  final String name;
  final String time;
  final double fraction;
  _DayEntry(this.name, this.time, this.fraction);
}
