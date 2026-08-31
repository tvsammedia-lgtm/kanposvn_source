import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/doichieu_providers.dart';

class FilePickerCard extends ConsumerWidget {
  final int slotIndex;
  final String label;
  final IconData icon;
  final Color color;

  const FilePickerCard({
    super.key,
    required this.slotIndex,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(doichieuFlowProvider);
    final slot = state.slots[slotIndex];
    final busy = state.running;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Color(0xFFF1F5F9),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (slot == null)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: busy ? null : () => ref.read(doichieuFlowProvider.notifier).pickFile(slotIndex),
                  icon: const Icon(Icons.upload_file, size: 18),
                  label: const Text('Chọn file Excel/CSV'),
                ),
              )
            else ...[
              Row(
                children: [
                  const Icon(Icons.description_outlined, size: 18, color: Color(0xFF94A3B8)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      slot.name,
                      style: const TextStyle(
                        color: Color(0xFFF1F5F9),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: busy ? null : () => ref.read(doichieuFlowProvider.notifier).clearSlot(slotIndex),
                    tooltip: 'Bỏ file',
                    icon: const Icon(Icons.close, size: 18, color: Color(0xFF64748B)),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${slot.grid.length} dòng · header ${_fmtPath(slot.path)}',
                style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              if (slot.grid.length > 1)
                Row(
                  children: [
                    const Icon(Icons.table_rows_outlined, size: 18, color: Color(0xFF94A3B8)),
                    const SizedBox(width: 8),
                    const Text(
                      'Dòng tiêu đề:',
                      style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                    ),
                    const SizedBox(width: 8),
                    DropdownButton<int>(
                      value: slot.headerRow.clamp(0, slot.grid.length - 1),
                      style: const TextStyle(color: Color(0xFFF1F5F9), fontSize: 13),
                      dropdownColor: const Color(0xFF1E293B),
                      items: [
                        for (var r = 0; r < slot.grid.length && r < 60; r++)
                          DropdownMenuItem(
                            value: r,
                            child: Text('Dòng ${r + 1}', style: const TextStyle(fontSize: 13)),
                          ),
                      ],
                      onChanged: busy
                          ? null
                          : (v) {
                              if (v == null) return;
                              ref.read(doichieuFlowProvider.notifier).setHeaderRow(slotIndex, v);
                            },
                    ),
                  ],
                ),
            ],
          ],
        ),
      ),
    );
  }

  static String _fmtPath(String p) {
    if (p.length <= 40) return p;
    return '…${p.substring(p.length - 37)}';
  }
}