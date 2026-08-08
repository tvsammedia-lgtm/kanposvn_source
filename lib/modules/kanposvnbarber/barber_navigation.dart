import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/customer_list_screen.dart';
import 'screens/appointment_list_screen.dart';
import 'screens/pos_screen.dart';
import 'screens/ai_advisor_screen.dart';
import 'screens/report_screen.dart';
import 'screens/inventory_screen.dart';
import 'screens/booking_calendar_screen.dart';

class BarberNavigation {
  static const String dashboardRoute = '/barber/dashboard';
  static const String customerRoute = '/barber/customers';
  static const String appointmentRoute = '/barber/appointments';
  static const String posRoute = '/barber/pos';
  static const String aiAdvisorRoute = '/barber/ai_advisor';
  static const String reportRoute = '/barber/reports';
  static const String inventoryRoute = '/barber/inventory';
  static const String bookingCalendarRoute = '/barber/booking_calendar';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboardRoute:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case customerRoute:
        return MaterialPageRoute(builder: (_) => const CustomerListScreen());
      case appointmentRoute:
        return MaterialPageRoute(builder: (_) => const AppointmentListScreen());
      case posRoute:
        return MaterialPageRoute(builder: (_) => const PosScreen());
      case aiAdvisorRoute:
        return MaterialPageRoute(builder: (_) => const AiAdvisorScreen());
      case reportRoute:
        return MaterialPageRoute(builder: (_) => const ReportScreen());
      case inventoryRoute:
        return MaterialPageRoute(builder: (_) => const InventoryScreen());
      case bookingCalendarRoute:
        return MaterialPageRoute(builder: (_) => const BookingCalendarScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
