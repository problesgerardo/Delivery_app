import 'package:shared_preferences/shared_preferences.dart';

import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';

class DefaultFetchLocalStorageRepository extends FetchLocalStorageRepository {

  //Dependencias
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Future<String?> fetchInLocalStorage({required String key}) async {
    
    final SharedPreferences preferences = await prefs;

    return preferences.getString(key);

  }


}