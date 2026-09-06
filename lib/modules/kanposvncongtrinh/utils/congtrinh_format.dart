const Map<String, String> congTrinhGradeLabels = {
  'GRADE_1': 'Cấp 1',
  'GRADE_2': 'Cấp 2',
  'GRADE_3': 'Cấp 3',
  'GRADE_4': 'Cấp 4',
};

const Map<String, String> congTrinhFinishLabels = {
  'THO': 'Thô',
  'CO_BAN': 'Cơ bản',
  'KHA': 'Khá',
  'CAO_CAP': 'Cao cấp',
};

const Map<String, String> congTrinhFoundationLabels = {
  'MONG_DON': 'Móng đơn',
  'MONG_BANG': 'Móng băng',
  'MONG_COC': 'Móng cọc',
};

const Map<String, String> congTrinhStructureLabels = {
  'BTCT': 'Bê tông cốt thép',
  'THEP': 'Khung thép',
  'GO': 'Khung gỗ',
};

String ctMoney(num v) {
  final s = v.round().toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.');
  return '$s đ';
}

String ctMoneyCompact(num v) {
  if (v.abs() >= 1000000000) {
    return '${(v / 1000000000).toStringAsFixed(2)} tỷ';
  }
  if (v.abs() >= 1000000) {
    return '${(v / 1000000).toStringAsFixed(1)} tr';
  }
  return '${v.round()} đ';
}

String ctNumber(num v) {
  final s = v.toStringAsFixed(3).replaceAll(RegExp(r'\.?0+$'), '');
  return s;
}

String ctDate(DateTime? t) {
  if (t == null) return '-';
  return '${t.day}/${t.month}/${t.year}';
}

String gradeLabel(String g) => congTrinhGradeLabels[g] ?? g;
String finishLabel(String f) => congTrinhFinishLabels[f] ?? f;