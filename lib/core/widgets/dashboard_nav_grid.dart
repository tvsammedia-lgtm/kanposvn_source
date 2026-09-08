import 'package:flutter/material.dart';

/// Một mục menu trên dashboard — bấm để vào màn hình con.
class DashboardNavItem {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final String? subtitle;

  const DashboardNavItem({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
    this.subtitle,
  });
}

/// Lưới các thẻ chức năng bấm được dùng chung cho dashboard mọi module.
///
/// Thẻ gọn: icon + nhãn (+ subtitle, nếu có). Mỗi module truyền `items` trỏ
/// tới các màn hình con (Navigator.push hoặc đổi tab).
class DashboardNavGrid extends StatelessWidget {
  final List<DashboardNavItem> items;
  final int crossAxisCount;
  final EdgeInsetsGeometry padding;
  final double cardHeight;
  final double cardSpacing;

  const DashboardNavGrid({
    super.key,
    required this.items,
    this.crossAxisCount = 2,
    this.padding = const EdgeInsets.all(16),
    this.cardHeight = 110,
    this.cardSpacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: cardSpacing,
        crossAxisSpacing: cardSpacing,
        childAspectRatio: crossAxisCount == 2 ? 1.35 : 1.15,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => _DashboardNavCard(item: items[index]),
    );
  }
}

class _DashboardNavCard extends StatelessWidget {
  final DashboardNavItem item;
  const _DashboardNavCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 34, color: item.color),
              const SizedBox(height: 8),
              Text(
                item.label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              if (item.subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  item.subtitle!,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.outline),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}