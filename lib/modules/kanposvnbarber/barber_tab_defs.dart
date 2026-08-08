import 'package:flutter/material.dart';

class BarberTabDefs {
  static const List<Map<String, dynamic>> tabs = [
    {
      'id': 'dashboard',
      'title': 'Dashboard',
      'icon': Icons.dashboard,
      'route': '/barber/dashboard'
    },
    {
      'id': 'pos',
      'title': 'Bán hàng (POS)',
      'icon': Icons.point_of_sale,
      'route': '/barber/pos'
    },
    {
      'id': 'booking_calendar',
      'title': 'Xếp lịch',
      'icon': Icons.edit_calendar,
      'route': '/barber/booking_calendar'
    },
    {
      'id': 'appointments',
      'title': 'Lịch hẹn',
      'icon': Icons.calendar_today,
      'route': '/barber/appointments'
    },
    {
      'id': 'customers',
      'title': 'Khách hàng',
      'icon': Icons.people,
      'route': '/barber/customers'
    },
    {
      'id': 'ai_advisor',
      'title': 'AI Tư vấn',
      'icon': Icons.face,
      'route': '/barber/ai_advisor'
    },
    {
      'id': 'inventory',
      'title': 'Kho Hàng',
      'icon': Icons.inventory,
      'route': '/barber/inventory'
    },
    {
      'id': 'reports',
      'title': 'Báo cáo',
      'icon': Icons.bar_chart,
      'route': '/barber/reports'
    }
  ];
}
