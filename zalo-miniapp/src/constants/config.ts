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
}

export const PLANS: Plan[] = [
  { key: "monthly", label: "1 tháng", days: 30, price: 99000 },
  { key: "quarterly", label: "3 tháng", days: 90, price: 249000 },
  { key: "yearly", label: "12 tháng", days: 365, price: 899000 },
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
