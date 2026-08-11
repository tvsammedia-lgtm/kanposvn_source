/// Định nghĩa tab của shell kanposvncafe — dùng chung cho shell
/// và màn hình phân quyền (tránh lệch id/label giữa hai nơi).
class CafeTabDef {
  final String id;
  final String label;

  const CafeTabDef({required this.id, required this.label});
}

const List<CafeTabDef> cafeTabDefs = [
  CafeTabDef(id: 'tables', label: 'Sơ đồ Bàn'),
  CafeTabDef(id: 'floor_table_management', label: 'Quản lý Tầng/Bàn'),
  CafeTabDef(id: 'pos', label: 'Bán hàng'),
  CafeTabDef(id: 'dashboard', label: 'Dashboard'),
  CafeTabDef(id: 'menu', label: 'Menu & Recipe'),
  CafeTabDef(id: 'inventory', label: 'Kho Hàng'),
  CafeTabDef(id: 'finance', label: 'Thu Chi & KT'),
  CafeTabDef(id: 'customers', label: 'KH & NCC'),
  CafeTabDef(id: 'purchase', label: 'Nhập hàng'),
  CafeTabDef(id: 'voucher', label: 'Phiếu Thu/Chi'),
  CafeTabDef(id: 'sync_neon', label: 'Vercel Neon'),
  CafeTabDef(id: 'order_history', label: 'Tra cứu hóa đơn'),
  CafeTabDef(id: 'backup_restore', label: 'Backup/Restore'),
  CafeTabDef(id: 'sales_report', label: 'Báo Cáo Bán Hàng'),
  CafeTabDef(id: 'report_common', label: 'Báo Cáo Chung'),
  CafeTabDef(id: 'employees', label: 'Quản lý nhân viên'),
  CafeTabDef(id: 'permissions', label: 'Phân quyền'),
  CafeTabDef(id: 'einvoice', label: 'Hóa đơn điện tử'),
];
