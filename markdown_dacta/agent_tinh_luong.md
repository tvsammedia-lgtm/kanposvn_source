xây dựng một AI Agent riêng bằng Flutter + Python + OpenAI/Gemini:

Người dùng chỉ cần kéo thả file .xlsx.
AI tự nhận diện các sheet (Chấm công, Bảng lương, Danh sách nhân viên...).
Tự suy luận hoặc áp dụng quy tắc tính lương đã cấu hình.
Phát hiện bất thường (ví dụ: tăng ca quá nhiều, lương giảm đột ngột, thiếu dữ liệu).
Xuất báo cáo Excel/PDF và giải thích nguyên nhân từng sai lệch bằng ngôn ngữ tự nhiên.
=========================================================================================
FullName
FullName                                                                                                       
--------                                                                                                       
D:\GIAI_TRI_SHARED_HP\bag_sony_10\sampledart\demo_code\ai_agent_luong_python\backend\agent\core.py             
D:\GIAI_TRI_SHARED_HP\bag_sony_10\sampledart\demo_code\ai_agent_luong_python\backend\agent\prompts.py          
D:\GIAI_TRI_SHARED_HP\bag_sony_10\sampledart\demo_code\ai_agent_luong_python\backend\agent\__init__.py         
D:\GIAI_TRI_SHARED_HP\bag_sony_10\sampledart\demo_code\ai_agent_luong_python\backend\models\schemas.py         
D:\GIAI_TRI_SHARED_HP\bag_sony_10\sampledart\demo_code\ai_agent_luong_python\backend\models\__init__.py        
D:\GIAI_TRI_SHARED_HP\bag_sony_10\sampledart\demo_code\ai_agent_luong_python\backend\tools\__init__.py         
D:\GIAI_TRI_SHARED_HP\bag_sony_10\sampledart\demo_code\ai_agent_luong_python\backend\.env.example              
D:\GIAI_TRI_SHARED_HP\bag_sony_10\sampledart\demo_code\ai_agen…
Click to expand
+ Thought: 126ms
Dự án đã hoàn thành! Đây là tổng quan:
Cấu trúc dự án
ai_agent_luong_python/
├── backend/                          # Python Backend
│   ├── main.py                       # FastAPI server (port 8000)
│   ├── requirements.txt              # Dependencies
│   ├── .env.example                  # API keys template
│   ├── agent/
│   │   ├── core.py                   # AI Agent chính (OpenAI/Gemini + Tool calling)
│   │   └── prompts.py               # System prompts + tính toán thuế
│   ├── models/
│   │   └── schemas.py               # Pydantic models
│   └── tools/                        # Accounting tools
│
├── lib/                              # Flutter Frontend
│   ├── main.dart                     # Entry point + Navigation
│   ├── models/
│   │   └── chat_models.dart          # Data models
│   ├── services/
│   │   └── api_service.dart          # HTTP client kết nối backend
│   ├── screens/
│   │   ├── chat_screen.dart          # Chat với AI Agent (màn chính)
│   │   ├── calculator_screen.dart    # Máy tính thuế VAT/TNCN/TNDN
│   │   └── invoice_screen.dart       # Tạo hóa đơn GTGT
│   └── widgets/
│       └── chat_widgets.dart         # Chat bubbles, quick actions
Chức năng chính
Chức năng	Mô tả
Chat AI	Trò chuyện bằng tiếng Việt với AI kế toán (GPT-4o/Gemini)
Tool Calling	Agent tự gọi tool tính thuế, tạo hóa đơn khi cần
Tính VAT	Hỗ trợ 5%, 8%, 10% theo luật mới
Tính TNCN	Thang thuế lũy tiến 5%-35%, giảm trừ 11tr/tháng
Tính TNDN	Thuế TNDN 20%
Tạo hóa đơn	Hóa đơn GTGT mẫu Việt Nam + chuyển số thành chữ
Phân tích TC	Phân tích doanh thu, chi phí, lợi nhuận
Quick Actions	6 thao tác nhanh trên màn hình chat
Cách chạy
Backend:
cd backend
pip install -r requirements.txt
# Copy .env.example -> .env và điền API keys
python -m uvicorn backend.main:app --reload --port 8000
Frontend:
flutter pub get
flutter run
API Docs: http://localhost:8000/docs
-------------------------------------------------------------------------
OPENAI_API_KEY=sk-db78e9531dea0c14-ddcfac-72afb176
OPENAI_BASE_URL=http://localhost:20128/v1

# Google Gemini
GEMINI_API_KEY=AIza-test456
