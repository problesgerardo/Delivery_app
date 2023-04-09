import 'package:shared_preferences/shared_preferences.dart';

import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';

class DefaultRemoveLocalStorageRepository extends RemoveLocalStorageRepository {

  //Dependencias
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();


  @override
  Future<void> removeInLocalStorage({required String key}) async {
    
    final SharedPreferences preferences = await prefs;

    preferences.remove(key);
  }

}