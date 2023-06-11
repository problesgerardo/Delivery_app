

import 'package:delivery_app/src/managers/PlacesManager/Decodables/PlacesListDecodable.dart';

abstract class PlacesManager {
  Future <PlaceListDecodable> fetchPlaceList();
  Future <PlaceListDecodable> fetchNoveltyPlaceList();
  Future <PlaceListDecodable> fetchPopularPlacesList();
  Future <PlaceListDecodable> fetchPlaceListByCategory({ required int categoryId});
  Future <PlaceListDecodable> fetchPlaceListByQuery({ required String query});
  Future <PlaceListDecodable> fetchPlaceListByRecentSearches({ required List<String> placeIds });
}