import { getSystemInfo } from "zmp-sdk";
import {
  AnimationRoutes,
  App,
  Route,
  SnackbarProvider,
  ZMPRouter,
} from "zmp-ui";
import { AppProps } from "zmp-ui/app";

import HomePage from "@/pages/index";
import RegisterPage from "@/pages/register";
import PaymentPage from "@/pages/payment";
import RenewPage from "@/pages/renew";
import DownloadPage from "@/pages/download";

const Layout = () => {
  return (
    <App theme={getSystemInfo().zaloTheme as AppProps["theme"]}>
      <SnackbarProvider>
        <ZMPRouter>
          <AnimationRoutes>
            <Route path="/" element={<HomePage />} />
            <Route path="/register" element={<RegisterPage />} />
            <Route path="/payment" element={<PaymentPage />} />
            <Route path="/renew" element={<RenewPage />} />
            <Route path="/download" element={<DownloadPage />} />
          </AnimationRoutes>
        </ZMPRouter>
      </SnackbarProvider>
    </App>
  );
};
export default Layout;
