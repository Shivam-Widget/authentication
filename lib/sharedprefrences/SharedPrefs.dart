import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper? _instance;
  static SharedPreferences? _prefs;

  static Future<SharedPreferencesHelper?> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesHelper();
      _prefs = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String? get accessToken {
    String? token = _prefs?.getString('accessToken');
    if (token != null && token.isNotEmpty) {
      return 'Bearer $token';
    }
    return null;
  }

  static int? get companyId {
    int? companyId = _prefs?.getInt('companyId');
    if (companyId != null) {
      return companyId;
    }
    return null;
  }

  static int? get userId {
    int? userId = _prefs?.getInt('id');
    if (userId != null) {
      return userId;
    }
    return null;
  }

  static int? get roleId {
    int? roleId = _prefs?.getInt('roleId');
    if (roleId != null) {
      return roleId;
    }
    return null;
  }

  static String? get imageUrl {
    String? imageUrl = _prefs?.getString('imageUrl');
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return imageUrl;
    }
    return null;
  }

  static Future<void> clear() async {
    await _prefs?.clear();
  }
}
