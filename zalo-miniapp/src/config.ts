export const ZALO_APP_ID = '1461214829004884180';

export const API_BASE =
  import.meta.env.VITE_API_URL || 'https://kanposvn-admin.vercel.app';

export interface ZaloUser {
  id: string;
  full_name: string;
  phone: string;
  zalo_id: string;
  email?: string;
}

export interface SoftwareItem {
  app_code: string;
  app_name: string;
  description?: string;
  price: number | null;
  show_in_registration: boolean;
}

export interface UserLicense {
  id: string;
  app_code: string;
  app_name: string;
  plan: string;
  status: string;
  started_at: string;
  expires_at: string | null;
  branch_id: string | null;
  branch_name?: string;
  device_id?: string;
}

export interface CustomerBranch {
  id: string;
  branch_code: string;
  name: string;
  phone?: string;
  address?: string;
  app_code: string;
  app_name: string;
  is_default: boolean;
  license?: {
    plan: string;
    status: string;
    expires_at: string | null;
  } | null;
}

export interface LoginResponse {
  user: ZaloUser;
  is_new: boolean;
  licenses: UserLicense[];
  error?: string;
}
