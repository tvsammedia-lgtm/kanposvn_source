import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/phongkham_provider.dart';
import '../services/ai_service.dart';
import 'prescription_screen.dart';

class EncounterScreen extends ConsumerStatefulWidget {
  const EncounterScreen({super.key});

  @override
  ConsumerState<EncounterScreen> createState() => _EncounterScreenState();
}

class _EncounterScreenState extends ConsumerState<EncounterScreen> {
  final _symptomsController = TextEditingController();
  final _diagnosisController = TextEditingController();
  bool _isGeneratingDraft = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khám Bệnh (Encounter)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // TODO: Xem lịch sử khám
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Sinh hiệu (Vitals)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Huyết áp: 120/80'),
                Text('Mạch: 75'),
                Text('Nhiệt độ: 37°C'),
              ],
            ),
            const Divider(height: 32),
            TextField(
              controller: _symptomsController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Triệu chứng & Bệnh sử',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _diagnosisController,
              decoration: const InputDecoration(
                labelText: 'Chẩn đoán sơ bộ (ICD-10)',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: _isGeneratingDraft ? null : _generateAIPrescription,
              icon: _isGeneratingDraft 
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.auto_awesome),
              label: const Text('AI: Gợi ý Đơn Thuốc (Auto Draft)'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.purple.shade100,
                foregroundColor: Colors.purple.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _generateAIPrescription() async {
    setState(() => _isGeneratingDraft = true);
    
    try {
      final aiService = ref.read(aiServiceProvider);
      final draft = await aiService.generatePrescriptionDraft(
        _symptomsController.text,
        _diagnosisController.text,
      );
      
      // Save draft to provider
      ref.read(currentPrescriptionProvider.notifier).state = draft;

      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const PrescriptionScreen()),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isGeneratingDraft = false);
      }
    }
  }
}
