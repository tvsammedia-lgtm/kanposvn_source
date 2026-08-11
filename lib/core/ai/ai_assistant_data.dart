import '../module_enum.dart';
import 'ai_assistant_models.dart';
import 'ai_assistant_data_part1.dart';
import 'ai_assistant_data_part2.dart';
import 'ai_assistant_data_part3.dart';

/// Trợ lý mặc định cho module chưa có dữ liệu nghiệp vụ riêng.
const AiAssistantModuleData kFallbackAssistantData = AiAssistantModuleData(
  module: AppModule.kanposvncafe,
  assistantName: 'Trợ lý KanPosVN',
  intro:
      'Chào bạn! Mình là trợ lý KanPosVN. Hỏi mình về cách sử dụng module, '
      'bán hàng, kho, thu chi, báo cáo và đồng bộ dữ liệu nhé.',
  suggestions: [
    'Cách bán hàng?',
    'Quản lý kho thế nào?',
    'Đồng bộ dữ liệu?',
  ],
  topics: [
    AiAssistantTopic(
      ['ban hang', 'bán hàng', 'pos', 'hoa don', 'hóa đơn', 'goi mon'],
      'Mở tab "Bán hàng" (POS) để bán tại quầy: chọn mặt hàng, thêm vào đơn và '
          'thanh toán ngay tại màn hình. Hóa đơn sau khi lưu có thể tra cứu lại.',
    ),
    AiAssistantTopic(
      ['kho', 'ton kho', 'tồn kho', 'nhap kho', 'nhập kho', 'hang hoa'],
      'Tab "Kho" quản lý danh mục hàng hóa và tồn kho. Mọi phiếu nhập/xuất đều '
          'cập nhật ngay tồn kho; bạn cũng có thể xem cảnh báo hàng sắp hết.',
    ),
    AiAssistantTopic(
      ['thu chi', 'tai chinh', 'tài chính', 'ke toan', 'kế toán', 'cong no'],
      'Tab "Thu Chi" ghi nhận các khoản thu/chi và theo dõi công nợ khách hàng '
          'và nhà cung cấp. Số liệu phản ánh lên Dashboard và báo cáo.',
    ),
    AiAssistantTopic(
      ['bao cao', 'báo cáo', 'thong ke', 'thống kê', 'doanh thu', 'dashboard'],
      'Tab "Báo cáo"/Dashboard tổng hợp doanh thu, lợi nhuận và báo cáo chi tiết '
          'theo ngày/tháng, giúp bạn kiểm soát hoạt động kinh doanh.',
    ),
    AiAssistantTopic(
      ['dong bo', 'đồng bộ', 'neon', 'sync', 'cloud', 'sao luu', 'sao lưu'],
      'Bấm icon đồng bộ hoặc mở tab "Đồng bộ" để đẩy dữ liệu cục bộ lên Cloud '
          '(Neon). Dữ liệu vẫn hoạt động offline qua Isar và tự đồng bộ khi có mạng.',
    ),
  ],
);

/// Toàn bộ dữ liệu trợ lý cho các module đã có nội dung nghiệp vụ.
final Map<AppModule, AiAssistantModuleData> kAiAssistantData = {
  ...kAiAssistantPart1,
  ...kAiAssistantPart2,
  ...kAiAssistantPart3,
};

/// Lấy dữ liệu trợ lý cho module; trả về fallback nếu module chưa có.
AiAssistantModuleData assistantDataFor(AppModule module) =>
    kAiAssistantData[module] ?? kFallbackAssistantData;
