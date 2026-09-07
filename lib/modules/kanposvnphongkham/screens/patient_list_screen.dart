import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/patient.dart';

class PatientListScreen extends ConsumerWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Connect to riverpod provider for patients
    final List<Patient> dummyPatients = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Bệnh nhân'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: dummyPatients.isEmpty
          ? const Center(child: Text('Chưa có bệnh nhân nào'))
          : ListView.builder(
              itemCount: dummyPatients.length,
              itemBuilder: (context, index) {
                final patient = dummyPatients[index];
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(patient.fullName ?? 'Unknown'),
                  subtitle: Text(patient.phone ?? ''),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Navigate to patient detail
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to create patient screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
