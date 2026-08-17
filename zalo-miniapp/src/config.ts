export const API_BASE =
  import.meta.env.VITE_API_URL || 'https://kanposvn.vercel.app';

export interface ZaloUser {
  id: string;
  full_name: string;
  phone: string;
  zalo_id: string;
}

export interface Branch {
  id: string;
  branch_code: string;
  name: string;
  phone: string;
  address: string;
  is_default: boolean;
}

export interface AppLicense {
  plan: string;
  status: string;
  expires_at: string | null;
}

export interface AppModule {
  app_code: string;
  app_name: string;
  branches: Branch[];
  license: AppLicense | null;
}

export interface LoginResponse {
  user: ZaloUser;
  is_new: boolean;
  apps: AppModule[];
}
