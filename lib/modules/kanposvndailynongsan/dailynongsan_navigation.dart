import 'package:flutter/material.dart';

enum DailyNongSanTab {
  dashboard('Tổng quan', Icons.dashboard),
  purchasing('Thu mua', Icons.shopping_cart),
  inventory('Kho', Icons.inventory),
  sales('Bán hàng', Icons.point_of_sale),
  accounting('Kế toán', Icons.account_balance),
  settings('Cài đặt', Icons.settings);

  final String label;
  final IconData icon;

  const DailyNongSanTab(this.label, this.icon);
}
