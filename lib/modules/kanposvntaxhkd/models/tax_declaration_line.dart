import 'package:isar/isar.dart';

part 'tax_declaration_line.g.dart';

@collection
class TaxDeclarationLine {
  Id id = Isar.autoIncrement;

  @Index()
  String? declarationId; // foreign key to TaxDeclaration
  
  String? industryCode;
  String? industryName;
  
  double? revenueAmount;
  double? vatRate;
  double? vatAmount;
  double? pitRate;
  double? pitAmount;
  
  String? notes;
}
