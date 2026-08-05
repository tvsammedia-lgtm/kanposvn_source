import { useState } from "react";
import { useNavigate } from "react-router-dom";
import {
  Box,
  Button,
  Header,
  Input,
  Page,
  Select,
  Spinner,
  Text,
  useSnackbar,
} from "zmp-ui";
import { useAtom } from "jotai";

import { userAtom } from "@/state";
import { PLANS, POS_APPS } from "@/constants/config";
import { formatVND, postJson } from "@/services/api";

function PaymentPage() {
  const navigate = useNavigate();
  const snackbar = useSnackbar();
  const [user, setUser] = useAtom(userAtom);

  const [phone, setPhone] = useState(user.phone || "");
  const [appCode, setAppCode] = useState(POS_APPS[0].appCode);
  const [plan, setPlan] = useState(PLANS[0].key);
  const [orderCode, setOrderCode] = useState("");
  const [loading, setLoading] = useState(false);

  const selectedPlan = PLANS.find((p) => p.key === plan) || PLANS[0];

  const createOrder = async () => {
    if (!phone) {
      snackbar.openSnackbar({ text: "Vui lòng nhập số điện thoại đã đăng ký", type: "error" });
      return;
    }
    setLoading(true);
    try {
      const res = await postJson("/api/license/order", {
        phone,
        zalo_id: user.zalo_id,
        app_code: appCode,
        plan,
      });
      setOrderCode(res.order_code);
      setUser((u) => ({ ...u, phone }));
      snackbar.openSnackbar({ text: "Tạo đơn thành công. Tiến hành thanh toán.", type: "success" });
    } catch (e: any) {
      snackbar.openSnackbar({ text: e.message || "Tạo đơn thất bại", type: "error" });
    } finally {
      setLoading(false);
    }
  };

  const confirmPay = async () => {
    if (!orderCode) return;
    setLoading(true);
    try {
      const res = await postJson("/api/license/pay", { order_code: orderCode });
      snackbar.openSnackbar({ text: res.message || "Thanh toán thành công!", type: "success" });
      setOrderCode("");
    } catch (e: any) {
      snackbar.openSnackbar({ text: e.message || "Xác nhận thanh toán thất bại", type: "error" });
    } finally {
      setLoading(false);
    }
  };

  return (
    <Page className="page">
      <Header title="Thanh toán" showBackIcon onBackClick={() => navigate(-1)} />
      <Box className="section-container space-y-3">
        <Text.Title size="small">Mua / gia hạn gói KanPosVN</Text.Title>
        <Input label="Số điện thoại đã đăng ký" placeholder="VD: 09xxxxxxxx" value={phone} onChange={(e) => setPhone(e.target.value)} />
        <Select
          label="Phần mềm POS"
          value={appCode}
          onChange={(value) => setAppCode(String(value))}
        >
          {POS_APPS.map((a) => (
            <Select.Option key={a.appCode} value={a.appCode} title={a.label} />
          ))}
        </Select>
        <Select
          label="Chọn gói"
          value={plan}
          onChange={(value) => setPlan(String(value))}
        >
          {PLANS.map((p) => (
            <Select.Option key={p.key} value={p.key} title={p.label} />
          ))}
        </Select>
        <Box className="rounded-lg bg-amber-50 p-3">
          <Text bold className="!text-amber-800">
            {formatVND(selectedPlan.price)} / {selectedPlan.label} ({selectedPlan.days} ngày)
          </Text>
        </Box>
        <Button fullWidth variant="primary" onClick={createOrder} disabled={loading}>
          {loading ? <Spinner /> : "Tạo đơn thanh toán"}
        </Button>
        {orderCode && (
          <Box className="rounded-lg bg-green-50 p-3 space-y-2">
            <Text className="!text-green-800">Mã đơn: {orderCode}</Text>
            <Text className="!text-green-800">
              Số tiền: {formatVND(selectedPlan.price)} (ZaloPay - mock, chưa cần trả thật)
            </Text>
            <Button fullWidth variant="secondary" onClick={confirmPay} disabled={loading}>
              {loading ? <Spinner /> : "Xác nhận thanh toán (mock)"}
            </Button>
          </Box>
        )}
      </Box>
    </Page>
  );
}

export default PaymentPage;
