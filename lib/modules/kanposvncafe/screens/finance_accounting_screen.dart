import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/cafe_providers.dart';

class FinanceAccountingScreen extends ConsumerWidget {
  const FinanceAccountingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(cafeAccountingSummaryProvider);
    final txs = ref.watch(cafeCashTransactionsProvider);
    final currency = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            indicatorColor: Color(0xFFD97706),
            labelColor: Color(0xFFD97706),
            tabs: [
              Tab(icon: Icon(Icons.receipt_long), text: 'Báo Cáo Kế Toán'),
              Tab(icon: Icon(Icons.attach_money), text: 'Sổ Thu Chi (Cash)'),
              Tab(icon: Icon(Icons.people_outline), text: 'Công Nợ'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Accounting Financial Statements
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Income Statement (Báo cáo kết quả kinh doanh)
                  _buildSectionHeader('1. Báo Cáo Kết Quả Kinh Doanh'),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _buildReportRow(
                            'Tổng Doanh thu Bán hàng:',
                            currency.format(report.totalRevenue),
                            isBold: true,
                          ),
                          const Divider(),
                          _buildReportRow(
                            '- Giá vốn hàng bán (COGS):',
                            '-${currency.format(report.totalCostOfGoodsSold)}',
                          ),
                          _buildReportRow(
                            '- Chi phí vận hành (Điện, nước, thuê, lương...):',
                            '-${currency.format(report.totalOperatingExpenses)}',
                          ),
                          const Divider(),
                          _buildReportRow(
                            'LỢI NHUẬN THUẦN (LÃI/LỖ):',
                            currency.format(report.netProfit),
                            isBold: true,
                            color: report.netProfit >= 0
                                ? Colors.green
                                : Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Balance Sheet (Bảng cân đối kế toán)
                  _buildSectionHeader('2. Bảng Cân Đối Kế Toán'),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'TÀI SẢN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildReportRow(
                            '• Tiền mặt tồn quỹ:',
                            currency.format(report.cashInHand),
                          ),
                          _buildReportRow(
                            '• Tiền gửi ngân hàng:',
                            currency.format(report.bankBalance),
                          ),
                          _buildReportRow(
                            '• Phải thu khách hàng (Công nợ):',
                            currency.format(report.customerDebts),
                          ),
                          _buildReportRow(
                            '• Giá trị hàng tồn kho:',
                            currency.format(report.inventoryValue),
                          ),
                          const Divider(),
                          _buildReportRow(
                            'TỔNG TÀI SẢN:',
                            currency.format(report.totalAssets),
                            isBold: true,
                            color: Colors.blue.shade900,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'NGUỒN VỐN & NỢ PHẢI TRẢ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildReportRow(
                            '• Phải trả nhà cung cấp:',
                            currency.format(report.supplierDebts),
                          ),
                          _buildReportRow(
                            '• Vốn chủ sở hữu:',
                            currency.format(report.ownerEquity),
                          ),
                          _buildReportRow(
                            '• Lợi nhuận tích lũy chưa phân phối:',
                            currency.format(report.netProfit),
                          ),
                          const Divider(),
                          _buildReportRow(
                            'TỔNG NGUỒN VỐN:',
                            currency.format(report.totalLiabilitiesAndEquity),
                            isBold: true,
                            color: Colors.purple.shade900,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Tab 2: Cash Book Transactions
            ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: txs.length,
              itemBuilder: (ctx, i) {
                final tx = txs[i];
                final isIncome = tx.type == 'INCOME';
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isIncome
                          ? Colors.green.shade100
                          : Colors.red.shade100,
                      child: Icon(
                        isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                        color: isIncome ? Colors.green : Colors.red,
                      ),
                    ),
                    title: Text(
                      tx.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${tx.category} • ${tx.paymentMethod} • ${tx.performerName}',
                    ),
                    trailing: Text(
                      '${isIncome ? "+" : "-"}${currency.format(tx.amount)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: isIncome ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
            // Tab 3: Debts Overview
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    color: Colors.blue.shade50,
                    child: ListTile(
                      leading: const Icon(
                        Icons.account_balance_wallet,
                        color: Colors.blue,
                      ),
                      title: const Text('Công nợ phải thu Khách hàng'),
                      trailing: Text(
                        currency.format(report.customerDebts),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    color: Colors.orange.shade50,
                    child: ListTile(
                      leading: const Icon(
                        Icons.request_quote,
                        color: Colors.orange,
                      ),
                      title: const Text('Công nợ phải trả Nhà cung cấp'),
                      trailing: Text(
                        currency.format(report.supplierDebts),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFFD97706),
        ),
      ),
    );
  }

  Widget _buildReportRow(
    String label,
    String value, {
    bool isBold = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
              fontSize: isBold ? 15 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
