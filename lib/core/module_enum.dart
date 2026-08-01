import 'package:flutter/material.dart';

enum AppModule {
  kanposvncafe('KanPosVN Cafe (Isar+Neon)', Icons.local_cafe, Color(0xFFD97706)),
  kanposvnkhachsan('KanPosVN Khách Sạn', Icons.hotel, Color(0xFF0284C7)),
  nhanSu('Nhân Sự', Icons.people, Color(0xFF3B82F6)),
  kanposvnvlxd('KanPosVN VLXD (Isar+Neon)', Icons.architecture, Color(0xFF6366F1)),
  kanposvngara('KanPosVN Gara (Isar+Neon)', Icons.car_repair, Color(0xFF0D9488)),
  kanposvnnhathuoc('KanPosVN Nhà Thuốc (Isar+Neon)', Icons.medical_services, Color(0xFF10B981)),
  kanposvnqlcd('KanPosVN QLCD (Cắt Ghép & Vé)', Icons.content_cut, Color(0xFF7C3AED)),
  kanposvnnbatdongsan('KanPosVN Bất Động Sản', Icons.real_estate_agent, Color(0xFFDB2777)),
  kanposvnbanvevantai('KanPosVN Vận Tải & Vé', Icons.directions_bus, Color(0xFF0891B2)),
  kanposvnbida('KanPosVN Quản Lý Bida', Icons.sports_baseball, Color(0xFF059669)),
  kanposvnnhahangquanan('KanPosVN Nhà Hàng / Quán Ăn', Icons.restaurant, Color(0xFFEA580C)),
  kanposvnnhatro200('KanPosVN Nhà Trọ', Icons.apartment, Color(0xFF06B6D4)),
  kanposvnspa('KanPosVN Spa & Dưỡng Sinh', Icons.spa, Color(0xFFEC4899));

  final String label;
  final IconData icon;
  final Color color;
  const AppModule(this.label, this.icon, this.color);

  String get appCode {
    switch (this) {
      case AppModule.kanposvncafe: return 'kanposvncafe';
      case AppModule.kanposvnkhachsan: return 'kanposvnkhachsan';
      case AppModule.nhanSu: return 'nhansu';
      case AppModule.kanposvnvlxd: return 'kanposvnvlxd';
      case AppModule.kanposvngara: return 'kanposvngara';
      case AppModule.kanposvnnhathuoc: return 'kanposvnnhathuoc';
      case AppModule.kanposvnqlcd: return 'kanposvnqlcd';
      case AppModule.kanposvnnbatdongsan: return 'kanposvnnbatdongsan';
      case AppModule.kanposvnbanvevantai: return 'kanposvnbanvevantai';
      case AppModule.kanposvnbida: return 'kanposvnbida';
      case AppModule.kanposvnnhahangquanan: return 'kanposvnnhahangquanan';
      case AppModule.kanposvnnhatro200: return 'kanposvnnhatro200';
      case AppModule.kanposvnspa: return 'kanposvnspa';
    }
  }

  AppModuleType get moduleType {
    switch (this) {
      case AppModule.kanposvncafe: return AppModuleType.kanposvncafe;
      case AppModule.kanposvnkhachsan: return AppModuleType.kanposvnkhachsan;
      case AppModule.nhanSu: return AppModuleType.nhanSu;
      case AppModule.kanposvnvlxd: return AppModuleType.kanposvnvlxd;
      case AppModule.kanposvngara: return AppModuleType.kanposvngara;
      case AppModule.kanposvnnhathuoc: return AppModuleType.kanposvnnhathuoc;
      case AppModule.kanposvnqlcd: return AppModuleType.kanposvnqlcd;
      case AppModule.kanposvnnbatdongsan: return AppModuleType.kanposvnnbatdongsan;
      case AppModule.kanposvnbanvevantai: return AppModuleType.kanposvnbanvevantai;
      case AppModule.kanposvnbida: return AppModuleType.kanposvnbida;
      case AppModule.kanposvnnhahangquanan: return AppModuleType.kanposvnnhahangquanan;
      case AppModule.kanposvnnhatro200: return AppModuleType.kanposvnnhatro200;
      case AppModule.kanposvnspa: return AppModuleType.kanposvnspa;
    }
  }

  static List<AppModule> getByType(AppModuleType type) {
    return values.where((m) => m.moduleType == type).toList();
  }
}

enum AppModuleType {
  kanposvncafe('KanPosVN Cafe (Isar+Neon)', Icons.local_cafe),
  kanposvnkhachsan('KanPosVN Khách Sạn', Icons.hotel),
  nhanSu('Nhân Sự', Icons.people),
  kanposvnvlxd('KanPosVN VLXD (Isar+Neon)', Icons.architecture),
  kanposvngara('KanPosVN Gara (Isar+Neon)', Icons.car_repair),
  kanposvnnhathuoc('KanPosVN Nhà Thuốc (Isar+Neon)', Icons.medical_services),
  kanposvnbanvevantai('Vận Tải & Vé', Icons.directions_bus),
  kanposvnbida('Quản Lý Bida', Icons.sports_baseball),
  kanposvnspa('Quản Lý Spa & Dưỡng Sinh', Icons.spa),
  kanposvnnhahangquanan('Nhà Hàng / Quán Ăn', Icons.restaurant),
  kanposvnqlcd('KanPosVN QLCD (Cắt Ghép & Vé)', Icons.content_cut),
  kanposvnnbatdongsan('KanPosVN Bất Động Sản', Icons.real_estate_agent),
  kanposvnnhatro200('KanPosVN Nhà Trọ', Icons.apartment);

  final String label;
  final IconData icon;
  const AppModuleType(this.label, this.icon);
}
