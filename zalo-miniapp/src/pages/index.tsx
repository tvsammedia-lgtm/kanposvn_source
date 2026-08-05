import { useNavigate } from "react-router-dom";
import { Box, Button, Icon, Page, Text } from "zmp-ui";
import { useEffect } from "react";
import { useSetAtom } from "jotai";

import { userAtom } from "@/state";
import { getZaloProfile } from "@/services/zalo";

function HomePage() {
  const navigate = useNavigate();
  const setUser = useSetAtom(userAtom);

  useEffect(() => {
    getZaloProfile().then((profile) => {
      if (profile) {
        setUser((u) => ({
          ...u,
          zalo_id: profile.id,
          name: profile.name || u.name,
        }));
      }
    });
  }, [setUser]);

  return (
    <Page className="page">
      <Box className="brand-header mb-4">
        <Text.Title className="!text-white">KanPosVN</Text.Title>
        <Text className="!text-white/90">
          Phần mềm quản lý bán hàng đa ngành
        </Text>
        <Text className="!text-white/70 text-sm">
          Cafe, Nhà hàng, Nhà thuốc, Gara, VLXD...
        </Text>
      </Box>

      <Box className="section-container">
        <Text.Title size="small" className="mb-4">
          Tài khoản & Dịch vụ
        </Text.Title>
        <Box className="space-y-3">
          <Button
            fullWidth
            variant="primary"
            prefixIcon={<Icon icon="zi-add-user" />}
            onClick={() => navigate("/register")}
          >
            Đăng ký tài khoản mới
          </Button>
          <Button
            fullWidth
            variant="secondary"
            prefixIcon={<Icon icon="zi-check-circle" />}
            onClick={() => navigate("/payment")}
          >
            Thanh toán / Mua gói
          </Button>
          <Button
            fullWidth
            variant="secondary"
            prefixIcon={<Icon icon="zi-clock-1" />}
            onClick={() => navigate("/renew")}
          >
            Gia hạn gói
          </Button>
          <Button
            fullWidth
            variant="secondary"
            prefixIcon={<Icon icon="zi-download" />}
            onClick={() => navigate("/download")}
          >
            Tải POS
          </Button>
        </Box>
      </Box>

      <Box className="section-container">
        <Text className="text-sm !text-slate-500">
          Hướng dẫn: Đăng ký để nhận 7 ngày dùng thử miễn phí. Sau đó tải POS
          về máy, đăng nhập bằng số điện thoại đã đăng ký.
        </Text>
      </Box>
    </Page>
  );
}

export default HomePage;
