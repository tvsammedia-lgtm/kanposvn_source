import '../module_enum.dart';
import 'ai_assistant_models.dart';

final Map<AppModule, AiAssistantModuleData> kAiAssistantPart2 = {
  AppModule.kanposvnnbatdongsan: const AiAssistantModuleData(
    module: AppModule.kanposvnnbatdongsan,
    assistantName: 'Trợ lý Bất Động Sản',
    intro:
        'Chào bạn! Mình là trợ lý module Bất Động Sản. Mình giúp về quản lý dự '
        'án, giao dịch và khách hàng.',
    suggestions: [
      'Quản lý dự án bất động sản?',
      'Theo dõi giao dịch?',
      'Quản lý khách hàng?',
    ],
    topics: [
      AiAssistantTopic(
        ['du an', 'dự án', 'can ho', 'căn hộ', 'dat nen', 'đất nền'],
        'Quản lý danh sách dự án (căn hộ, đất nền...) với thông tin sản phẩm, '
            'giá bán và tiến độ. Mỗi sản phẩm có thể theo dõi trạng thái bán/giữ chỗ.',
      ),
      AiAssistantTopic(
        ['giao dich', 'giao dịch', 'hop dong', 'hợp đồng', 'thanh toan', 'thanh toán'],
        'Ghi nhận giao dịch và tiến độ thanh toán theo hợp đồng: đặt cọc, đợt '
            'thanh toán và bàn giao. Số liệu phản ánh lên báo cáo doanh thu.',
      ),
      AiAssistantTopic(
        ['khach', 'khách', 'khach hang', 'khách hàng', 'cham soc', 'chăm sóc'],
        'Quản lý hồ sơ khách hàng, nhu cầu và lịch sử giao dịch để chăm sóc và '
            'chốt đơn hiệu quả hơn.',
      ),
    ],
  ),

  AppModule.kanposvnbanvevantai: const AiAssistantModuleData(
    module: AppModule.kanposvnbanvevantai,
    assistantName: 'Trợ lý Vận Tải & Vé',
    intro:
        'Chào bạn! Mình là trợ lý module Vận Tải & Vé. Mình giúp về điều phối xe, '
        'vận chuyển, bán vé và kế toán.',
    suggestions: [
      'Cách điều phối xe?',
      'Quản lý chuyến vận tải?',
      'Bán vé như thế nào?',
    ],
    topics: [
      AiAssistantTopic(
        ['dieu phoi', 'điều phối', 'xe', 'lai xe', 'tài xế', 'tuyen', 'tuyến'],
        'Tab "Điều phối" phân xe và tài xế theo tuyến/lịch trình. Gán xe hợp lý '
            'giúp tối ưu chi phí vận hành và đảm bảo giờ khởi hành.',
      ),
      AiAssistantTopic(
        ['chuyen', 'chuyến', 'van chuyen', 'vận chuyển', 'hang hoa', 'hàng hóa', 'ship'],
        'Quản lý chuyến vận chuyển: khối lượng hàng, điểm giao nhận và trạng '
            'thái chuyến. Theo dõi từ lúc nhận hàng đến khi giao hoàn tất.',
      ),
      AiAssistantTopic(
        ['ve', 'vé', 'ban ve', 'bán vé', 'khach', 'khách', 'chuyen di', 'chuyến đi'],
        'Bán vé cho hành khách theo tuyến và giờ khởi hành. Vé đã bán được quản '
            'lý tập trung, hỗ trợ tra cứu và thống kê doanh thu.',
      ),
      AiAssistantTopic(
        ['ke toan', 'kế toán', 'thu chi', 'tai chinh', 'tài chính', 'bao cao'],
        'Tab "Kế toán" ghi nhận thu chi, doanh thu vé/vận chuyển và chi phí '
            'nhiên liệu, bảo dưỡng để tính lợi nhuận theo tuyến.',
      ),
    ],
  ),

  AppModule.kanposvnbida: const AiAssistantModuleData(
    module: AppModule.kanposvnbida,
    assistantName: 'Trợ lý Quản Lý Bida',
    intro:
        'Chào bạn! Mình là trợ lý module Quản Lý Bida. Mình giúp về quản lý bàn, '
        'tính giờ chơi, bán hàng và báo cáo doanh thu.',
    suggestions: [
      'Cách quản lý bàn bida?',
      'Tính giờ chơi thế nào?',
      'Xem doanh thu bàn?',
    ],
    topics: [
      AiAssistantTopic(
        ['ban', 'bàn', 'bida', 'gio choi', 'giờ chơi', 'mo ban', 'mở bàn'],
        'Quản lý danh sách bàn bida và trạng thái trống/bận. Khi khách chơi, mở '
            'bàn và hệ thống tự động tính tiền theo giờ.',
      ),
      AiAssistantTopic(
        ['tinh gio', 'tính giờ', 'thanh toan', 'thanh toán', 'dong ban', 'đóng bàn'],
        'Khi khách kết thúc, đóng bàn để hệ thống tính tiền theo thời gian chơi '
            'và phụ thu dịch vụ. Thông báo rõ số giờ và thành tiền trước khi thu.',
      ),
      AiAssistantTopic(
        ['ban hang', 'bán hàng', 'nuoc', 'nước', 'do an', 'đồ ăn', 'pos'],
        'Bán nước uống, đồ ăn kèm trong lúc khách chơi. Hàng hóa được quản lý '
            'kho và cộng vào hóa đơn khi khách thanh toán.',
      ),
      AiAssistantTopic(
        ['doanh thu', 'bao cao', 'báo cáo', 'thong ke', 'thống kê', 'dashboard'],
        'Báo cáo doanh thu theo bàn, theo ngày và theo dịch vụ để nắm hiệu quả '
            'kinh doanh từng khu vực.',
      ),
    ],
  ),

  AppModule.kanposvnnhahangquanan: const AiAssistantModuleData(
    module: AppModule.kanposvnnhahangquanan,
    assistantName: 'Trợ lý Nhà Hàng / Quán Ăn',
    intro:
        'Chào bạn! Mình là trợ lý module Nhà Hàng / Quán Ăn. Mình giúp về gọi món, '
        'bàn, kho, nhập hàng và báo cáo doanh thu.',
    suggestions: [
      'Cách gọi món cho bàn?',
      'Quản lý menu món ăn?',
      'Xem doanh thu quán?',
    ],
    topics: [
      AiAssistantTopic(
        ['goi mon', 'gọi món', 'ban', 'bàn', 'pos', 'thanh toan', 'thanh toán'],
        'Chọn bàn và gọi món từ menu, món ăn chuyển về bếp. Khi khách thanh '
            'toán, hệ thống tính tiền theo hóa đơn của bàn.',
      ),
      AiAssistantTopic(
        ['menu', 'mon an', 'món ăn', 'thuc don', 'thực đơn', 'recipe', 'công thức'],
        'Quản lý menu, giá món và công thức nguyên liệu. Cập nhật giá/nguyên '
            'liệu để tính giá vốn và lợi nhuận từng món.',
      ),
      AiAssistantTopic(
        ['kho', 'ton kho', 'tồn kho', 'nguyen lieu', 'nguyên liệu', 'nhap hang'],
        'Tab "Kho" theo dõi tồn nguyên liệu; "Nhập hàng" tạo phiếu nhập từ nhà '
            'cung cấp. Khi bán món, nguyên liệu theo công thức được trừ tự động.',
      ),
      AiAssistantTopic(
        ['doanh thu', 'bao cao', 'báo cáo', 'thong ke', 'thống kê', 'dashboard'],
        'Báo cáo doanh thu theo ngày, theo bàn và theo món ăn giúp bạn biết món '
            'nào bán chạy và giờ cao điểm.',
      ),
    ],
  ),

  AppModule.kanposvnnhatro200: const AiAssistantModuleData(
    module: AppModule.kanposvnnhatro200,
    assistantName: 'Trợ lý Nhà Trọ',
    intro:
        'Chào bạn! Mình là trợ lý module Nhà Trọ. Mình giúp về quản lý phòng trọ, '
        'hợp đồng, thu tiền phòng và công nợ.',
    suggestions: [
      'Quản lý phòng trọ?',
      'Thu tiền phòng thế nào?',
      'Theo dõi công nợ khách?',
    ],
    topics: [
      AiAssistantTopic(
        ['phong', 'phòng', 'tro', 'trọ', 'phong trong', 'phòng trống', 'tinh trang'],
        'Quản lý danh sách phòng trọ và trạng thái trống/đã thuê, kèm thông tin '
            'điện nước, giá phòng từng phòng.',
      ),
      AiAssistantTopic(
        ['hop dong', 'hợp đồng', 'khach', 'khách', 'thue', 'thuê', 'nhan phong'],
        'Tạo hợp đồng thuê cho từng phòng: tên khách, thời gian thuê và giá. '
            'Khi khách trả phòng, hợp đồng được đóng lại và cập nhật trạng thái.',
      ),
      AiAssistantTopic(
        ['thu tien', 'thu tiền', 'tien phong', 'tiền phòng', 'dien nuoc', 'điện nước'],
        'Lập phiếu thu tiền phòng theo kỳ, bao gồm tiền phòng và chi phí điện '
            'nước. Ghi nhận ngay để cập nhật công nợ của khách.',
      ),
      AiAssistantTopic(
        ['cong no', 'công nợ', 'no', 'nợ', 'bao cao', 'báo cáo'],
        'Theo dõi công nợ từng khách trọ và tổng hợp báo cáo thu/chi, tỉ lệ '
            'phòng trống để quản lý hiệu quả nhà trọ.',
      ),
    ],
  ),

  AppModule.kanposvnspa: const AiAssistantModuleData(
    module: AppModule.kanposvnspa,
    assistantName: 'Trợ lý Spa & Dưỡng Sinh',
    intro:
        'Chào bạn! Mình là trợ lý module Spa & Dưỡng Sinh. Mình giúp về giường, '
        'lịch dịch vụ, khách hàng và kho dược liệu.',
    suggestions: [
      'Quản lý giường/spa?',
      'Đặt lịch dịch vụ?',
      'Quản lý kho dược liệu?',
    ],
    topics: [
      AiAssistantTopic(
        ['giuong', 'giường', 'spa', 'phong', 'phòng', 'le tan', 'lễ tân'],
        'Quản lý giường/phòng spa và trạng thái trống/bận. Sắp xếp khách vào '
            'giường phù hợp theo dịch vụ và kỹ thuật viên.',
      ),
      AiAssistantTopic(
        ['dich vu', 'dịch vụ', 'lich hen', 'lịch hẹn', 'khach', 'khách', 'kỹ thuật viên'],
        'Đặt lịch dịch vụ cho khách: chọn dịch vụ, giường và kỹ thuật viên. '
            'Lịch hẹn được theo dõi để tránh trùng giờ.',
      ),
      AiAssistantTopic(
        ['kho', 'duoc lieu', 'dược liệu', 'ton kho', 'tồn kho', 'nguyen lieu'],
        'Kho dược liệu/mỹ phẩm theo dõi tồn kho và nhập xuất. Khi dùng dịch vụ, '
            'vật tư sử dụng được trừ vào tồn tương ứng.',
      ),
      AiAssistantTopic(
        ['doanh thu', 'bao cao', 'báo cáo', 'thong ke', 'thống kê', 'khach hang'],
        'Báo cáo doanh thu theo dịch vụ, theo kỹ thuật viên và danh sách khách '
            'quen để chăm sóc và khuyến mãi hiệu quả.',
      ),
    ],
  ),

  AppModule.kanposvntaphoasmmini: const AiAssistantModuleData(
    module: AppModule.kanposvntaphoasmmini,
    assistantName: 'Trợ lý Tạp Hóa Mini',
    intro:
        'Chào bạn! Mình là trợ lý module Tạp Hóa Mini. Mình giúp về bán hàng, kho, '
        'nhà cung cấp, công nợ và báo cáo.',
    suggestions: [
      'Cách bán hàng tạp hóa?',
      'Quản lý kho hàng?',
      'Theo dõi công nợ?',
    ],
    topics: [
      AiAssistantTopic(
        ['ban hang', 'bán hàng', 'pos', 'thanh toan', 'thanh toán', 'hoa don'],
        'Tab "Bán hàng" (POS) bán lẻ nhanh: quét mã/đếm hàng, tính tiền và in '
            'hóa đơn. Hỗ trợ trả giá và nhiều phương thức thanh toán.',
      ),
      AiAssistantTopic(
        ['kho', 'ton kho', 'tồn kho', 'hang hoa', 'hàng hóa', 'nhap hang'],
        'Tab "Kho" quản lý danh mục hàng hóa và tồn kho; "Nhập hàng" tạo phiếu '
            'nhập từ nhà cung cấp. Hàng bán ra tự động trừ tồn.',
      ),
      AiAssistantTopic(
        ['cong no', 'công nợ', 'no', 'nợ', 'khach no', 'khách nợ', 'nha cung cap'],
        'Theo dõi công nợ khách mua chịu và nợ nhà cung cấp. Ghi nhận thu/chi '
            'để đối chiếu thanh toán từng bên.',
      ),
      AiAssistantTopic(
        ['doanh thu', 'bao cao', 'báo cáo', 'thong ke', 'thống kê', 'dashboard'],
        'Báo cáo doanh thu theo ngày/tháng, hàng bán chạy và lợi nhuận theo mặt '
            'hàng giúp nhập hàng đúng nhu cầu.',
      ),
    ],
  ),
};
