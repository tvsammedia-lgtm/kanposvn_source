import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentScreen extends ConsumerWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch hẹn'),
      ),
      body: const Center(
        child: Text('Quản lý lịch hẹn'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add new appointment
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
