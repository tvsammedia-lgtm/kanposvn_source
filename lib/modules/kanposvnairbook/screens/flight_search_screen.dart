import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/flight_provider.dart';
import 'flight_list_screen.dart';

class FlightSearchScreen extends ConsumerStatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  ConsumerState<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends ConsumerState<FlightSearchScreen> {
  String _origin = 'HAN'; // Hà Nội
  String _dest = 'SGN';   // Hồ Chí Minh
  DateTime _date = DateTime.now().add(const Duration(days: 1));

  void _search() {
    ref.read(flightSearchProvider.notifier).searchFlights(_origin, _dest, _date);
    Navigator.push(context, MaterialPageRoute(builder: (_) => const FlightListScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KanAirBook - Đặt vé máy bay'),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.blue.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('TÌM KIẾM CHUYẾN BAY', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _origin,
                          decoration: const InputDecoration(labelText: 'Điểm đi', border: OutlineInputBorder(), prefixIcon: Icon(Icons.flight_takeoff)),
                          items: ['HAN', 'SGN', 'DAD', 'PQC'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (val) => setState(() => _origin = val!),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _dest,
                          decoration: const InputDecoration(labelText: 'Điểm đến', border: OutlineInputBorder(), prefixIcon: Icon(Icons.flight_land)),
                          items: ['HAN', 'SGN', 'DAD', 'PQC'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (val) => setState(() => _dest = val!),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _date,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (picked != null) setState(() => _date = picked);
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(labelText: 'Ngày đi', border: OutlineInputBorder(), prefixIcon: Icon(Icons.calendar_today)),
                      child: Text(DateFormat('dd/MM/yyyy').format(_date), style: const TextStyle(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _origin == _dest ? null : _search,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                      child: const Text('TÌM CHUYẾN BAY', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
