import 'package:flutter/material.dart';

enum AppModule {
  kanposvncafe('KanPosVN Cafe', Icons.local_cafe, Color(0xFFD97706)),
  kanposvnkhachsan('KanPosVN Khách Sạn', Icons.hotel, Color(0xFF0284C7)),
  nhanSu('Nhân Sự', Icons.people, Color(0xFF3B82F6)),
  kanposvnvlxd('KanPosVN VLXD', Icons.architecture, Color(0xFF6366F1)),
  kanposvngara('KanPosVN Gara', Icons.car_repair, Color(0xFF0D9488)),
  kanposvnnhathuoc('KanPosVN Nhà Thuốc', Icons.medical_services, Color(0xFF10B981)),
  kanposvnqlcd('KanPosVN QLCD (Cắt Ghép & Vé)', Icons.content_cut, Color(0xFF7C3AED)),
  kanposvnnbatdongsan('KanPosVN Bất Động Sản', Icons.real_estate_agent, Color(0xFFDB2777)),
  kanposvnbanvevantai('KanPosVN Vận Tải & Vé', Icons.directions_bus, Color(0xFF0891B2)),
  kanposvnbida('KanPosVN Quản Lý Bida', Icons.sports_baseball, Color(0xFF059669)),
  kanposvnpawn('KanPosVN Cầm Đồ', Icons.monetization_on, Color(0xFFB45309)),
  kanposvnnhahangquanan('KanPosVN Nhà Hàng / Quán Ăn', Icons.restaurant, Color(0xFFEA580C)),
  kanposvnnhatro200('KanPosVN Nhà Trọ', Icons.apartment, Color(0xFF06B6D4)),
  kanposvnspa('KanPosVN Spa & Dưỡng Sinh', Icons.spa, Color(0xFFEC4899)),
  kanposvnbarber('KanPosVN Barber Shop', Icons.cut, Color(0xFF475569)),
  kanposvntaphoasmmini('KanPosVN Tạp Hóa Mini', Icons.storefront, Color(0xFF14B8A6)),
  kanposvncrm('KanCRM', Icons.admin_panel_settings, Color(0xFFE11D48)),
  kanposvngym('KanGYM', Icons.fitness_center, Color(0xFF1E3A8A)),
  kanposvnparking('Kan Parking', Icons.local_parking, Color(0xFF0F766E)),
  kanposvnviec('KanViec', Icons.work, Color(0xFF6366F1)),
  kanposvnride('KanRide', Icons.hail, Color(0xFFFACC15)),
  kanposvneshop('KanShop', Icons.shopping_bag, Color(0xFFF97316)),
  kanposvnairbook('KanPosVN AirBook', Icons.flight_takeoff, Color(0xFF2563EB)),
  kanposvnvideocall('KanPosVN Video Call / Chat', Icons.videocam, Color(0xFFD946EF)),
  kanposvnhrpayroll('KanPosVN HR Payroll (Vận Tải)', Icons.badge, Color(0xFF0EA5E9)),
  kanposvnengpic('KanPosVN EngPic', Icons.image, Color(0xFF10B981)),
  kanposvnkanji('KanPosVN Kanji', Icons.language, Color(0xFF3B82F6)),
  kanposvnnemda('Chơi Nhau (Ném Đá)', Icons.sports_esports, Color(0xFF7C3AED));

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
      case AppModule.kanposvnpawn: return 'kanposvnpawn';
      case AppModule.kanposvnnhahangquanan: return 'kanposvnnhahangquanan';
      case AppModule.kanposvnnhatro200: return 'kanposvnnhatro200';
      case AppModule.kanposvnspa: return 'kanposvnspa';
      case AppModule.kanposvnbarber: return 'kanposvnbarber';
      case AppModule.kanposvntaphoasmmini: return 'kanposvntaphoasmmini';
      case AppModule.kanposvncrm: return 'kanposvncrm';
      case AppModule.kanposvngym: return 'kanposvngym';
      case AppModule.kanposvnparking: return 'kanposvnparking';
      case AppModule.kanposvnviec: return 'kanposvnviec';
      case AppModule.kanposvnride: return 'kanposvnride';
      case AppModule.kanposvneshop: return 'kanposvneshop';
      case AppModule.kanposvnairbook: return 'kanposvnairbook';
      case AppModule.kanposvnvideocall: return 'kanposvnvideocall';
      case AppModule.kanposvnhrpayroll: return 'kanposvnhrpayroll';
      case AppModule.kanposvnengpic: return 'kanposvnengpic';
      case AppModule.kanposvnkanji: return 'kanposvnkanji';
      case AppModule.kanposvnnemda: return 'kanposvnnemda';
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
      case AppModule.kanposvnpawn: return AppModuleType.kanposvnpawn;
      case AppModule.kanposvnnhahangquanan: return AppModuleType.kanposvnnhahangquanan;
      case AppModule.kanposvnnhatro200: return AppModuleType.kanposvnnhatro200;
      case AppModule.kanposvnspa: return AppModuleType.kanposvnspa;
      case AppModule.kanposvnbarber: return AppModuleType.kanposvnbarber;
      case AppModule.kanposvntaphoasmmini: return AppModuleType.kanposvntaphoasmmini;
      case AppModule.kanposvncrm: return AppModuleType.kanposvncrm;
      case AppModule.kanposvngym: return AppModuleType.kanposvngym;
      case AppModule.kanposvnparking: return AppModuleType.kanposvnparking;
      case AppModule.kanposvnviec: return AppModuleType.kanposvnviec;
      case AppModule.kanposvnride: return AppModuleType.kanposvnride;
      case AppModule.kanposvneshop: return AppModuleType.kanposvneshop;
      case AppModule.kanposvnairbook: return AppModuleType.kanposvnairbook;
      case AppModule.kanposvnvideocall: return AppModuleType.kanposvnvideocall;
      case AppModule.kanposvnhrpayroll: return AppModuleType.kanposvnhrpayroll;
      case AppModule.kanposvnengpic: return AppModuleType.kanposvnengpic;
      case AppModule.kanposvnkanji: return AppModuleType.kanposvnkanji;
      case AppModule.kanposvnnemda: return AppModuleType.kanposvnnemda;
    }
  }

  static List<AppModule> getByType(AppModuleType type) {
    return values.where((m) => m.moduleType == type).toList();
  }
}

