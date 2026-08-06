import { useEffect, useState } from "react";
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
import { formatVND, getJson, postJson } from "@/services/api";

interface LicenseInfo {
  app_code: string;
  plan: string;
  status: string;
  days_left: number;
  expires_at: string | null;
  forever?: boolean;
}

function RenewPage() {
  const navigate = useNavigate();
  const snackbar = useSnackbar();
  const [user, setUser] = useAtom(userAtom);

  const [phone, setPhone] = useState(user.phone || "");
  const [licenses, setLicenses] = useState<LicenseInfo[]>([]);
  const [appCode, setAppCode] = useState(POS_APPS[0].appCode);
  const [plan, setPlan] = useState(PLANS.find((p) => !p.trial)!.key);
  const [loading, setLoading] = useState(false);
  const [checking, setChecking] = useState(false);

  const selectedPlan = PLANS.find((p) => p.key === plan) || PLANS.find((p) => !p.trial)!;

  const checkStatus = async () => {
    if (!phone) {
      snackbar.openSnackbar({ text: "Vui lòng nhập số điện thoại", type: "error" });
      return;
    }
    setChecking(true);
    try {
      const res = await getJson(`/api/license/me?phone=${encodeURIComponent(phone)}`);
      setLicenses(res.licenses || []);
      setUser((u) => ({ ...u, phone }));
      if (res.licenses?.length) {
        snackbar.openSnackbar({ text: "Đã tải thông tin gói của bạn", type: "success" });
      } else {
        snackbar.openSnackbar({ text: "Chưa có gói nào. Hãy đăng ký trước.", type: "info" });
      }
    } catch (e: any) {
      snackbar.openSnackbar({ text: e.message || "Không tra cứu được", type: "error" });
    } finally {
      setChecking(false);
    }
  };

  const renew = async () => {
    setLoading(true);
    try {
      const res = await postJson("/api/license/renew", {
        phone,
        zalo_id: user.zalo_id,
        app_code: appCode,
        plan,
      });
      snackbar.openSnackbar({ text: res.message || "Gia hạn thành công!", type: "success" });
      await checkStatus();
    } catch (e: any) {
      snackbar.openSnackbar({ text: e.message || "Gia hạn thất bại", type: "error" });
    } finally {
      setLoading(false);
    }
  };

  return (
    <Page className="page">
      <Header title="Gia hạn gói" showBackIcon onBackClick={() => navigate(-1)} />
      <Box className="section-container space-y-3">
        <Input label="Số điện thoại đã đăng ký" placeholder="VD: 09xxxxxxxx" value={phone} onChange={(e) => setPhone(e.target.value)} />
        <Button fullWidth variant="secondary" onClick={checkStatus} disabled={checking}>
          {checking ? <Spinner /> : "Kiểm tra gói hiện tại"}
        </Button>
      </Box>

      {licenses.length > 0 && (
        <Box className="section-container space-y-2">
          <Text.Title size="small">Gói đang dùng</Text.Title>
          {licenses.map((lic) => (
            <Box key={lic.app_code} className="rounded-lg bg-slate-50 p-3">
              <Text bold>{lic.app_code}</Text>
              <Text className="text-sm">
                Gói: {lic.plan} | Trạng thái: {lic.status}
              </Text>
              <Text className="text-sm">
                {lic.forever ? "Vĩnh Viễn" : `Còn ${lic.days_left} ngày`}
                {lic.expires_at
                  ? ` | Hết hạn: ${new Date(lic.expires_at).toLocaleDateString("vi-VN")}`
                  : lic.forever
                    ? " | Không giới hạn"
                    : ""}
              </Text>
            </Box>
          ))}
        </Box>
      )}

      <Box className="section-container space-y-3">
        <Select
          label="Phần mềm cần gia hạn"
          value={appCode}
          onChange={(value) => setAppCode(String(value))}
        >
          {POS_APPS.map((a) => (
            <Select.Option key={a.appCode} value={a.appCode} title={a.label} />
          ))}
        </Select>
        <Select
          label="Chọn gói gia hạn"
          value={plan}
          onChange={(value) => setPlan(String(value))}
        >
          {PLANS.map((p) => (
            <Select.Option key={p.key} value={p.key} title={p.label} />
          ))}
        </Select>
        <Text bold className="!text-amber-700">
          {formatVND(selectedPlan.price)} / {selectedPlan.label}
        </Text>
        <Button fullWidth variant="primary" onClick={renew} disabled={loading}>
          {loading ? <Spinner /> : "Gia hạn ngay (mock thanh toán)"}
        </Button>
      </Box>
    </Page>
  );
}

export default RenewPage;
