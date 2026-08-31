/// Trạng thái đối chiếu — spec §6 / §55.
enum CompareStatus {
  matched('TRÙNG KHỢP'),
  numberDifferent('KHÁC SỐ'),
  textDifferent('KHÁC KÝ TỰ'),
  dateDifferent('KHÁC NGÀY'),
  missing('THIẾU'),
  extra('DƯ'),
  emptyDifferent('KHÁC DỮ LIỆU RỖNG'),
  multipleDifferent('KHÁC NHIỀU TRƯỜNG');

  final String label;
  const CompareStatus(this.label);

  int get code => index;

  static CompareStatus fromCode(int code) {
    if (code < 0 || code >= CompareStatus.values.length) {
      return CompareStatus.multipleDifferent;
    }
    return CompareStatus.values[code];
  }
}