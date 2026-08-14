import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/appointment_provider.dart';

class AppointmentListScreen extends ConsumerWidget {
  const AppointmentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointmentState = ref.watch(appointmentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch hẹn'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Mở form đặt lịch mới
            },
          )
        ],
      ),
      body: appointmentState.when(
        data: (appointments) {
          if (appointments.isEmpty) {
            return const Center(child: Text('Chưa có lịch hẹn nào.'));
          }
          return ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final apt = appointments[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.calendar_month, color: Colors.blue),
                  title: Text('${apt.customerName} - ${apt.appointmentTime}'),
                  subtitle: Text('Thợ: ${apt.employeeName} - Trạng thái: ${apt.status}'),
                  onTap: () {
                    // TODO: Chi tiết lịch hẹn
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}