enum AppModuleType {
  kanposvncafe('KanPosVN Cafe', Icons.local_cafe),
  kanposvnkhachsan('KanPosVN Khách Sạn', Icons.hotel),
  nhanSu('Nhân Sự', Icons.people),
  kanposvnvlxd('KanPosVN VLXD', Icons.architecture),
  kanposvngara('KanPosVN Gara', Icons.car_repair),
  kanposvnnhathuoc('KanPosVN Nhà Thuốc', Icons.medical_services),
  kanposvnbanvevantai('Vận Tải & Vé', Icons.directions_bus),
  kanposvnbida('Quản Lý Bida', Icons.sports_baseball),
  kanposvnpawn('Cầm Đồ', Icons.monetization_on),
  kanposvnspa('Quản Lý Spa & Dưỡng Sinh', Icons.spa),
  kanposvnbarber('Barber Shop', Icons.cut),
  kanposvnnhahangquanan('Nhà Hàng / Quán Ăn', Icons.restaurant),
  kanposvnqlcd('KanPosVN QLCD (Cắt Ghép & Vé)', Icons.content_cut),
  kanposvnnbatdongsan('KanPosVN Bất Động Sản', Icons.real_estate_agent),
  kanposvnnhatro200('KanPosVN Nhà Trọ', Icons.apartment),
  kanposvntaphoasmmini('KanPosVN Tạp Hóa Mini', Icons.storefront),
  kanposvncrm('KanCRM', Icons.admin_panel_settings),
  kanposvngym('KanGYM', Icons.fitness_center),
  kanposvnparking('Kan Parking', Icons.local_parking),
  kanposvnviec('KanViec', Icons.work),
  kanposvnride('KanRide', Icons.hail),
  kanposvneshop('KanShop', Icons.shopping_bag),
  kanposvnairbook('KanPosVN AirBook', Icons.flight_takeoff),
  kanposvnvideocall('KanPosVN Video Call / Chat', Icons.videocam),
  kanposvnhrpayroll('KanPosVN HR Payroll (Vận Tải)', Icons.badge),
  kanposvnengpic('KanPosVN EngPic', Icons.image),
  kanposvnkanji('KanPosVN Kanji', Icons.language),
  kanposvnnemda('Chơi Nhau (Ném Đá)', Icons.sports_esports);

  final String label;
  final IconData icon;
  const AppModuleType(this.label, this.icon);
}
