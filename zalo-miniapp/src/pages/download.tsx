import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import {
  Box,
  Button,
  Header,
  Icon,
  Page,
  Spinner,
  Text,
  useSnackbar,
} from "zmp-ui";

import { getJson } from "@/services/api";
import { copyText, openUrl } from "@/services/zalo";

interface Asset {
  name: string;
  size: number;
  browser_download_url: string;
}

interface UpdateInfo {
  success: boolean;
  has_update: boolean;
  latest_version: string | null;
  tag_name?: string;
  name?: string;
  notes?: string;
  published_at?: string | null;
  download_url?: string;
  assets?: Asset[];
  message?: string;
}

function formatBytes(bytes: number): string {
  if (!bytes) return "";
  const mb = bytes / 1024 / 1024;
  return mb > 1024 ? `${(mb / 1024).toFixed(1)} GB` : `${mb.toFixed(1)} MB`;
}

function DownloadPage() {
  const navigate = useNavigate();
  const snackbar = useSnackbar();
  const [info, setInfo] = useState<UpdateInfo | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    getJson("/api/update/latest")
      .then(setInfo)
      .catch((e) => setInfo({ success: false, has_update: false, latest_version: null, message: e.message }))
      .finally(() => setLoading(false));
  }, []);

  const apkAssets = (info?.assets || []).filter((a) => a.name.endsWith(".apk"));

  const handleDownload = async (url: string) => {
    await openUrl(url);
  };

  const handleCopy = async () => {
    if (!info?.download_url) return;
    const ok = await copyText(info.download_url);
    snackbar.openSnackbar({
      text: ok ? "Đã sao chép link tải" : "Mở trình duyệt để tải APK",
      type: ok ? "success" : "info",
    });
  };

  return (
    <Page className="page">
      <Header title="Tải POS" showBackIcon onBackClick={() => navigate(-1)} />
      <Box className="brand-header mb-4">
        <Text.Title className="!text-white">Tải KanPosVN POS</Text.Title>
        <Text className="!text-white/90">
          Phần mềm quản lý bán hàng cho Android
        </Text>
      </Box>

      <Box className="section-container space-y-3">
        {loading ? (
          <Box className="flex justify-center py-6">
            <Spinner />
          </Box>
        ) : info?.has_update ? (
          <>
            <Box className="flex items-center gap-2">
              <Icon icon="zi-check-circle" />
              <Text bold>Phiên bản mới nhất: v{info.latest_version}</Text>
            </Box>
            {info.published_at && (
              <Text className="text-sm !text-slate-500">
                Ngày phát hành: {new Date(info.published_at).toLocaleDateString("vi-VN")}
              </Text>
            )}
            {info.notes && (
              <Text className="text-sm whitespace-pre-line">{info.notes.slice(0, 500)}</Text>
            )}

            <Text.Title size="small" className="!mt-2">Tải APK</Text.Title>
            {apkAssets.length > 0 ? (
              apkAssets.map((asset) => (
                <Button
                  key={asset.name}
                  fullWidth
                  variant="primary"
                  prefixIcon={<Icon icon="zi-download" />}
                  onClick={() => handleDownload(asset.browser_download_url)}
                >
                  {asset.name.replace("app-release.apk", "APK phổ thông").replace("-release.apk", "")}
                  {formatBytes(asset.size) ? ` (${formatBytes(asset.size)})` : ""}
                </Button>
              ))
            ) : info.download_url ? (
              <Button fullWidth variant="primary" onClick={() => handleDownload(info.download_url!)}>
                Tải APK mới nhất
              </Button>
            ) : null}

            <Button fullWidth variant="secondary" onClick={handleCopy}>
              Sao chép link tải
            </Button>
          </>
        ) : (
          <>
            <Text>Chưa có bản phát hành nào trên GitHub.</Text>
            <Text className="text-sm !text-slate-500">{info?.message || ""}</Text>
          </>
        )}
      </Box>

      <Box className="section-container">
        <Text className="text-sm !text-slate-500">
          Lưu ý: Cài đặt APK cần bật "Cho phép cài đặt từ nguồn không xác định" trong cài đặt Android.
        </Text>
      </Box>
    </Page>
  );
}

export default DownloadPage;
