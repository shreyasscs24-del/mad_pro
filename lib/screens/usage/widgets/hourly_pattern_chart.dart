import 'package:flutter/material.dart';
import 'package:skilltime_app/constants/app_colors.dart';

class HourlyPatternChart extends StatelessWidget {
  const HourlyPatternChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data: fraction of max height for each hour slot
    final data = [
      _BarData(0.15, [AppColors.textMuted]),
      _BarData(0.55, [AppColors.accentPink, AppColors.accentPurple]),
      _BarData(0.40, [AppColors.accentPink]),
      _BarData(0.60, [AppColors.accentPink, AppColors.accentPurple]),
      _BarData(0.25, [AppColors.textMuted]),
      _BarData(0.70, [AppColors.accentPink]),
      _BarData(0.90, [AppColors.accentPink, AppColors.accentOrange]),
      _BarData(0.35, [AppColors.textMuted]),
    ];
    final labels = ['8a', '9a', '12p', '2p', '4p', '6p', '8p', '10p'];

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
            'HOURLY PATTERN',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textLabel,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(data.length, (i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 28,
                      height: 100 * data[i].fraction,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: data[i].colors.length > 1
                              ? data[i].colors
                              : [data[i].colors[0], data[i].colors[0]],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: labels
                .map(
                  (l) => SizedBox(
                    width: 28,
                    child: Text(
                      l,
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

class _BarData {
  final double fraction;
  final List<Color> colors;
  _BarData(this.fraction, this.colors);
}
