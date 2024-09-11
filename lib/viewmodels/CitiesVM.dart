

import '../models/City.dart';

class CitiesVM{
  List<City>loadCities(){

    return [
      City(name : " morning", value : "m"),
      City(name : " after noon" , value : "n"),
      City(name : " evening" , value : "e"),

    ];



  }
}