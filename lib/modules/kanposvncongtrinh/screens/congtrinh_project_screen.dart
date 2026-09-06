import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/congtrinh_providers.dart';
import '../models/project.dart';
import 'package:uuid/uuid.dart';

class CongTrinhProjectScreen extends ConsumerWidget {
  const CongTrinhProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(congTrinhProjectsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Công Trình'),
      ),
      body: projects.isEmpty
          ? const Center(child: Text('Chưa có công trình nào.'))
          : ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return ListTile(
                  leading: const Icon(Icons.business),
                  title: Text(project.projectName),
                  subtitle: Text('${project.constructionArea}m2 - ${project.numberOfFloors} tầng'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to Project details / Estimate Wizard
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Mock creating a new project
          final newProject = CongTrinhProject()
            ..projectId = const Uuid().v4()
            ..projectCode = 'CT-${DateTime.now().millisecondsSinceEpoch}'
            ..projectName = 'Nhà phố anh A'
            ..customerName = 'Nguyễn Văn A'
            ..constructionArea = 100
            ..numberOfFloors = 3
            ..buildingGrade = 'GRADE_3'
            ..finishLevel = 'KHA';
            
          ref.read(congTrinhProjectsProvider.notifier).saveProject(newProject);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
