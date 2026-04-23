import 'package:flutter/material.dart';
import 'package:skilltime_app/constants/app_colors.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      _DayData('Mon', 0.65, AppColors.accentPurple),
      _DayData('Tue', 0.50, AppColors.accentPurple),
      _DayData('Wed', 0.80, AppColors.accentPink),
      _DayData('Thu', 0.95, AppColors.accentPink),
      _DayData('Fri', 0.70, AppColors.accentPurple),
      _DayData('Sat', 0.40, AppColors.accentBlue),
      _DayData('Sun', 0.55, AppColors.accentBlue),
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
            'WEEKLY OVERVIEW',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textLabel,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: data.map((d) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Time label above bar
                    Text(
                      '${(d.fraction * 8).toStringAsFixed(0)}h',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: d.color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 30,
                      height: 100 * d.fraction,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            d.color.withOpacity(0.6),
                            d.color,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: d.color.withOpacity(0.25),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: data
                .map(
                  (d) => SizedBox(
                    width: 30,
                    child: Text(
                      d.day,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _DayData {
  final String day;
  final double fraction;
  final Color color;
  _DayData(this.day, this.fraction, this.color);
}
