import '../models/tax_declaration.dart';

abstract class TaxExportService {
  Future<String> exportToExcel(TaxDeclaration declaration);
  Future<String> exportToPdf(TaxDeclaration declaration);
}

class TaxExportServiceImpl implements TaxExportService {
  @override
  Future<String> exportToExcel(TaxDeclaration declaration) async {
    // TODO: Implement using 'excel' package
    return 'path/to/exported/excel.xlsx';
  }

  @override
  Future<String> exportToPdf(TaxDeclaration declaration) async {
    // TODO: Implement using 'pdf' and 'printing' packages
    return 'path/to/exported/pdf.pdf';
  }
}
