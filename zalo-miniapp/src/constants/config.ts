export interface PosApp {
  appCode: string;
  label: string;
}

export const POS_APPS: PosApp[] = [
  { appCode: "kanposvncafe", label: "KanPosVN Cafe / Trà Sữa" },
  { appCode: "kanposvnnhahangquanan", label: "Nhà Hàng / Quán Ăn" },
  { appCode: "kanposvnnhathuoc", label: "Nhà Thuốc" },
  { appCode: "kanposvngara", label: "Gara Ô Tô" },
  { appCode: "kanposvnvlxd", label: "Vật Liệu Xây Dựng" },
  { appCode: "kanposvnkhachsan", label: "Khách Sạn" },
  { appCode: "kanposvnbida", label: "Quản Lý Bida" },
  { appCode: "kanposvnspa", label: "Spa & Dưỡng Sinh" },
  { appCode: "kanposvnqlcd", label: "QLCD - Cắt Ghép & Vé" },
  { appCode: "kanposvnbanvevantai", label: "Vận Tải & Vé" },
  { appCode: "kanposvnnbatdongsan", label: "Bất Động Sản" },
  { appCode: "kanposvnnhatro200", label: "Nhà Trọ" },
  { appCode: "nhansu", label: "Nhân Sự" },
];

export interface Plan {
  key: string;
  label: string;
  days: number;
  price: number;
  trial?: boolean;
  forever?: boolean;
}

export const PLANS: Plan[] = [
  { key: "trial", label: "Dùng thử 7 ngày", days: 7, price: 0, trial: true },
  { key: "yearly", label: "365 ngày", days: 365, price: 899000 },
  { key: "forever", label: "Vĩnh Viễn", days: 0, price: 2999000, forever: true },
];

export function planOptions(): { value: string; label: string }[] {
  return PLANS.map((p) => ({
    value: p.key,
    label: `${p.label} - ${new Intl.NumberFormat("vi-VN", {
      style: "currency",
      currency: "VND",
      maximumFractionDigits: 0,
    }).format(p.price)}`,
  }));
}
