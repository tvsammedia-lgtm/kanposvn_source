import 'package:flutter/material.dart';

import '../../../core/reports/crystal_report_models.dart';

/// Bộ widget mô phỏng định dạng báo cáo Crystal Reports (.rpt) của KANHOT:
/// tiêu đề, bảng kẻ ô, dòng tổng cộng, khối chữ ký cuối trang.

class CrystalReportView extends StatelessWidget {
  final CrystalReportModel report;
  final double detailFontSize;

  const CrystalReportView({
    super.key,
    required this.report,
    this.detailFontSize = 11,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(28, 20, 28, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFormLine(theme),
          const SizedBox(height: 6),
          _buildUnitLine(theme),
          if (report.unitAddress != null) ...[
            const SizedBox(height: 2),
            Text(
              report.unitAddress!,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
            ),
          ],
          if (report.taxCode != null) ...[
            const SizedBox(height: 2),
            Text(
              report.taxCode!,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
            ),
          ],
          const SizedBox(height: 18),
          _buildTitle(theme),
          if (report.titleSub != null) ...[
            const SizedBox(height: 4),
            _buildCentered(theme, report.titleSub!, 12, italic: true),
          ],
          for (final line in report.subtitleLines) ...[
            const SizedBox(height: 2),
            _buildCentered(theme, line, 12),
          ],
          const SizedBox(height: 14),
          _buildTable(theme),
          const SizedBox(height: 12),
          if (report.noteLine != null) ...[
            Text(
              report.noteLine!,
              style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: theme.colorScheme.onSurface),
            ),
            const SizedBox(height: 12),
          ],
          if (report.signature.isNotEmpty) _buildSignature(theme),
        ],
      ),
    );
  }

  Widget _buildFormLine(ThemeData theme) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        report.formLine,
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 9.5, color: theme.colorScheme.onSurfaceVariant),
      ),
    );
  }

  Widget _buildUnitLine(ThemeData theme) {
    return Text(
      report.unitName,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        report.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildCentered(ThemeData theme, String text, double size, {bool italic = false}) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: size,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildTable(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header rows
        for (var r = 0; r < report.headerRows.length; r++) _buildHeaderRow(theme, report.headerRows[r]),
        // Data rows
        for (final row in report.rows) _buildBodyRow(theme, row, isTotal: false),
        // Total rows
        for (final row in report.totalRows) _buildBodyRow(theme, row, isTotal: true),
      ],
    );
  }

  Widget _buildHeaderRow(ThemeData theme, List<ReportHeaderCell> cells) {
    var leaf = 0;
    final children = <Widget>[];
    for (final cell in cells) {
      var span = 0;
      for (var i = 0; i < cell.colspan; i++) {
        span += report.columnFlex[leaf + i];
      }
      leaf += cell.colspan;
      children.add(
        Expanded(
          flex: span,
          child: _borderCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              child: Text(
                cell.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            boldBottom: true,
          ),
        ),
      );
    }
    return Row(children: children);
  }

  Widget _buildBodyRow(ThemeData theme, ReportRow row, {required bool isTotal}) {
    if (row.isEmpty) {
      // Dòng phân cách trống
      return SizedBox(height: 6);
    }
    final cells = row.cells;
    final children = <Widget>[];
    for (var i = 0; i < report.columnFlex.length; i++) {
      final cell = (i < cells.length) ? cells[i] : const ReportCell('');
      children.add(
        Expanded(
          flex: report.columnFlex[i],
          child: _borderCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text(
                cell.text,
                textAlign: _alignOf(cell.align),
                style: TextStyle(
                  fontSize: isTotal ? detailFontSize : detailFontSize,
                  fontWeight: cell.isBold || isTotal ? FontWeight.bold : FontWeight.normal,
                  fontStyle: cell.isItalic || row.isSection ? FontStyle.italic : FontStyle.normal,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            boldTop: isTotal,
          ),
        ),
      );
    }
    return Row(children: children);
  }

  TextAlign _alignOf(ReportCellAlign align) {
    switch (align) {
      case ReportCellAlign.left:
        return TextAlign.left;
      case ReportCellAlign.center:
        return TextAlign.center;
      case ReportCellAlign.right:
        return TextAlign.right;
    }
  }

  Widget _borderCell({required Widget child, bool boldTop = false, bool boldBottom = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: const BorderSide(color: Color(0xFF000000), width: 0.4),
          top: BorderSide(color: const Color(0xFF000000), width: boldTop ? 1.2 : 0.4),
          right: const BorderSide(color: Color(0xFF000000), width: 0.4),
          bottom: BorderSide(color: const Color(0xFF000000), width: boldBottom ? 1.2 : 0.4),
        ),
      ),
      child: child,
    );
  }

  Widget _buildSignature(ThemeData theme) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = constraints.maxWidth / report.signature.length;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final item in report.signature)
                  SizedBox(
                    width: itemWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          const SizedBox(height: 36),
                          Text(
                            item.role,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item.sub,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 9.5,
                              fontStyle: FontStyle.italic,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

/// Tiêu đề danh sách báo cáo (dùng chung trong panel trái).
class ReportSectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const ReportSectionHeader({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Một mục báo cáo trong danh sách.
class ReportListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const ReportListItem({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        color: selected ? theme.colorScheme.primary.withValues(alpha: 0.12) : null,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: selected ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  color: selected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
