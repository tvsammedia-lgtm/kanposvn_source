import '../module_enum.dart';
import 'ai_assistant_models.dart';

final Map<AppModule, AiAssistantModuleData> kAiAssistantPart3 = {
  AppModule.kanposvncrm: const AiAssistantModuleData(
    module: AppModule.kanposvncrm,
    assistantName: 'Trợ lý KanCRM',
    intro:
        'Chào bạn! Mình là trợ lý KanCRM. Mình giúp về quản lý khách hàng, '
        'sản phẩm, bán hàng và báo cáo CRM.',
    suggestions: [
      'Cách thêm khách hàng?',
      'Tạo đơn bán hàng?',
      'Xem báo cáo doanh số?',
    ],
    topics: [
      AiAssistantTopic(
        ['khach', 'khách', 'khach hang', 'khách hàng', 'them khach', 'thêm khách'],
        'Tab "Khách hàng" quản lý danh sách khách hàng (tên, SĐT, địa chỉ). '
            'Dữ liệu đồng bộ với Cloud qua admin-web.',
      ),
      AiAssistantTopic(
        ['san pham', 'sản phẩm', 'hang hoa', 'hàng hóa', 'dich vu', 'dịch vụ'],
        'Quản lý danh mục sản phẩm/dịch vụ dùng chung cho bán hàng. Giá bán '
            'và tồn kho được cập nhật khi phát sinh đơn.',
      ),
      AiAssistantTopic(
        ['ban hang', 'bán hàng', 'don ban', 'đơn bán', 'hoa don', 'hóa đơn', 'sales'],
        'Tab "Bán hàng Cloud" tạo đơn nhanh: chọn khách hàng, thêm sản phẩm và '
            'tổng tiền tự động tính. Đơn được đẩy lên admin-web.',
      ),
      AiAssistantTopic(
        ['bao cao', 'báo cáo', 'doanh so', 'doanh số', 'thong ke', 'thống kê'],
        'Báo cáo doanh số theo ngày, theo khách hàng và theo sản phẩm để đánh '
            'giá hiệu quả bán hàng và chăm sóc khách hàng.',
      ),
    ],
  ),

  AppModule.kanposvngym: const AiAssistantModuleData(
    module: AppModule.kanposvngym,
    assistantName: 'Trợ lý KanGYM',
    intro:
        'Chào bạn! Mình là trợ lý KanGYM. Mình giúp về hội viên, gói tập, bán '
        'hàng và lịch huấn luyện.',
    suggestions: [
      'Quản lý hội viên?',
      'Tạo gói tập mới?',
      'Xem doanh thu phòng gym?',
    ],
    topics: [
      AiAssistantTopic(
        ['hoi vien', 'hội viên', 'khach', 'khách', 'thanh vien', 'thành viên'],
        'Quản lý hồ sơ hội viên: thông tin, gói tập đang sử dụng và hạn hết '
            'hạn. Nhắc gia hạn khi gói sắp hết.',
      ),
      AiAssistantTopic(
        ['goi tap', 'gói tập', 'goi', 'gói', 'tap thu', 'tập thử', 'gia han', 'gia hạn'],
        'Tạo gói tập (theo tháng, quý, năm) với giá và thời hạn. Khi hội viên '
            'đăng ký/gia hạn, hệ thống ghi nhận doanh thu và cập nhật hạn.',
      ),
      AiAssistantTopic(
        ['ban hang', 'bán hàng', 'pos', 'do uong', 'đồ uống', 'phu kien', 'phụ kiện'],
        'Bán đồ uống, phụ kiện thể thao tại quầy. Hàng hóa quản lý kho và cộng '
            'vào doanh thu ngày.',
      ),
      AiAssistantTopic(
        ['huan luyen', 'huấn luyện', 'pt', 'lich', 'lịch', 'dash', 'dashboard'],
        'Quản lý lịch tập với huấn luyện viên (PT) và theo dõi hiệu suất phòng '
            'gym qua Dashboard.',
      ),
    ],
  ),

  AppModule.kanposvnparking: const AiAssistantModuleData(
    module: AppModule.kanposvnparking,
    assistantName: 'Trợ lý Kan Parking',
    intro:
        'Chào bạn! Mình là trợ lý Kan Parking. Mình giúp về quản lý bãi xe, '
        'tính tiền gửi xe và báo cáo doanh thu.',
    suggestions: [
      'Quản lý bãi xe?',
      'Tính tiền gửi xe?',
      'Xem doanh thu bãi?',
    ],
    topics: [
      AiAssistantTopic(
        ['bai xe', 'bãi xe', 'vi tri', 'vị trí', 'slot', 'cho gui', 'chỗ gửi'],
        'Quản lý vị trí đỗ trong bãi và trạng thái trống/bận. Theo dõi xe ra/vào '
            'theo từng vị trí.',
      ),
      AiAssistantTopic(
        ['tinh tien', 'tính tiền', 'guixe', 'gửi xe', 'ra vao', 'ra vào', 'thanh toan'],
        'Khi xe vào, ghi nhận thời gian; khi xe ra, hệ thống tính tiền theo giờ '
            'hoặc theo vé tháng. Thanh toán được ghi nhận ngay.',
      ),
      AiAssistantTopic(
        ['doanh thu', 'bao cao', 'báo cáo', 'thong ke', 'thống kê', 've thang'],
        'Báo cáo doanh thu theo ngày, theo loại xe và vé tháng để kiểm soát '
            'dòng tiền bãi xe.',
      ),
    ],
  ),

  AppModule.kanposvnviec: const AiAssistantModuleData(
    module: AppModule.kanposvnviec,
    assistantName: 'Trợ lý KanViec',
    intro:
        'Chào bạn! Mình là trợ lý KanViec. Mình giúp về tin tuyển dụng, hồ sơ '
        'ứng viên và kết nối ứng viên - nhà tuyển dụng.',
    suggestions: [
      'Đăng tin tuyển dụng?',
      'Quản lý hồ sơ ứng viên?',
      'Kết nối ứng viên thế nào?',
    ],
    topics: [
      AiAssistantTopic(
        ['tuyen dung', 'tuyển dụng', 'tin', 'viec lam', 'việc làm', 'dang tin', 'đăng tin'],
        'Đăng tin tuyển dụng với vị trí, địa điểm và mức lương. Tin được hiển '
            'thị cho ứng viên phù hợp.',
      ),
      AiAssistantTopic(
        ['ung vien', 'ứng viên', 'ho so', 'hồ sơ', 'cv', 'kỹ năng'],
        'Quản lý hồ sơ ứng viên: thông tin, kỹ năng và kinh nghiệm. Lọc theo '
            'yêu cầu vị trí để tìm ứng viên phù hợp.',
      ),
      AiAssistantTopic(
        ['ket noi', 'kết nối', 'match', 'de xuat', 'đề xuất', 'nha tuyen dung'],
        'Hệ thống đề xuất ứng viên phù hợp với tin tuyển dụng dựa trên kỹ năng '
            'và kinh nghiệm, giúp nhà tuyển dụng tiếp cận nhanh.',
      ),
    ],
  ),

  AppModule.kanposvnride: const AiAssistantModuleData(
    module: AppModule.kanposvnride,
    assistantName: 'Trợ lý KanRide',
    intro:
        'Chào bạn! Mình là trợ lý KanRide. Mình giúp về đặt xe, tài xế và '
        'theo dõi chuyến đi.',
    suggestions: [
      'Đặt xe như thế nào?',
      'Quản lý tài xế?',
      'Theo dõi chuyến đi?',
    ],
    topics: [
      AiAssistantTopic(
        ['dat xe', 'đặt xe', 'chuyen di', 'chuyến đi', 'diem don', 'điểm đón'],
        'Tạo yêu cầu đặt xe với điểm đón/điểm đến. Hệ thống gán tài xế và theo '
            'dõi trạng thái chuyến đi.',
      ),
      AiAssistantTopic(
        ['tai xe', 'tài xế', 'lai xe', 'lái xe', 'xe', 'phuong tien', 'phương tiện'],
        'Quản lý danh sách tài xế và phương tiện, trạng thái sẵn sàng nhận '
            'chuyến để điều phối hiệu quả.',
      ),
      AiAssistantTopic(
        ['theo doi', 'theo dõi', 'lich su', 'lịch sử', 'bao cao', 'báo cáo'],
        'Theo dõi chuyến đi đang hoạt động và lịch sử đã hoàn thành. Báo cáo '
            'tổng hợp số chuyến và doanh thu theo tài xế.',
      ),
    ],
  ),

  AppModule.kanposvneshop: const AiAssistantModuleData(
    module: AppModule.kanposvneshop,
    assistantName: 'Trợ lý KanShop',
    intro:
        'Chào bạn! Mình là trợ lý KanShop. Mình giúp về gian hàng, sản phẩm, '
        'giỏ hàng và đơn đặt hàng.',
    suggestions: [
      'Quản lý sản phẩm bán online?',
      'Xử lý đơn đặt hàng?',
      'Xem doanh thu shop?',
    ],
    topics: [
      AiAssistantTopic(
        ['san pham', 'sản phẩm', 'gian hang', 'gian hàng', 'danh muc', 'danh mục'],
        'Quản lý danh mục và sản phẩm bán online: tên, ảnh, giá và tồn kho. '
            'Sản phẩm hiển thị trong cửa hàng trực tuyến.',
      ),
      AiAssistantTopic(
        ['gio hang', 'giỏ hàng', 'mua hang', 'mua hàng', 'don hang', 'đơn hàng'],
        'Khách thêm sản phẩm vào giỏ hàng và đặt hàng. Đơn hàng được quản lý '
            'theo trạng thái chờ xác nhận, đóng gói, giao hàng.',
      ),
      AiAssistantTopic(
        ['doanh thu', 'bao cao', 'báo cáo', 'thong ke', 'thống kê', 'khach'],
        'Báo cáo doanh thu online theo ngày/tháng, sản phẩm bán chạy và khách '
            'hàng mua nhiều để lên kế hoạch khuyến mãi.',
      ),
    ],
  ),

  AppModule.kanposvnhrpayroll: const AiAssistantModuleData(
    module: AppModule.kanposvnhrpayroll,
    assistantName: 'Trợ lý HR Payroll (Vận Tải)',
    intro:
        'Chào bạn! Mình là trợ lý HR Payroll cho lĩnh vực vận tải. Mình giúp về '
        'nhân viên, tài xế, chấm công, lương và KPI.',
    suggestions: [
      'Thêm tài xế/nhân viên?',
      'Chấm công và tính lương?',
      'Theo dõi KPI?',
    ],
    topics: [
      AiAssistantTopic(
        ['nhan vien', 'nhân viên', 'tai xe', 'tài xế', 'them', 'thêm', 'ho so'],
        'Quản lý hồ sơ nhân viên và tài xế: thông tin cá nhân, vị trí và bộ '
            'phận. Thêm mới hoặc cập nhật hồ sơ khi có thay đổi.',
      ),
      AiAssistantTopic(
        ['cham cong', 'chấm công', 'luong', 'lương', 'bang luong', 'bảng lương'],
        'Chấm công theo ca và ngày làm việc của từng người. Bảng lương tổng hợp '
            'theo công, phụ cấp, thưởng/phạt để trả đúng kỳ.',
      ),
      AiAssistantTopic(
        ['kpi', 'chuyen', 'chuyến', 'doanh thu', 'loi nhuan', 'lợi nhuận', 'xe'],
        'Theo dõi KPI của tài xế theo số chuyến, doanh thu và chi phí vận hành '
            'để đánh giá hiệu quả làm việc.',
      ),
      AiAssistantTopic(
        ['bao cao', 'báo cáo', 'thong ke', 'thống kê', 'dashboard'],
        'Báo cáo tổng hợp nhân sự, chi phí lương và hiệu quả tài xế giúp quản '
            'lý điều hành đội xe tối ưu.',
      ),
    ],
  ),
};
