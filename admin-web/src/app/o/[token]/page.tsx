import OrderClient from './OrderClient';

export default async function OrderPage({ params }: { params: Promise<{ token: string }> }) {
  const resolvedParams = await params;
  return <OrderClient token={resolvedParams.token} />;
}
