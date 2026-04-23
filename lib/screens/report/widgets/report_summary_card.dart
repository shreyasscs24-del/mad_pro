import 'package:flutter/material.dart';
import 'package:skilltime_app/constants/app_colors.dart';

class ReportSummaryCard extends StatelessWidget {
  const ReportSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _metric('5h 22m', 'Avg Daily', AppColors.accentPink),
          _divider(),
          _metric('37h 34m', 'Total', AppColors.accentPurple),
          _divider(),
          _metric('Thu', 'Peak Day', AppColors.accentOrange),
        ],
      ),
    );
  }

  Widget _metric(String value, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      height: 36,
      color: AppColors.textMuted.withOpacity(0.2),
    );
  }
}
