import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../printer/printer_models.dart';
import '../printer/printer_service.dart';

class PrinterSettingsScreen extends ConsumerStatefulWidget {
  const PrinterSettingsScreen({super.key});

  @override
  ConsumerState<PrinterSettingsScreen> createState() =>
      _PrinterSettingsScreenState();
}

class _PrinterSettingsScreenState
    extends ConsumerState<PrinterSettingsScreen> {
  bool _testing = false;
  bool _discovering = false;
  List<PrinterDevice> _devices = [];
  final _ipController = TextEditingController();
  final _portController = TextEditingController(text: '9100');

  @override
  void initState() {
    super.initState();
    final s = ref.read(printerSettingsProvider).settings;
    _ipController.text = s.address;
    _portController.text = s.port.toString();
  }

  @override
  void dispose() {
    _ipController.dispose();
    _portController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final store = ref.read(printerSettingsProvider);
    final current = store.settings;
    final address =
        current.type == PrinterType.wifi ? _ipController.text.trim() : current.address;
    final port = int.tryParse(_portController.text.trim()) ?? 9100;
    final updated = current.copyWith(address: address, port: port);
    await store.update(updated);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã lưu cấu hình máy in')),
    );
    setState(() {});
  }

  Future<void> _test() async {
    setState(() => _testing = true);
    await _save();
    final result = await ref.read(printerServiceProvider).testPrint();
    if (!mounted) return;
    setState(() => _testing = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result.success
            ? (result.message ?? 'In thử thành công')
            : 'In thử thất bại: ${result.error}'),
        backgroundColor:
            result.success ? Colors.green.shade700 : Colors.red.shade700,
      ),
    );
  }

  Future<void> _discover() async {
    final store = ref.read(printerSettingsProvider);
    setState(() {
      _discovering = true;
      _devices = [];
    });
    final devices =
        await ref.read(printerServiceProvider).discoverDevices(store.settings.type);
    if (!mounted) return;
    setState(() {
      _discovering = false;
      _devices = devices;
    });
  }

  void _selectDevice(PrinterDevice device) async {
    final store = ref.read(printerSettingsProvider);
    await store.update(store.settings.copyWith(
      address: device.address,
      name: device.displayName,
    ));
    if (!mounted) return;
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đã chọn máy in: ${device.displayName}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(printerSettingsProvider);
    final s = store.settings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt Máy in'),
        backgroundColor: AppColors.sidebarBg,
        foregroundColor: AppColors.textLight,
      ),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _section(
            'Loại máy in',
            child: Column(
              children: [
                _radio(
                  value: PrinterType.wifi,
                  group: s.type,
                  label: 'Wi-Fi/LAN (IP)',
                  desc: 'Khuyên dùng: máy in nối mạng LAN/Wi-Fi, port 9100',
                  onChanged: (v) => _setType(v),
                ),
                _radio(
                  value: PrinterType.bluetooth,
                  group: s.type,
                  label: 'Bluetooth',
                  desc: 'Chỉ hỗ trợ trên Android',
                  onChanged: (v) => _setType(v),
                ),
                _radio(
                  value: PrinterType.usb,
                  group: s.type,
                  label: 'USB',
                  desc: 'Chỉ hỗ trợ trên Android (USB-OTG)',
                  onChanged: (v) => _setType(v),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _section(
            'Khổ giấy',
            child: Column(
              children: [
                for (final paper in PaperSizeOption.values)
                  RadioListTile<String>(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    activeColor: AppColors.primary,
                    title: Text(paper.label),
                    value: paper.value,
                    groupValue: s.paper.value,
                    onChanged: (v) => store.update(
                        s.copyWith(paper: PaperSizeOption.fromValue(v))),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _section(
            'Mã tiếng Việt',
            child: Column(
              children: [
                _radio(
                  value: TextEncodingMode.cp1258,
                  group: s.encoding,
                  label: 'CP1258 (có dấu)',
                  desc: 'Đa số máy in hỗ trợ',
                  onChanged: (v) => store.update(s.copyWith(encoding: v)),
                ),
                _radio(
                  value: TextEncodingMode.ascii,
                  group: s.encoding,
                  label: 'Không dấu (ASCII)',
                  desc: 'Dùng khi máy in lỗi font tiếng Việt',
                  onChanged: (v) => store.update(s.copyWith(encoding: v)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _section(
            'Máy in',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (s.type == PrinterType.wifi) ...[
                  TextField(
                    controller: _ipController,
                    decoration: const InputDecoration(
                      labelText: 'Địa chỉ IP máy in',
                      hintText: 'VD: 192.168.1.100',
                      prefixIcon: Icon(Icons.router_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _portController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Cổng',
                      hintText: '9100',
                      prefixIcon: Icon(Icons.numbers),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Nhập IP máy in, nhấn "In thử" để kiểm tra.',
                      style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
                ] else if (s.type == PrinterType.bluetooth ||
                    s.type == PrinterType.usb) ...[
                  if (!kIsWeb &&
                      defaultTargetPlatform == TargetPlatform.android) ...[
                    OutlinedButton.icon(
                      onPressed: _discovering ? null : _discover,
                      icon: _discovering
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.bluetooth_searching),
                      label: Text(_discovering
                          ? 'Đang quét...'
                          : 'Quét máy in ${s.type == PrinterType.bluetooth ? 'Bluetooth' : 'USB'}'),
                    ),
                    const SizedBox(height: 8),
                    if (_devices.isNotEmpty)
                      ..._devices.map((d) => ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.print_outlined),
                            title: Text(d.displayName),
                            subtitle: Text(d.address),
                            trailing: s.address == d.address
                                ? const Icon(Icons.check_circle,
                                    color: Colors.green)
                                : null,
                            onTap: () => _selectDevice(d),
                          ))
                    else
                      const Text(
                        'Chưa quét được máy in nào. Kiểm tra đã bật Bluetooth/ghép đôi hoặc cắm USB.',
                        style: TextStyle(fontSize: 12, color: AppColors.textMuted),
                      ),
                  ] else
                    const Text(
                      'Chưa hỗ trợ trên nền tảng này. Trên Windows hãy dùng Wi-Fi/LAN hoặc In PDF.',
                      style: TextStyle(fontSize: 12, color: AppColors.textMuted),
                    ),
                ],
                if (s.name.isNotEmpty && s.address.isNotEmpty)
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.print, color: Colors.green),
                    title: Text(s.name),
                    subtitle: Text('${s.address} · ${s.paper.label}'),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _save,
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('Lưu cấu hình'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _testing ? null : _test,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  icon: _testing
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.print_outlined),
                  label: Text(_testing ? 'Đang in...' : 'In thử bill'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _setType(PrinterType? type) {
    if (type == null) return;
    final store = ref.read(printerSettingsProvider);
    final current = store.settings;
    store.update(current.copyWith(type: type));
  }

  Widget _section(String title, {required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary)),
        const SizedBox(height: 8),
        Card(child: Padding(padding: const EdgeInsets.all(12), child: child)),
      ],
    );
  }

  Widget _radio<T>({
    required T value,
    required T group,
    required String label,
    required String desc,
    required ValueChanged<T?> onChanged,
  }) {
    return RadioListTile<T>(
      dense: true,
      contentPadding: EdgeInsets.zero,
      activeColor: AppColors.primary,
      title: Text(label),
      subtitle: Text(desc, style: const TextStyle(fontSize: 11)),
      value: value,
      groupValue: group,
      onChanged: onChanged,
    );
  }
}
