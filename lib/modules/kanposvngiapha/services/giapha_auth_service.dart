import '../models/giapha_family.dart';
import '../models/giapha_user.dart';

class GiaphaAuthService {
  GiaphaUser? _currentUser;
  GiaphaFamily? _currentFamily;
  
  GiaphaUser? get currentUser => _currentUser;
  GiaphaFamily? get currentFamily => _currentFamily;

  void login(GiaphaUser user) {
    _currentUser = user;
  }
  
  void selectFamily(GiaphaFamily family) {
    _currentFamily = family;
  }
  
  void logout() {
    _currentUser = null;
    _currentFamily = null;
  }
  
  bool isAuthenticated() {
    return _currentUser != null;
  }
}
