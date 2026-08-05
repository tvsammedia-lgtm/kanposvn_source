import { atom } from "jotai";

export interface UserState {
  zalo_id?: string;
  name?: string;
  phone?: string;
  email?: string;
  shop_name?: string;
  token?: string;
}

export const userAtom = atom<UserState>({});

export const lastAppCodeAtom = atom<string>("kanposvncafe");
