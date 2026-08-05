import { getUserInfo, openWebview } from "zmp-sdk/apis";

export interface ZaloUser {
  id: string;
  name: string;
  avatar?: string;
}

export async function getZaloProfile(): Promise<ZaloUser | null> {
  try {
    const { userInfo } = await getUserInfo({});
    return {
      id: String(userInfo.id),
      name: String(userInfo.name || ""),
      avatar: userInfo.avatar || undefined,
    };
  } catch (e) {
    console.warn("getUserInfo failed", e);
    return null;
  }
}

export async function openUrl(url: string): Promise<boolean> {
  try {
    await openWebview({ url });
    return true;
  } catch (e) {
    console.warn("openWebview failed", e);
    window.open(url, "_blank");
    return true;
  }
}

export async function copyText(text: string): Promise<boolean> {
  try {
    await navigator.clipboard.writeText(text);
    return true;
  } catch {
    try {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      (window as any).prompt?.("Copy link:", text);
    } catch {
      /* ignore */
    }
    return false;
  }
}
