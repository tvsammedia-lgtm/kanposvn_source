import 'package:flutter/material.dart';

import 'screens/giapha_dashboard_screen.dart';
import 'screens/persons_list_screen.dart';
import 'screens/family_tree_screen.dart';
import 'screens/events_list_screen.dart';
import 'screens/family_funds_screen.dart';

class GiaphaNavigation extends StatefulWidget {
  const GiaphaNavigation({Key? key}) : super(key: key);

  @override
  _GiaphaNavigationState createState() => _GiaphaNavigationState();
}

class _GiaphaNavigationState extends State<GiaphaNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const GiaphaDashboardScreen(),
    const PersonsListScreen(),
    const FamilyTreeScreen(),
    const EventsListScreen(),
    const FamilyFundsScreen(),
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
            icon: Icon(Icons.people),
            label: 'Thành viên',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree),
            label: 'Cây Gia phả',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Sự kiện',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Quỹ họ',
          ),
        ],
      ),
    );
  }
}
