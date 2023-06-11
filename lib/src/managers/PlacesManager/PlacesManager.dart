

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/managers/PlacesManager/Decodables/PlacesListDecodable.dart';
import 'package:delivery_app/src/managers/PlacesManager/Interfaces/PlacesManagerInterfaces.dart';
import 'package:delivery_app/src/services/FirebaseServices/RealtimeDatabaseService/Interface/Interface.dart';
import 'package:delivery_app/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';
import 'package:delivery_app/src/services/GeolocationService/Interface/GeolocationServiceInterfaces.dart';
import 'package:delivery_app/src/services/GeolocationService/Service/GeolocationService.dart';
import 'package:delivery_app/src/services/GeolocationService/Service/GeolocationServiceHelper.dart';
import 'package:delivery_app/src/services/GeolocationService/Service/MockGeolocationService.dart';

class DefaultPlacesManager extends PlacesManager {

  final placeListPath = "placeList";
  double distanceRange = 10.0;

  //Dependencias
  final RealtimeDatabaseService _realtimeDatabaseService;
  final GeolocationService _geolocationService;
  final GeolocationServiceHelper _geolocationServiceHelper;

  DefaultPlacesManager({
    RealtimeDatabaseService? realtimeDatabaseService,
    GeolocationService? geolocationService,
    GeolocationServiceHelper? geolocationServiceHelper
  }) :  _realtimeDatabaseService = realtimeDatabaseService ?? DefaultRealtimeDatabaseService(),
        _geolocationService = geolocationService ?? MockGeolocationService(), // Bueno: DefaultGeolocationServices MOCK: MockGeolocationService ,
        _geolocationServiceHelper = geolocationServiceHelper ?? DefaultGeolocationServiceHelper();

  @override
  Future<PlaceListDecodable> fetchPlaceList() async {
    try {
      final response = await _realtimeDatabaseService.getData(path: placeListPath);
      final userPosition = await _geolocationService.getCurrentPosition();
      PlaceListDecodable decodable = mapToPlaceListDecodable(response: response);

      decodable.placeList = mapNearPlaceList(
        placeList: decodable.placeList ?? [], 
        userLat: userPosition.value?.latitude ?? 0.0, 
        userLng: userPosition.value?.longitude ?? 0.0,
      );

      return decodable;

    } on Failure catch (f) {
      return Future.error(f);
    }
  }

  @override
  Future<PlaceListDecodable> fetchNoveltyPlaceList() async {
    
    final fullPlaceList = await fetchPlaceList();
    fullPlaceList.placeList =  mapNoveltyPlaceList(placeList: fullPlaceList.placeList ?? []);
    
    return fullPlaceList;
  }  

  @override
  Future<PlaceListDecodable> fetchPopularPlacesList() async {

    final fullPlaceList = await fetchPlaceList();
    fullPlaceList.placeList =  mapPopularPlaceList(placeList: fullPlaceList.placeList ?? []);
    
    return fullPlaceList;
  }

  @override
  Future<PlaceListDecodable> fetchPlaceListByCategory({required int categoryId}) async {
    
    final fullPlaceList = await fetchPlaceList();

    fullPlaceList.placeList = mapPlaceListByCategory(placeList: fullPlaceList.placeList ?? [], categoryId: categoryId);

    return fullPlaceList;
  }

  @override
  Future<PlaceListDecodable> fetchPlaceListByQuery({ required String query }) async {

    final fullPlaceList = await fetchPlaceList();

    fullPlaceList.placeList = mapPlaceListByQuery(placeList: fullPlaceList.placeList ?? [], query: query);

    return fullPlaceList;
  }

  @override
  Future<PlaceListDecodable> fetchPlaceListByRecentSearches({ required List<String> placeIds }) async {

    final fullPlaceList = await fetchPlaceList();

    fullPlaceList.placeList = mapPlaceListByRecentSearches(placeList: fullPlaceList.placeList ?? [], placeIds: placeIds);

    return fullPlaceList;
  }

  


}

extension Mappers on DefaultPlacesManager {
  PlaceListDecodable mapToPlaceListDecodable({ required Map<String,dynamic> response }) {
    List<PlaceList> placeList = [];

    response.forEach((key, value) { 
      placeList.add(PlaceList.fromJson(value));
    });

    return PlaceListDecodable(placeList: placeList);
  }
 
  List<PlaceList> mapNearPlaceList({ 
    required List<PlaceList> placeList,
    required double userLat,
    required double userLng,
  }) {
    List<PlaceList> placeListFiltered = [];
    placeList.forEach((place) { 
      double distance = _geolocationServiceHelper.getDistanceBetweenInKilometers(userLat, userLng, place.lat, place.long);
      if(distance <= distanceRange && place.status == "active") {
        placeListFiltered.add(place);
      }
    });
    return placeListFiltered;
  }

  List<PlaceList> mapNoveltyPlaceList ({ required List<PlaceList> placeList }){
    List<PlaceList> placeListFiltered = [];

    placeList.forEach((place) {
      if(place.isNovelty){
        placeListFiltered.add(place);
      }
    });

    return placeListFiltered;
  }

  List<PlaceList> mapPopularPlaceList ({ required List<PlaceList> placeList }){
    List<PlaceList> placeListFiltered = [];

    placeList.forEach((place) {
      if(place.isPopularThisWeek){
        placeListFiltered.add(place);
      }
    });

    return placeListFiltered;
  }

  List<PlaceList> mapPlaceListByCategory ({ required List<PlaceList> placeList, required int categoryId }){
    List<PlaceList> placeListFiltered = [];

    placeList.forEach((place) {
      if(place.collectionId == categoryId ){
        placeListFiltered.add(place);
      }
    });

    return placeListFiltered;
  }

  List<PlaceList> mapPlaceListByQuery ({ required List<PlaceList> placeList, required String query }){

    List<PlaceList> placeListFiltered = [];

    placeList.forEach((place) {
      if( query.isNotEmpty && place.placeName.toLowerCase().contains(query.toLowerCase()) ){
        placeListFiltered.add(place);
      }
    });

    return placeListFiltered;
  }

  List<PlaceList> mapPlaceListByRecentSearches ({ required List<PlaceList> placeList, required List<String> placeIds }){

    List<PlaceList> placeListFiltered = [];

    for( var placeId in placeIds ) {
      placeList.forEach((place) { 
        if( place.placeId == placeId ) {
          placeListFiltered.add(place);
        }
      });
    }

    return placeListFiltered;
  }
}