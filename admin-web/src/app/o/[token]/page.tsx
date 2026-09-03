import OrderClient from './OrderClient';

export default function OrderPage({ params }: { params: { token: string } }) {
  return <OrderClient token={params.token} />;
}
