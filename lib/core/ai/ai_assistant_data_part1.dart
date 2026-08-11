import '../module_enum.dart';
import 'ai_assistant_models.dart';

final Map<AppModule, AiAssistantModuleData> kAiAssistantPart1 = {
  AppModule.kanposvncafe: const AiAssistantModuleData(
    module: AppModule.kanposvncafe,
    assistantName: 'Trợ lý Quán Cafe',
    intro:
        'Chào bạn! Mình là trợ lý cho quán cafe & trà sữa. Mình hướng dẫn về '
        'bán hàng, menu, kho, thu chi, hóa đơn điện tử và đồng bộ dữ liệu.',
    suggestions: [
      'Cách tạo bàn mới?',
      'Bán hàng nhanh như thế nào?',
      'Cách xuất hóa đơn điện tử?',
      'Đồng bộ dữ liệu lên Neon?',
    ],
    topics: [
      AiAssistantTopic(
        ['ban', 'bàn', 'so do', 'sơ đồ', 'tang', 'tầng', 'floor'],
        'Mở tab "Sơ đồ Bàn" để quản lý mặt bằng trực quan, hoặc tab '
            '"Quản lý Tầng/Bàn" để thêm, sửa, xóa tầng và bàn. Bàn được dùng '
            'để gọi món trong tab "Bán hàng".',
      ),
      AiAssistantTopic(
        ['ban hang', 'bán hàng', 'pos', 'goi mon', 'gọi món', 'thanh toan'],
        'Tab "Bán hàng" (POS) cho phép chọn bàn, thêm món từ menu và thanh '
            'toán ngay tại màn hình. Tra cứu hóa đơn ở tab "Tra cứu hóa đơn", '
            'xem doanh thu ở tab "Báo cáo bán hàng".',
      ),
      AiAssistantTopic(
        ['menu', 'mon', 'món', 'recipe', 'cong thuc', 'công thức'],
        'Tab "Menu & Recipe" quản lý danh mục món, giá bán và công thức '
            'nguyên liệu. Khi tạo món mới, nhập tên, giá và liên kết công thức '
            'để tính giá vốn.',
      ),
      AiAssistantTopic(
        ['kho', 'ton', 'tồn', 'nguyen lieu', 'nguyên liệu', 'nhap hang'],
        'Tab "Kho Hàng" theo dõi tồn kho nguyên liệu/hàng hóa; tab "Nhập hàng" '
            'để tạo phiếu nhập từ nhà cung cấp. Nhập kho sẽ cập nhật giá vốn '
            'cho các món dùng công thức.',
      ),
      AiAssistantTopic(
        ['thu chi', 'tai chinh', 'tài chính', 'ke toan', 'kế toán', 'phieu'],
        'Tab "Thu Chi & KT" quản lý dòng tiền và nghiệp vụ kế toán đơn giản; '
            'tab "Phiếu Thu/Chi" để lập phiếu thu hoặc chi tiền mặt. Số liệu '
            'phản ánh lên Dashboard.',
      ),
      AiAssistantTopic(
        ['hoa don dien tu', 'hóa đơn điện tử', 'hddt', 'xuat hoa don'],
        'Tab "Hóa đơn điện tử" xuất hóa đơn theo quy định. Cấu hình thông tin '
            'doanh nghiệp và mẫu hóa đơn trước khi sử dụng, sau đó xuất cho '
            'từng đơn bán hàng.',
      ),
      AiAssistantTopic(
        ['dong bo', 'đồng bộ', 'neon', 'sync', 'cloud', 'sao luu', 'sao lưu'],
        'Bấm icon đồng bộ trên thanh công cụ hoặc mở tab "Vercel Neon" để đẩy '
            'dữ liệu lên Neon. Dữ liệu cục bộ lưu Isar offline và tự đồng bộ '
            'khi có mạng.',
      ),
      AiAssistantTopic(
        ['nhan vien', 'nhân viên', 'phan quyen', 'phân quyền', 'tai khoan'],
        'Tab "Quản lý nhân viên" để thêm tài khoản nhân viên, tab "Phân quyền" '
            'để cấp quyền xem từng tab theo vai trò (Thu ngân, Bán hàng, Kho, '
            'Kế toán).',
      ),
    ],
  ),

  AppModule.kanposvnkhachsan: const AiAssistantModuleData(
    module: AppModule.kanposvnkhachsan,
    assistantName: 'Trợ lý Khách Sạn',
    intro:
        'Chào bạn! Mình là trợ lý module quản lý khách sạn. Mình giúp về phòng, '
        'đặt phòng, khách hàng và báo cáo doanh thu.',
    suggestions: [
      'Cách quản lý phòng?',
      'Tạo đặt phòng mới?',
      'Theo dõi khách đang lưu trú?',
    ],
    topics: [
      AiAssistantTopic(
        ['phong', 'phòng', 'loai phong', 'loại phòng', 'trang thai phong'],
        'Quản lý danh sách phòng, trạng thái (trống/đã đặt/đang ở) và loại '
            'phòng. Đổi trạng thái ngay khi nhận/trả phòng để dữ liệu chính xác.',
      ),
      AiAssistantTopic(
        ['dat phong', 'đặt phòng', 'checkin', 'check in', 'nhan phong'],
        'Tạo phiếu đặt phòng: chọn phòng, ngày nhận/trả và thông tin khách. '
            'Khi khách đến, thực hiện check-in để phòng chuyển sang trạng thái '
            'đang sử dụng.',
      ),
      AiAssistantTopic(
        ['khach', 'khách', 'checkout', 'check out', 'tra phong', 'trả phòng'],
        'Theo dõi thông tin khách lưu trú và lịch sử. Khi khách trả phòng '
            '(check-out), hệ thống tính tiền và cập nhật trạng thái phòng.',
      ),
      AiAssistantTopic(
        ['doanh thu', 'bao cao', 'báo cáo', 'thong ke', 'thống kê'],
        'Báo cáo doanh thu theo phòng, theo ngày hoặc tháng để nắm công suất '
            'phòng và hiệu quả kinh doanh.',
      ),
    ],
  ),

  AppModule.nhanSu: const AiAssistantModuleData(
    module: AppModule.nhanSu,
    assistantName: 'Trợ lý Nhân Sự',
    intro:
        'Chào bạn! Mình là trợ lý module Nhân Sự. Mình giúp về hồ sơ nhân viên, '
        'chấm công, bảng lương và báo cáo.',
    suggestions: [
      'Cách thêm nhân viên?',
      'Chấm công như thế nào?',
      'Tính lương thế nào?',
    ],
    topics: [
      AiAssistantTopic(
        ['nhan vien', 'nhân viên', 'ho so', 'hồ sơ', 'them', 'thêm'],
        'Tab "Nhân sự" cho phép thêm mới, cập nhật hồ sơ nhân viên (thông tin '
            'cá nhân, phòng ban, chức vụ). Hồ sơ lưu cục bộ và đồng bộ khi có mạng.',
      ),
      AiAssistantTopic(
        ['cham cong', 'chấm công', 'di muon', 'đi muộn', 'nghi', 'nghỉ', 'tang ca'],
        'Tab "Chấm công" ghi nhận giờ vào/ra, nghỉ phép và tăng ca theo ngày. '
            'Dữ liệu chấm công là cơ sở tính lương cuối kỳ.',
      ),
      AiAssistantTopic(
        ['luong', 'lương', 'bang luong', 'bảng lương', 'tinh luong'],
        'Tab "Bảng lương" tổng hợp lương theo công, thưởng/phạt và phụ cấp cho '
            'từng nhân viên. Sau khi khóa bảng lương, số liệu là căn cứ chi trả.',
      ),
      AiAssistantTopic(
        ['bao cao', 'báo cáo', 'thong ke', 'thống kê', 'dashboard'],
        'Báo cáo/Dashboard tổng hợp số lượng nhân sự, tỉ lệ đi làm, chi phí '
            'lương theo phòng ban để quản lý nắm nhanh tình hình nhân sự.',
      ),
    ],
  ),

  AppModule.kanposvnvlxd: const AiAssistantModuleData(
    module: AppModule.kanposvnvlxd,
    assistantName: 'Trợ lý Vật Liệu Xây Dựng',
    intro:
        'Chào bạn! Mình là trợ lý module Vật Liệu Xây Dựng. Mình giúp về bán '
        'hàng, kho, hợp đồng, thu chi và báo cáo.',
    suggestions: [
      'Cách bán hàng vật liệu?',
      'Quản lý kho xây dựng?',
      'Theo dõi công nợ?',
    ],
    topics: [
      AiAssistantTopic(
        ['ban hang', 'bán hàng', 'pos', 'hoa don', 'hóa đơn', 'ban buon'],
        'Tab "Bán lẻ" (POS) bán hàng nhanh tại quầy. Với khách mua buôn, dùng '
            'tab "Hợp đồng" để lập hợp đồng và theo dõi thanh toán theo tiến độ.',
      ),
      AiAssistantTopic(
        ['kho', 'ton kho', 'tồn kho', 'nhap kho', 'nhập kho', 'vlxd'],
        'Tab "Kho Hàng" quản lý danh mục vật liệu (cát, đá, xi măng, sắt thép...) '
            'và tồn kho theo kho. Mọi phiếu nhập/xuất cập nhật ngay tồn kho.',
      ),
      AiAssistantTopic(
        ['cong no', 'công nợ', 'thu chi', 'no', 'nợ', 'phai thu', 'phải thu'],
        'Tab "Thu Chi & Nợ" theo dõi công nợ khách hàng và nhà cung cấp, ghi '
            'nhận thu/chi và đối chiếu thanh toán.',
      ),
      AiAssistantTopic(
        ['hop dong', 'hợp đồng', 'cong trinh', 'công trình', 'ung truoc'],
        'Tab "Hợp đồng" lập hợp đồng bán hàng cho khách buôn/công trình: mặt '
            'hàng, số lượng, đơn giá và tiến độ thanh toán.',
      ),
      AiAssistantTopic(
        ['bao cao', 'báo cáo', 'thong ke', 'thống kê', 'doanh thu'],
        'Báo cáo tổng hợp doanh thu theo ngày/tháng, báo cáo bán hàng chi tiết '
            'và báo cáo tồn kho giúp kiểm soát lợi nhuận từng mặt hàng.',
      ),
    ],
  ),

  AppModule.kanposvngara: const AiAssistantModuleData(
    module: AppModule.kanposvngara,
    assistantName: 'Trợ lý Gara Ô Tô',
    intro:
        'Chào bạn! Mình là trợ lý module Gara ô tô. Mình giúp về tiếp nhận xe, '
        'lệnh sửa chữa, kho phụ tùng và thu chi.',
    suggestions: [
      'Cách tiếp nhận xe?',
      'Lập lệnh sửa chữa?',
      'Quản lý phụ tùng?',
    ],
    topics: [
      AiAssistantTopic(
        ['tiep nhan', 'tiếp nhận', 'xe', 'khach', 'khách'],
        'Tab "Tiếp nhận" ghi nhận thông tin xe và yêu cầu của khách, chỉ định '
            'kỹ thuật viên phụ trách để lệnh sửa chữa chạy đúng quy trình.',
      ),
      AiAssistantTopic(
        ['sua chua', 'sửa chữa', 'lenh sua', 'lệnh sửa', 'bao duong', 'phu tung'],
        'Tab "Lệnh sửa chữa" lập lệnh cho từng xe: dịch vụ, phụ tùng thay thế '
            'và nhân công. Chi phí được tổng hợp để xuất hóa đơn khi bàn giao xe.',
      ),
      AiAssistantTopic(
        ['kho', 'ton kho', 'tồn kho', 'phu tung', 'phụ tùng', 'vat tu'],
        'Tab "Kho" quản lý phụ tùng, vật tư: nhập kho, xuất cho lệnh sửa chữa '
            'và theo dõi tồn kho. Xuất phụ tùng tự động trừ vào tồn.',
      ),
      AiAssistantTopic(
        ['thu chi', 'tai chinh', 'tài chính', 'cong no', 'công nợ', 'bao cao'],
        'Tab "Thu chi" ghi nhận thu từ khách, chi mua phụ tùng và chi phí khác. '
            'Tab "Báo cáo" tổng hợp doanh thu, lợi nhuận và công nợ khách hàng.',
      ),
    ],
  ),

  AppModule.kanposvnnhathuoc: const AiAssistantModuleData(
    module: AppModule.kanposvnnhathuoc,
    assistantName: 'Trợ lý Nhà Thuốc',
    intro:
        'Chào bạn! Mình là trợ lý module Nhà Thuốc. Mình giúp về bán thuốc, '
        'quản lý kho thuốc, hạn dùng và báo cáo.',
    suggestions: [
      'Cách bán thuốc tại quầy?',
      'Theo dõi hạn dùng thuốc?',
      'Quản lý tồn kho thuốc?',
    ],
    topics: [
      AiAssistantTopic(
        ['ban', 'bán', 'pos', 'don thuoc', 'đơn thuốc', 'thuoc', 'thuốc'],
        'Tab "Bán thuốc" (POS) hỗ trợ bán theo đơn thuốc hoặc bán lẻ. Nhập tên '
            'thuốc để tìm nhanh, hệ thống kiểm tra tồn kho và hạn dùng trước '
            'khi thanh toán.',
      ),
      AiAssistantTopic(
        ['han dung', 'hạn dùng', 'het han', 'hết hạn', 'expire', 'exp'],
        'Kho thuốc theo dõi hạn dùng từng lô. Hệ thống cảnh báo thuốc sắp hết '
            'hạn để bạn xử lý kịp thời, tránh bán thuốc quá hạn.',
      ),
      AiAssistantTopic(
        ['kho', 'ton kho', 'tồn kho', 'nhap', 'nhập', 'lo', 'lô'],
        'Tab "Kho" quản lý danh mục thuốc, nhập theo lô (số lô, hạn dùng, đơn '
            'giá) và theo dõi tồn kho theo từng lô. Xuất bán tự động trừ tồn.',
      ),
      AiAssistantTopic(
        ['bao cao', 'báo cáo', 'thong ke', 'thống kê', 'doanh thu', 'loi nhuan'],
        'Báo cáo tổng hợp doanh thu bán thuốc theo ngày/tháng, lợi nhuận theo '
            'thuốc và danh mục thuốc bán chạy nhất, hỗ trợ nhập bổ sung.',
      ),
    ],
  ),

  AppModule.kanposvnqlcd: const AiAssistantModuleData(
    module: AppModule.kanposvnqlcd,
    assistantName: 'Trợ lý QLCD (Cắt Ghép & Vé)',
    intro:
        'Chào bạn! Mình là trợ lý module Cắt Ghép & Vé (QLCD). Mình giúp về '
        'quản lý vé, cắt ghép lịch và doanh thu.',
    suggestions: [
      'Cách tạo vé mới?',
      'Quản lý cắt ghép lịch?',
      'Xem doanh thu?',
    ],
    topics: [
      AiAssistantTopic(
        ['ve', 'vé', 'phat hanh', 'phát hành', 'ban ve', 'bán vé', 'soat ve'],
        'Quản lý phát hành và bán vé trong module QLCD: tạo đợt vé, theo dõi '
            'vé đã bán/chưa bán và kiểm soát doanh thu từng đợt.',
      ),
      AiAssistantTopic(
        ['cat ghep', 'cắt ghép', 'lich', 'lịch', 'xep', 'xếp', 'ca', 'ca làm'],
        'Chức năng cắt ghép giúp sắp xếp lịch ca/lịch trình hợp lý. Bạn có thể '
            'ghép nhóm, phân ca và theo dõi tiến độ thực hiện.',
      ),
      AiAssistantTopic(
        ['doanh thu', 'bao cao', 'báo cáo', 'thong ke', 'thống kê'],
        'Báo cáo/Dashboard tổng hợp doanh thu bán vé theo ngày/tháng và theo '
            'tuyến/đợt, giúp bạn nắm hiệu quả kinh doanh nhanh chóng.',
      ),
    ],
  ),
};
