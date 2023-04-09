
import 'package:shared_preferences/shared_preferences.dart';

import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';

class DefaultSaveLocalStorageRepository extends SaveLocalStorageRepository {

  //Dependencias
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();


  @override
  Future<void> saveInLocalStorage({required String key, required String value}) async {
    
    final SharedPreferences preferences = await prefs;

    await preferences.setString(key, value);
  }
  
}