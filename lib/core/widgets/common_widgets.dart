import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const KpiCard({
    super.key, required this.title, required this.value, this.subtitle,
    required this.icon, required this.color, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const Spacer(),
                Icon(Icons.arrow_forward_ios_rounded, size: 12, color: AppColors.textMuted),
              ],
            ),
            const SizedBox(height: 14),
            Text(value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: color, fontWeight: FontWeight.w800,
              )),
            const SizedBox(height: 4),
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
            if (subtitle != null) ...[
              const SizedBox(height: 2),
              Text(subtitle!, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textMuted,
              )),
            ],
          ],
        ),
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  const StatusBadge({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }
}

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? action;

  const EmptyState({super.key, required this.icon, required this.title, this.subtitle, this.action});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: AppColors.textMuted),
          const SizedBox(height: 16),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(subtitle!, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
          ],
          if (action != null) ...[const SizedBox(height: 20), action!],
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  const SectionHeader({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    if (trailing != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: Text(title, style: Theme.of(context).textTheme.titleLarge)),
          const SizedBox(width: 8),
          trailing!,
        ],
      );
    }
    return Text(title, style: Theme.of(context).textTheme.titleLarge);
  }
}

class AppSearchBar extends StatelessWidget {
  final String hint;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  const AppSearchBar({super.key, required this.hint, required this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.search, color: AppColors.textMuted, size: 18),
        isDense: true,
      ),
    );
  }
}
