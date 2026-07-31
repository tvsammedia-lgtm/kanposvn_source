import 'package:flutter/material.dart';

enum AppModule {
  kanposvncafe('KanPosVN Cafe (Isar+Neon)', Icons.local_cafe, Color(0xFFD97706)),
  kanposvnkhachsan('KanPosVN Khách Sạn', Icons.hotel, Color(0xFF0284C7)),
  nhanSu('Nhân Sự', Icons.people, Color(0xFF3B82F6)),
  kanposvnvlxd('KanPosVN VLXD (Isar+Neon)', Icons.architecture, Color(0xFF6366F1)),
  kanposvngara('KanPosVN Gara (Isar+Neon)', Icons.car_repair, Color(0xFF0D9488)),
  kanposvnnhathuoc('KanPosVN Nhà Thuốc (Isar+Neon)', Icons.medical_services, Color(0xFF10B981)),
  kanposvnqlcd('KanPosVN QLCD (Cắt Ghép & Vé)', Icons.content_cut, Color(0xFF7C3AED));

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
  kanposvnqlcd('KanPosVN QLCD (Cắt Ghép & Vé)', Icons.content_cut);

  final String label;
  final IconData icon;
  const AppModuleType(this.label, this.icon);
}
