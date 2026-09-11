import 'package:flutter/material.dart';

import 'screens/tax_dashboard_screen.dart';
import 'screens/tax_expenses_screen.dart';
import 'screens/tax_reconciliation_screen.dart';
import 'screens/tax_declarations_screen.dart';
import 'screens/tax_einvoice_screen.dart';

class TaxNavigation extends StatefulWidget {
  const TaxNavigation({Key? key}) : super(key: key);

  @override
  _TaxNavigationState createState() => _TaxNavigationState();
}

class _TaxNavigationState extends State<TaxNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const TaxDashboardScreen(),
    const TaxDeclarationsScreen(),
    const TaxExpensesScreen(),
    const TaxEInvoiceScreen(),
    const TaxReconciliationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Tổng quan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Tờ khai',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Chi phí',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'HĐĐT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: 'Đối chiếu',
          ),
        ],
      ),
    );
  }
}
