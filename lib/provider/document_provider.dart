import 'package:authentication/models/document_type_model.dart';
import 'package:flutter/cupertino.dart';
import '../services/api_service.dart';

class DocumentProvider extends ChangeNotifier {
  late DocumentTypeModel docListModel = DocumentTypeModel();
  bool loading = false;
  ApiService services = ApiService();
  getDocumentType(context) async {
    loading = true;
    DocumentTypeModel? result = (await services.getDocumentType(context)) as DocumentTypeModel?;
    docListModel = result ?? DocumentTypeModel();
    loading = false;
    notifyListeners();
  }
}




