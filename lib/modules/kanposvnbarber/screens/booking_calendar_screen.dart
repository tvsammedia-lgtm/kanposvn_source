import 'package:flutter/material.dart';

class BookingCalendarScreen extends StatefulWidget {
  const BookingCalendarScreen({Key? key}) : super(key: key);

  @override
  State<BookingCalendarScreen> createState() => _BookingCalendarScreenState();
}

class _BookingCalendarScreenState extends State<BookingCalendarScreen> {
  DateTime _selectedDate = DateTime.now();

  // Dữ liệu giả lập lịch làm việc của 2 thợ trong 1 ngày
  final List<Map<String, dynamic>> _mockSchedule = [
    {'time': '08:00', 'barber1': 'Trống', 'barber2': 'Trống'},
    {'time': '09:00', 'barber1': 'Booked (Anh Tuấn)', 'barber2': 'Trống'},
    {'time': '10:00', 'barber1': 'Booked (Anh Tuấn)', 'barber2': 'Booked (Anh Quân)'},
    {'time': '11:00', 'barber1': 'Trống', 'barber2': 'Booked (Chị Lan)'},
    {'time': '13:00', 'barber1': 'Nghỉ trưa', 'barber2': 'Nghỉ trưa'},
    {'time': '14:00', 'barber1': 'Trống', 'barber2': 'Trống'},
    {'time': '15:00', 'barber1': 'Trống', 'barber2': 'Booked (Anh Huy)'},
    {'time': '16:00', 'barber1': 'Booked (Anh Hùng)', 'barber2': 'Trống'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch hẹn (Calendar)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.today),
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: _selectedDate,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (picked != null && picked != _selectedDate) {
                setState(() {
                  _selectedDate = picked;
                });
              }
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            width: double.infinity,
            child: Text(
              'Lịch ngày: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Giờ', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Thợ: Tuấn', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Thợ: Hùng', style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: _mockSchedule.map((slot) {
                    return DataRow(
                      cells: [
                        DataCell(Text(slot['time'])),
                        DataCell(_buildSlotCell(slot['barber1'])),
                        DataCell(_buildSlotCell(slot['barber2'])),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSlotCell(String status) {
    Color bgColor = Colors.white;
    Color textColor = Colors.black;

    if (status.contains('Booked')) {
      bgColor = Colors.blue.shade100;
      textColor = Colors.blue.shade900;
    } else if (status.contains('Nghỉ')) {
      bgColor = Colors.grey.shade300;
      textColor = Colors.grey.shade800;
    } else {
      bgColor = Colors.green.shade50;
      textColor = Colors.green.shade700;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(status, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
    );
  }
}
