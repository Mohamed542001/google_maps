import 'dart:convert';

import 'package:google_maps/features/map_screen/data/models/prediction_place_model.dart';
import 'package:http/http.dart' as http;

class GoogleMapsPlacesServices{

  static String baseUrl = 'https://maps.googleapis.com/maps/api/place/';
  static String apiKey = 'AIzaSyC_nm6H6vlaMqr0M_mJUCSutST4bPr798U';

  static Future<List<PredictionPlaceModel>> getPredictionPlaces({required String input})async{
    var response = await http.get(Uri.parse("${baseUrl}autocomplete/json?key=$apiKey&input=$input"));
    if(response.statusCode==200){
      print("object123");
      var data = jsonDecode(response.body)['predictions'];
      List<PredictionPlaceModel> places=[];
      for(var item in data){
        places.add(PredictionPlaceModel.fromJson(item));
      }
      return places;
    }else{
      throw Exception();

    }
  }
}