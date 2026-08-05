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
import { POS_APPS } from "@/constants/config";
import { postJson } from "@/services/api";
import { getZaloProfile } from "@/services/zalo";

function RegisterPage() {
  const navigate = useNavigate();
  const snackbar = useSnackbar();
  const [user, setUser] = useAtom(userAtom);

  const [loading, setLoading] = useState(false);
  const [phone, setPhone] = useState("");
  const [name, setName] = useState(user.name || "");
  const [shopName, setShopName] = useState("");
  const [email, setEmail] = useState("");
  const [appCode, setAppCode] = useState(POS_APPS[0].appCode);

  const onSubmit = async () => {
    if (!phone) {
      snackbar.openSnackbar({ text: "Vui lòng nhập số điện thoại", type: "error" });
      return;
    }
    setLoading(true);
    try {
      const profile = await getZaloProfile();
      const res = await postJson("/api/license/register", {
        zalo_id: user.zalo_id || profile?.id || "",
        phone,
        email: email || undefined,
        full_name: name,
        shop_name: shopName,
        app_code: appCode,
      });
      setUser({
        zalo_id: profile?.id || user.zalo_id,
        name: name || profile?.name,
        phone,
        email: email || res.user?.email,
        shop_name: shopName,
        token: res.token,
      });
      snackbar.openSnackbar({ text: res.message || "Đăng ký thành công!", type: "success" });
      navigate("/download");
    } catch (e: any) {
      snackbar.openSnackbar({ text: e.message || "Đăng ký thất bại", type: "error" });
    } finally {
      setLoading(false);
    }
  };

  return (
    <Page className="page">
      <Header title="Đăng ký tài khoản" showBackIcon onBackClick={() => navigate(-1)} />
      <Box className="section-container space-y-3">
        <Text.Title size="small">Tạo tài khoản KanPosVN, dùng thử 7 ngày miễn phí</Text.Title>
        <Input label="Số điện thoại" placeholder="VD: 09xxxxxxxx" value={phone} onChange={(e) => setPhone(e.target.value)} />
        <Input label="Tên người dùng" placeholder="Tên chủ cửa hàng" value={name} onChange={(e) => setName(e.target.value)} />
        <Input label="Tên cửa hàng / công ty" placeholder="VD: Quán cafe ABC" value={shopName} onChange={(e) => setShopName(e.target.value)} />
        <Input label="Email (không bắt buộc)" placeholder="VD: abc@email.com" value={email} onChange={(e) => setEmail(e.target.value)} />
        <Select
          label="Chọn phần mềm POS"
          value={appCode}
          onChange={(value) => setAppCode(String(value))}
        >
          {POS_APPS.map((a) => (
            <Select.Option key={a.appCode} value={a.appCode} title={a.label} />
          ))}
        </Select>
        <Button fullWidth variant="primary" onClick={onSubmit} disabled={loading}>
          {loading ? <Spinner /> : "Đăng ký & nhận dùng thử"}
        </Button>
      </Box>
    </Page>
  );
}

export default RegisterPage;
